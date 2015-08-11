include $(TOPDIR)/rules.mk

PKG_NAME:=tessel-version
PKG_VERSION:=0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tessel-mdns
	CATEGORY:=Tessel
	TITLE:=Sets the text versioning file for Tessel 2
endef

define Build/Compile
endef

define Package/tessel-version/install
	$(INSTALL_DIR) $(1)/etc/tessel-version
	$(INSTALL_BIN) ./files/version.json $(1)/etc/tessel-version/version.json
endef

$(eval $(call BuildPackage,tessel-mdns))