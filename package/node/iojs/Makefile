include $(TOPDIR)/rules.mk

PKG_NAME:=iojs
PKG_VERSION:=v1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=iojs-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://iojs.org/dist/${PKG_VERSION}/
PKG_SHA256SUM:=2baa9b076c84c13b0572de4618ac94058fc98a87266925bcd18fb70fb7d521a7

PKG_BUILD_PARALLEL:=1
PKG_BUILD_DEPENDS:=

include $(INCLUDE_DIR)/package.mk

define Package/iojs
  DEPENDS:=+libpthread +librt +libstdcpp +libopenssl +zlib
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=io.js is an npm compatible platform originally based on node.js
  URL:=https://iojs.org/
endef

define Package/iojs/description
io.js is an npm compatible platform originally based on node.js
endef

define Package/npm
  DEPENDS:=+iojs
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node/io.js Package Manager
  URL:=https://npmjs.org/
endef

CONFIGURE_ARGS = --dest-cpu=mipsel --dest-os=linux \
  --shared-openssl --shared-openssl-includes="$(STAGING_DIR)/usr/include" --shared-openssl-libpath="$(STAGING_DIR)/usr/lib" \
  --shared-zlib --shared-zlib-includes="$(STAGING_DIR)/usr/include" --shared-zlib-libpath="$(STAGING_DIR)/usr/lib" \
  --v8-options="--max_old_space_size=20 --initial_old_space_size=4 --max_semi_space_size=2 --max_executable_size=5" \
  -- -Dmips_arch_variant=r2 -Dmips_fpu_mode=fp32 -Dv8_use_mips_abi_hardfloat=false -Dv8_can_use_fpu_instructions=false

define Package/iojs/install
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/out/Release/iojs $(1)/usr/bin/iojs
	ln -sf /usr/bin/iojs $(1)/usr/bin/node
endef

define Package/npm/install
	mkdir -p $(1)/usr/lib/node_modules
	$(CP) $(PKG_BUILD_DIR)/deps/npm $(1)/usr/lib/node_modules
	ln -sf /usr/lib/node_modules/npm/bin/npm-cli.js $(1)/usr/bin/npm
endef

$(eval $(call BuildPackage,iojs))
$(eval $(call BuildPackage,npm))

