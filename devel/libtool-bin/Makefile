#
# Copyright (C) 2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libtool
PKG_VERSION:=2.4.6
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNU/libtool
PKG_MD5SUM:=1bfb9b923f2c1339b4d2ce1807064aa5
PKG_MAINTAINER:=Heinrich Schuchardt <xypron.glpk@gmx.de>
PKG_LICENSE:=GPL-2.0+
PKG_BUILD_DIR = $(BUILD_DIR)/libtool-bin/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

CONFIGURE_VARS += GREP=grep SED=sed

define Package/libtool-bin
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=GNU Libtool - libtoolize
  URL:=https://www.gnu.org/software/libtool/
endef

define Package/libtool-bin/description
 GNU libtool is a generic library support script.
 Libtool hides the complexity of using shared libraries behind a consistent,
 portable interface. 
 This package contains the libtoolize executable.
endef

define Package/libtool-bin/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/libtoolize $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/aclocal/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/aclocal/*.m4 \
	  $(1)/usr/share/aclocal/
	$(INSTALL_DIR) $(1)/usr/share/libtool/build-aux/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/libtool/build-aux/* \
	  $(1)/usr/share/libtool/build-aux/
endef

$(eval $(call BuildPackage,libtool-bin))
