This repository contains build scripts and packages for the OpenWrt system on Tessel 2. It overlays
a lightly-modified OpenWrt tree to build a Tessel-customized OpenWrt, replacing the use of
`menuconfig` with a version-controlled configuration from this repository.

### Building

Building the toolchain and all system packages requires a fast Linux system and several GB of disk
space.

```
git clone --recursive https://github.com/tessel/openwrt-tessel.git
cd openwrt-tessel
make -j50
```

The resulting sysupgrade image is
`openwrt/bin/ramips/openwrt-ramips-mt7620-tessel-squashfs-sysupgrade.bin`.

### Dependencies
If you get an error like this (Ubuntu):

```
Build dependency: Please install ncurses. (Missing libncurses.so or ncurses.h)
```
you are required to install some source dependencies:
```
sudo apt-get install zlib1g-dev libncurses5-dev
```

### Related OpenWrt documentation

* [Creating packages](http://wiki.openwrt.org/doc/devel/packages)
* [Working with patches](http://wiki.openwrt.org/doc/devel/patches)
