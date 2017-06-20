include $(TOPDIR)/rules.mk

PKG_NAME:=tessel-tools
PKG_VERSION:=0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/tessel/t2-firmware.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=a22ba2d29e7e891c53fa6a4a26d5825b7d81d631
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/tessel-tools
	CATEGORY:=Tessel
	TITLE:=Tessel coprocessor bridge
endef

define Build/Compile
	$(call Build/Compile/Default,-C soc)
endef

define Package/tessel-tools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/spid $(1)/usr/bin/spid
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/spid.sh $(1)/usr/bin/spid-start
	$(INSTALL_BIN) ./files/spid.init $(1)/etc/init.d/spid

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/usbexecd $(1)/usr/bin/usbexecd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/usbexecd.sh $(1)/usr/bin/usbexecd-start
	$(INSTALL_BIN) ./files/usbexecd.init $(1)/etc/init.d/usbexecd

	$(INSTALL_DIR) $(1)/usr/lib/node
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/node/tessel.js $(1)/usr/lib/node/tessel.js
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/node/tessel-export.js $(1)/usr/lib/node/tessel-export.js
endef

$(eval $(call BuildPackage,tessel-tools))
