include $(TOPDIR)/rules.mk

PKG_NAME:=tessel-mdns
PKG_VERSION:=0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tessel-mdns
	CATEGORY:=Tessel
	TITLE:=Begin advertising Tessel over mDNS
	DEPENDS:=+mdns-utils
endef

define Build/Compile
endef

define Package/tessel-mdns/install
	$(INSTALL_DIR) $(1)/etc/init.d
endef

$(eval $(call BuildPackage,tessel-mdns))
