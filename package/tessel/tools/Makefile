include $(TOPDIR)/rules.mk

PKG_NAME:=tools
PKG_VERSION:=0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/tessel/v2-samd21.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=13a9a44923b70a27058e5fc2838c3675e67e6fda
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/tools
	CATEGORY:=Tessel
	TITLE:=Tessel coprocessor bridge
endef

define Build/Compile
	$(call Build/Compile/Default,-C soc) 
endef

define Package/tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/spid $(1)/usr/bin/spid
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/spid.sh $(1)/usr/bin/spid-start
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/spid.init $(1)/etc/init.d/spid

	mkdir -p $(1)/usr/lib/node
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/node/tessel.js $(1)/usr/lib/node/tessel.js
endef

$(eval $(call BuildPackage,tools))
