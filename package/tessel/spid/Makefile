include $(TOPDIR)/rules.mk

PKG_NAME:=spid
PKG_VERSION:=0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:tessel/v2-samd21.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=13a9a44923b70a27058e5fc2838c3675e67e6fda
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/spid
	CATEGORY:=Tessel
	TITLE:=Tessel coprocessor bridge
endef

define Build/Compile
	$(call Build/Compile/Default,-C soc) 
endef

define Package/spid/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/spid $(1)/usr/bin/spid
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/soc/spid.sh $(1)/usr/bin/spid-start
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/spid.init $(1)/etc/init.d/spid
endef

$(eval $(call BuildPackage,spid))
