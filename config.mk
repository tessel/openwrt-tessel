TARGET ?= v2

# USB
PACKAGES += kmod-usb-serial
PACKAGES += kmod-usb-serial-ch341
PACKAGES += kmod-usb-serial-ftdi
PACKAGES += kmod-usb-serial-pl2303
PACKAGES += kmod-usb-serial-option
PACKAGES += kmod-usb-serial-wwan
PACKAGES += kmod-usb-acm
PACKAGES += kmod-usb-hid
PACKAGES += libusb-1.0
PACKAGES += usbutils

# Storage
PACKAGES += kmod-usb-storage
PACKAGES += kmod-usb-storage-extras
PACKAGES += kmod-fs-vfat
PACKAGES += kmod-nls-cp437
PACKAGES += kmod-nls-utf8
PACKAGES += kmod-nls-iso8859-1
PACKAGES += block-mount

# Video (Webcam)
PACKAGES += kmod-video-core
PACKAGES += kmod-video-uvc
PACKAGES += v4l-utils
PACKAGES += libv4l
PACKAGES += libjpeg

# Bluetooth
PACKAGES += kmod-bluetooth
PACKAGES += bluez-libs
PACKAGES += bluez-utils

# Cellular
PACKAGES += comgt
PACKAGES += usb-modeswitch

# Utilities
PACKAGES += nano
PACKAGES += dmesg
PACKAGES += rpcd
PACKAGES += rpcd-mod-iwinfo
PACKAGES += wget
PACKAGES += ca-certificates

# Sound
PACKAGES += kmod-usb-audio
PACKAGES += kmod-sound-core
PACKAGES += kmod-sound-i8x0
PACKAGES += alsa-lib
PACKAGES += alsa-utils
PACKAGES += libbz2
PACKAGES += ffmpeg
PACKAGES += madplay

# JavaScript
PACKAGES += node
PACKAGES += tessel-app

# Python
PACKAGES += python

# MDNS
PACKAGES += tessel-mdns
PACKAGES += mdns-utils

# Hotplug
PACKAGES += tessel-hotplug

CONFIG_SDK=y

CONFIG_IMAGEOPT=y
CONFIG_VERSIONOPT=y
CONFIG_VERSION_REPO="http://downloads.openwrt.org/chaos_calmer/15.05-rc2/%S/packages"
CONFIG_VERSION_MANUFACTURER="Tessel"
CONFIG_VERSION_FILENAMES=n
