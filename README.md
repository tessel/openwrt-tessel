This repository contains build scripts and packages for the OpenWrt system on Tessel 2. It overlays
a lightly-modified OpenWrt tree to build a Tessel-customized OpenWrt, replacing the use of
`menuconfig` with a version-controlled configuration from this repository.

### Building

Building the toolchain and all system packages requires a fast Linux system and several GB of disk
space.

**host env way**
```
# if 32bit host
export CXX_host="g++" && export CC_host="gcc" && export LINK_host="g++"
# if 64bit host
export CXX_host="g++ -m32" && export CC_host="gcc -m32" && export LINK_host="g++ -m32"
```

```
git clone --recursive https://github.com/tessel/openwrt-tessel.git
cd openwrt-tessel
make -j50
```

The resulting sysupgrade image is
`openwrt/bin/ramips/openwrt-ramips-mt7620-tessel-squashfs-sysupgrade.bin`.

### Setup Ubuntu

In general we suggest to prepare a build-server with the following command:
```
sudo apt-get install make gcc g++ subversion unzip libncurses5-dev libncursesw5-dev ncurses-doc zlib1g-dev libssl-dev gettext gawk --yes
```

### Related OpenWrt documentation

* [Creating packages](http://wiki.openwrt.org/doc/devel/packages)
* [Working with patches](http://wiki.openwrt.org/doc/devel/patches)
