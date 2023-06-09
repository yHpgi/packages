#
# Copyright (C) 2010-2014 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=liblo
PKG_VERSION:=0.28
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/liblo
PKG_MD5SUM:=e2a4391a08b49bb316c03e2034e06fa2

PKG_LICENSE:=LGPL-2.1+
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Nicolas Thill <nico@openwrt.org>

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/liblo/Default
  TITLE:=Lightweight Open Sound Control (OSC)
  URL:=http://liblo.sourceforge.net/
endef

define Package/liblo
$(call Package/liblo/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  SUBMENU:=Sound
  TITLE+= library
  DEPENDS:= +libpthread
endef

define Package/liblo-utils
$(call Package/liblo/Default)
  CATEGORY:=Sound
  TITLE+= utilities
  DEPENDS:= +liblo
endef

TARGET_CFLAGS += \
	-Wno-error=maybe-uninitialized \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/lo $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblo.* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/liblo.pc $(1)/usr/lib/pkgconfig/
endef

define Package/liblo/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblo.so.* $(1)/usr/lib/
endef

define Package/liblo-utils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/osc{dump,send} $(1)/usr/bin/
endef

$(eval $(call BuildPackage,liblo))
$(eval $(call BuildPackage,liblo-utils))
