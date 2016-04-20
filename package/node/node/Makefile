include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=v4.4.3
PKG_RELEASE:=1

PKG_SOURCE:=node-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://nodejs.org/dist/${PKG_VERSION}/
PKG_SHA256SUM:=8e67b95721aab7bd721179da2fe5dd97f9acc1306c15c9712ee103bcd6381638

PKG_BUILD_PARALLEL:=1
PKG_BUILD_DEPENDS:=

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

ifeq ($(ARCH),i386)
  DEST_CPU=ia32
else
  DEST_CPU=$(ARCH)
endif


CONFIGURE_ARGS = --dest-cpu=$(DEST_CPU) --dest-os=linux \
  --shared-openssl --shared-openssl-includes="$(STAGING_DIR)/usr/include" --shared-openssl-libpath="$(STAGING_DIR)/usr/lib" \
  --shared-zlib --shared-zlib-includes="$(STAGING_DIR)/usr/include" --shared-zlib-libpath="$(STAGING_DIR)/usr/lib" \
  --v8-options="--max_old_space_size=20 --initial_old_space_size=4 --max_semi_space_size=2 --max_executable_size=5" \
  --without-snapshot

ifeq ($(ARCH),mipsel)
  CONFIGURE_ARGS += \
   --with-mips-arch-variant=r2 --with-mips-fpu-mode=fp32 --with-mips-float-abi=soft
endif

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

