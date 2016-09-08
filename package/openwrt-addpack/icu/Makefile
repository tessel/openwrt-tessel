#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Taken from github.com/tobiaswaldvogel/openwrt-addpack/blob/master/libicu/Makefile

include $(TOPDIR)/rules.mk

PKG_NAME:=icu
PKG_VERSION:=57.1
PKG_RELEASE:=1

PKG_SOURCE:=icu4c-57_1-src.tgz
PKG_SOURCE_URL:=http://download.icu-project.org/files/icu4c/$(PKG_VERSION)/
PKG_BUILD_DIR:=$(BUILD_DIR)/icu
PKG_FIXUP:=libtool,no-autoreconf
PKG_INSTALL=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/libicu
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=ICU library for software internationalization
  URL:=http://icu-project.org
  DEPENDS:=+glib2
endef

define Package/libicu/description
	ICU is a mature, widely used set of C/C++ and Java libraries providing Unicode
	and Globalization support for software applications.
endef

MAKE_PATH:=source

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/icu

#define Host/Prepare
#	mkdir -p $(HOST_BUILD_DIR)
#endef


define Host/Compile
	$(MAKE) -C $(HOST_BUILD_DIR)/source all install
endef



# Specify what needs to be done to prepare for building the package.
# In our case, we need to copy the source files to the build directory.
# This is NOT the default.  The default uses the PKG_SOURCE_URL and the
# PKG_SOURCE which is not defined here to download the source from the web.
# In order to just build a simple program that we have just written, it is
# much easier to do it this way.
#define Build/Prepare
#        $(call Build/Prepare/Default)
#	$(CP) -a $(PKG_BUILD_DIR)/source/* $(PKG_BUILD_DIR)/
#endef

define Build/Prepare
	mkdir -p $(HOST_BUILD_DIR)
	$(call Host/Prepare/Default)
	$(call Host/Configure/Default,,,source)
	$(call Host/Compile)
	$(call Build/Prepare/Default)
endef

define Build/Configure
#	mkdir -p $(HOST_BUILD_DIR)
#	$(call Host/Prepare/Default)
#	$(call Host/Configure/Default,,,source)
#	$(call Host/Compile)
	$(call Build/Configure/Default, \
		--with-cross-build=$(HOST_BUILD_DIR)/source,, \
		source \
	)
endef

#define Build/InstallDev
#	$(INSTALL_DIR) $(1)/usr/lib
#	$(CP) \
#		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
#		$(1)/usr/lib/
#
#	$(INSTALL_DIR) $(1)/usr/bin
#	$(INSTALL_DATA) \
#		$(PKG_INSTALL_DIR)/usr/bin/* \
#		$(1)/usr/bin/
#
#	$(INSTALL_DIR) $(1)/usr/include
#	$(CP) \
#		$(PKG_INSTALL_DIR)/usr/include/* \
#		$(1)/usr/include/
#endef

define Package/libicu/install
	$(INSTALL_DIR) $(1)/usr/lib
#	$(CP) \
#		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
#		$(1)/usr/lib/
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,libicu))
