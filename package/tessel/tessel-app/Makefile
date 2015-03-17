include $(TOPDIR)/rules.mk

PKG_NAME:=tessel-app
PKG_VERSION:=0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tessel-app
	CATEGORY:=Tessel
	TITLE:=Launch tessel user application
endef

define Build/Compile
endef

define Package/tessel-app/conffiles
/app/
endef

define Package/tessel-app/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tessel-app.init $(1)/etc/init.d/tessel-app
endef

$(eval $(call BuildPackage,tessel-app))
