## What is this?
This is a script to deploy new builds to AWS. Currently, it will only work for those with Tessel GCloud and AWS access (which is pretty much just @johnnyman727).

## Install

```
# First install the AWS-CLI so we can post new builds
pip install awscli
aws configure
AWS Access Key ID: XXXX
AWS Secret Access Key: XXXX
Default region name: us-east-1
Default output format [None]: json

# Then install awkjson to parse the builds.json file
brew install awkjson
```

## Usage
```
./release_build.sh 0.0.8 (or whatever version you're publishing)
