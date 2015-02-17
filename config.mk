TARGET ?= v2

PACKAGES += rpcd
PACKAGES += rpcd-mod-iwinfo

# USB
PACKAGES += kmod-usb-serial
PACKAGES += kmod-usb-serial-ch341
PACKAGES += kmod-usb-serial-ftdi
PACKAGES += kmod-usb-serial-pl2303
PACKAGES += libusb-1.0
PACKAGES += usbutils

# Storage
PACKAGES += kmod-usb-storage
PACKAGES += kmod-usb-storage-extras
PACKAGES += kmod-fs-vfat
PACKAGES += kmod-nls-cp437
PACKAGES += kmod-nls-utf8

# Video (Webcam)
PACKAGES += kmod-video-core
PACKAGES += kmod-video-uvc
PACKAGES += v4l-utils
PACKAGES += libv4l
PACKAGES += mjpg-streamer

# Bluetooth
PACKAGES += kmod-bluetooth
PACKAGES += bluez-libs
PACKAGES += bluez-utils

# Utilities
PACKAGES += nano
PACKAGES += dmesg

# JavaScript
PACKAGES += iojs
