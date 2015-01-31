default: world

OPENWRT_DIR  	:= openwrt
GIT_VERSION     := $(git rev-parse HEAD)

include config.mk
include target/$(TARGET)/config.mk

OPENWRT_MAKE := +$(MAKE) -C $(OPENWRT_DIR)

print-%: ; $(info $* = $($*))

# Include CONFIG_* vars from included makefiles in OpenWRT configuration
CFG += $(foreach V, $(filter CONFIG_%, $(.VARIABLES)),\n$V=$($V))

# Enable packages in OpenWRT configuration
CFG += $(foreach P, $(PACKAGES),\nCONFIG_PACKAGE_$(P)=y) 
export CFG

MK = config.mk target/$(TARGET)/config.mk

openwrt/.config: $(MK) openwrt openwrt/feeds.conf
	echo "$$CFG" > openwrt/.config
	$(OPENWRT_MAKE) defconfig

openwrt/feeds.conf: $(MK)
	cp feeds.conf openwrt/feeds.conf
	+cd openwrt; ./scripts/feeds update -a
	+cd openwrt; ./scripts/feeds install $(PACKAGES)

openwrt/files:
	ln -s ../files openwrt/files

download: openwrt/.config openwrt/feeds.conf
	$(OPENWRT_MAKE) download

toolchain: openwrt/.config
	$(OPENWRT_MAKE) toolchain

world: openwrt/.config openwrt/files openwrt/feeds.conf
	$(OPENWRT_MAKE) world PROFILE=$(PROFILE)

clean:
	$(OPENWRT_MAKE) clean
	rm -f openwrt/feeds.conf openwrt/.config

update:
	git submodule update
	rm -f openwrt/feeds.conf openwrt/.config

.PHONY: download toolchain world clean update