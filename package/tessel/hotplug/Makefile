include $(TOPDIR)/rules.mk

PKG_NAME:=tessel-hotplug
PKG_VERSION:=0.1
PKG_RELEASE=$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tessel-hotplug
	CATEGORY:=Tessel
	TITLE:=Installs Tessel 2 related hotplug utilities
endef

define Build/Compile
endef

define Package/tessel-hotplug/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/usb
	$(INSTALL_BIN) ./files/10-usb_ble_autoload $(1)/etc/hotplug.d/usb/10-usb_ble_autoload
endef

$(eval $(call BuildPackage,tessel-hotplug))
