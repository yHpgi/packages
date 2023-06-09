#
# Copyright (C) 2006-2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libunistring
PKG_VERSION:=0.9.6
PKG_RELEASE:=1
PKG_MD5SUM:=dfae4ff5583649ed24d8f368f1d0543b

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/libunistring
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

PKG_MAINTAINER:=Espen Jürgensen <espenjurgensen+openwrt@gmail.com>
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/libunistring
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=libunistring
  URL:=http://www.gnu.org/software/libunistring/
endef

define Package/libunistring/description
  This library provides functions for manipulating Unicode strings and for manipulating C strings according to the Unicode standard.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--without-libiconv-prefix \
	--without-libpth-prefix

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/include/unistring
	$(CP) $(PKG_INSTALL_DIR)/usr/include/unistring/*.h $(1)/usr/include/unistring/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libunistring.{a,so*} $(1)/usr/lib/
endef

define Package/libunistring/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libunistring.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libunistring))
