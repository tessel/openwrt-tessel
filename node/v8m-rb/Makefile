#
# Copyright (C) 2014 Arduino LLC
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=v8m-rb
PKG_VERSION:=3.14.5.8
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/v8/v8-git-mirror.git
PKG_SOURCE_VERSION:=9e1a5f7f15c6df41a8ca4c42cef5368238c2b390
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/v8m-rb
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Google v8 javascript engine
  URL:=https://github.com/paul99/v8m-rb/tree/dm-dev-mipsbe
  DEPENDS:=+libstdcpp +libc +libpthread
endef

define Package/v8m-rb/description
 Port of Google v8 javascript engine to MIPS architecture
endef

define Build/Compile
	$(call Build/Compile/Default,mipsel.release library=shared snapshot=off \
          LINK=$(TARGET_CXX) \
	  GYPFLAGS="-Dcomponent=shared_library -Dmips_arch_variant=mips32r2 -Dv8_use_mips_abi_hardfloat=false -Dv8_can_use_fpu_instructions=false" \
        )
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/include/v8*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/out/$(ARCH).release/lib.target/libv8.so $(1)/usr/lib/
endef

define Package/v8m-rb/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/out/$(ARCH).release/lib.target/libv8.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,v8m-rb))
