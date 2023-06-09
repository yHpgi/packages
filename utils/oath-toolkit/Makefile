#
# Copyright (C) 2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=oath-toolkit
PKG_VERSION:=2.6.2
PKG_RELEASE:=1
PKG_SOURCE:=oath-toolkit-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SAVANNAH/oath-toolkit
PKG_SOURCE_MD5SUM:=4a05cd4768764843bd5493609a6bdb17
PKG_LICENSE:=LGPL-2.0+ GPL-3.0+
PKG_LICENSE_FILES:=COPYING
PKG_INSTALL:=1
PKG_MAINTAINER:=Fam Zheng <fam@euphon.net>

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS += \
	--disable-xmltest \
	--disable-pskc

define Package/oath-toolkit
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Toolkit for building one-time password authentication
  URL:=http://www.nongnu.org/oath-toolkit/index.html
  DEPENDS:=
endef

define Package/oath-toolkit/description
	The OATH Toolkit provide components for building one-time password
	authentication systems. It contains shared libraries, command line
	tools and a PAM module. Supported technologies include the event-based
	HOTP algorithm (RFC4226) and the time-based TOTP algorithm (RFC6238).
endef

define Package/oath-toolkit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/oathtool $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/liboath.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,oath-toolkit))
