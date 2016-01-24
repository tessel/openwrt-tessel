#!/bin/bash -e

if [ $# -ne 1 ]
  then
    echo "Usage: ./release_build.sh RELEASE_VERSION eg. ./release_build.sh 1.0.2"
    exit -1
fi

NEW_VERSION=$1;


# TODO: Get other people access to the build server
# TODO: Use a longer living server
SERVER="gbuild.tessel.io"
# SSH User name
USER="jon"

# Ensure the build dir gets deleted when the script exits
function cleanup {
  ssh $USER@$SERVER rm -rf $BUILD_DIR
  if [ -e $RELEASE_DIR ]
  then
    rm -rf $RELEASE_DIR
  fi
}
trap cleanup EXIT

check_build_result() {
  # Check exit code for error
  if [[ $? != 0 ]]
  then
    echo "Build did not complete successfully. Error code: $?"
    exit
  fi
}
# Create a temporary directory on the server
BUILD_DIR=$(ssh $USER@$SERVER mktemp -d -t "release.XXXXXXXX")

echo "Building OpenWRT...$BUILD_DIR"
ssh $USER@$SERVER << EOF
  # Enter build dir
  cd $BUILD_DIR;
  # Fresh clone of OpenWRT
  #TODO: Add --recursive back in
  git clone https://github.com/tessel/openwrt-tessel.git --depth=1;
  # Enter the cloned OpenWRT directory
  cd openwrt-tessel;
  # Build the firmware
  # make -j50;
EOF

# Check exit code for error
check_build_result

# Extract revision sha
OPENWRT_SHA=$(ssh $USER@$SERVER "cd $BUILD_DIR/openwrt-tessel;git rev-parse --verify HEAD")

echo "Done!"

echo "Building firmware..."
ssh $USER@$SERVER << EOF
  # Ensure we have firmware building deps
  sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded && sudo apt-get update;
  sudo apt-get -y install git gcc-arm-none-eabi;
  # Enter build dir
  cd $BUILD_DIR;
  # Fresh clone of OpenWRT
  git clone https://github.com/tessel/t2-firmware --recursive --depth=1;
  # Enter the cloned OpenWRT directory
  cd t2-firmware;
  # Build the firmware
  make;
EOF

check_build_result

echo "Done!"

# Create a temporary directory on the host machine
RELEASE_DIR=$(mktemp -d -t "tessel-release.XXXXXXXX")
# Download the openwrt build into the temporary directory
# scp $USER@$SERVER:$BUILD_DIR/openwrt/bin/ramips/openwrt-ramips-mt7620-tessel-squashfs-sysupgrade.bin RELEASE_DIR
# Download the firmware build into the temporary directory
scp $USER@$SERVER:$BUILD_DIR/t2-firmware/build/firmware.bin $RELEASE_DIR
echo "It's at $RELEASE_DIR"
# Tar up the builds
cd $RELEASE_DIR/../
echo $(pwd)
tar -zcvf  $OPENWRT_SHA.tar.gz -C $RELEASE_DIR .

# Post this object to s3
aws s3api put-object --bucket builds.tessel.io --acl public-read --body $RELEASE_DIR/../$OPENWRT_SHA.tar.gz --key t2/firmware/ccc6d7efbcf57ef5a222b2eff32e73890c05dafa.tar.gz

# Pull down the builds.json
aws s3api get-object --bucket builds.tessel.io --key t2/firmware/builds.json $RELEASE_DIR/builds.json

EXISTS=$(cat $RELEASE_DIR/builds.json | jsawk 'if (this.version!="'${NEW_VERSION}'") return null' | jsawk "return this.released")

if [ $EXISTS != "[]" ]
then
  echo "Refusing to publish over existing version. Released previously at ${EXISTS})"
  exit 2
fi

# Write the new entry to the file
cat $RELEASE_DIR/builds.json | jsawk -a 'this.push({sha:"'${OPENWRT_SHA}'",released:"'$(date +%s)'",version:"'${NEW_VERSION}'"})' | python -m json.tool > $RELEASE_DIR/updated_builds.json
# Post this object to s3
aws s3api put-object --bucket builds.tessel.io --acl public-read --body $RELEASE_DIR/updated_builds.json --key t2/firmware/builds.json
