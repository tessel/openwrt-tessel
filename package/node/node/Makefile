include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=v6.11.2
PKG_RELEASE:=1

PKG_SOURCE:=node-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://nodejs.org/dist/${PKG_VERSION}/
PKG_SHA256SUM:=04af4992238b19124ea56f1bcfda36827613a24eb3b00fc3b50f261a415a26e4

# From : https://github.com/tessel/openwrt-tessel/blob/bc3316cd4458a5359166daf5684e9906a9ef7851/package/node/node/Makefile
# {
HOST_BUILD_DEPENDS:=python/host
PKG_BUILD_DEPENDS:=python/host
PKG_INSTALL:=1
PKG_USE_MIPS16:=0

HOST_BUILD_PARALLEL:=1
# }

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/node
  DEPENDS:=+libpthread +librt +libstdcpp +libopenssl +zlib
  SUBMENU:=Node
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node is a JavaScript runtime built on Chrome's V8 JavaScript engine
  URL:=https://nodejs.org/
endef

define Package/node/description
Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine
endef

define Package/npm
  DEPENDS:=+node
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node/io.js Package Manager
  URL:=https://npmjs.org/
endef

# From : https://github.com/tessel/openwrt-tessel/blob/bc3316cd4458a5359166daf5684e9906a9ef7851/package/node/node/Makefile
# {
CPU:=$(subst aarch64,arm64,$(subst x86_64,x64,$(subst i386,ia32,$(ARCH))))

MAKE_VARS += \
	DESTCPU=$(CPU)
# }

ifeq ($(ARCH),i386)
  DEST_CPU=ia32
else
  DEST_CPU=$(ARCH)
endif


CONFIGURE_ARGS = \
	--dest-cpu=$(DEST_CPU) \
	--dest-os=linux \
	--without-snapshot \
	--shared-zlib \
	--shared-openssl \
	--prefix=/usr \
	--v8-options="--max_old_space_size=20 --initial_old_space_size=4 --max_semi_space_size=2 --max_executable_size=5 --optimize_for_size" \
	--without-inspector \
	--without-dtrace \
	--without-intl

ifeq ($(ARCH),mipsel)
	CONFIGURE_ARGS += \
	 --with-mips-arch-variant=r2 \
	 --with-mips-fpu-mode=fp32 \
	 --with-mips-float-abi=soft
endif

# From : https://github.com/tessel/openwrt-tessel/blob/bc3316cd4458a5359166daf5684e9906a9ef7851/package/node/node/Makefile
# {
HOST_CONFIGURE_VARS:=

HOST_CONFIGURE_ARGS:= \
	--dest-os=linux \
	--without-snapshot \
	--with-intl=none \
	--prefix=$(STAGING_DIR_HOSTPKG)

HOST_CONFIGURE_CMD:=python ./configure

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
endef
# }

define Package/node/install
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/out/Release/node $(1)/usr/bin/node
endef

define Package/npm/install
	mkdir -p $(1)/usr/lib/node_modules
	$(CP) $(PKG_BUILD_DIR)/deps/npm $(1)/usr/lib/node_modules
	ln -sf /usr/lib/node_modules/npm/bin/npm-cli.js $(1)/usr/bin/npm
endef

$(eval $(call BuildPackage,node))
$(eval $(call BuildPackage,npm))
