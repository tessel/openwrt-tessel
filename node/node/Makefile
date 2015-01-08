#
# Copyright (C) 2014 Arduino LLC
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=node
PKG_VERSION:=v0.10.33
PKG_RELEASE:=1

PKG_SOURCE:=node-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://nodejs.org/dist/${PKG_VERSION}
PKG_MD5SUM:=626ca8a4f8fec4df49c78ed53d46f1f7

PKG_BUILD_PARALLEL:=1
PKG_BUILD_DEPENDS:=

include $(INCLUDE_DIR)/package.mk

define Package/node
  DEPENDS:=+libpthread +librt +libstdcpp +v8m-rb +libopenssl
  SUBMENU:=Node.js
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Node.js is a platform built on Chrome's JavaScript runtime
  URL:=http://nodejs.org/
endef

define Package/node/description
 Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.
endef


CONFIGURE_ARGS = --without-snapshot --dest-cpu=mipsel --dest-os=linux --with-mips-float-abi=soft \
  --shared-v8 --shared-v8-includes="$(STAGING_DIR)/usr/include/" --shared-v8-libpath="$(STAGING_DIR)/usr/lib" \
  --shared-openssl --shared-openssl-includes="$(STAGING_DIR)/usr/include" --shared-openssl-libpath="$(STAGING_DIR)/usr/lib" \

define Package/node/install
	mkdir -p $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/out/Release/node $(1)/usr/bin/nodejs
	$(INSTALL_BIN) ./files/node $(1)/usr/bin

	mkdir -p $(1)/usr/lib/node_modules
	$(CP) $(PKG_BUILD_DIR)/deps/npm $(1)/usr/lib/node_modules
	ln -sf /usr/lib/node_modules/npm/bin/npm-cli.js $(1)/usr/bin/npm
endef

$(eval $(call BuildPackage,node))

