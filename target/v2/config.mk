PROFILE=Tessel

CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7620=y
CONFIG_TARGET_PROFILE="DEVICE_tessel"
CONFIG_TARGET_ramips_mt7620_DEVICE_tessel=y

CONFIG_PACKAGE_kmod-rt2800-pci=n
CONFIG_PACKAGE_kmod-rt2x00-pci=n

PACKAGES+=kmod-spi-dev
PACKAGES+=tessel-tools
#PACKAGES+=uboot-mt7620-Default
