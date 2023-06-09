#
# Copyright (C) 2006-2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gzip
PKG_VERSION:=1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/gzip
PKG_MD5SUM:=c4abae2ddd5c6f39c6f8169693cc7ac0
PKG_LICENSE:=GPL-3.0+

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/gzip
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Compression
  TITLE:=gzip (GNU zip) is a compression utility.
  URL:=https://www.gnu.org/software/gzip/
  MAINTAINER:=Christian Beier <dontmind@freeshell.org>
endef

define Package/gzip/description
	gzip (GNU zip) is a compression utility designed to be a \
	replacement for compress.
endef

CONFIGURE_VARS += \
	gl_cv_func_getopt_gnu=yes \
	ac_cv_search_clock_gettime=no

define Package/gzip/install
	$(SED) 's,/bin/bash,/bin/sh,g' $(PKG_INSTALL_DIR)/usr/bin/{gunzip,zcat}
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{gunzip,gzip,zcat} $(1)/usr/bin/
endef

define Package/gzip/postinst
#!/bin/sh
for app in gunzip gzip zcat; do
  ln -sf ../usr/bin/$$app $${IPKG_INSTROOT}/bin/$$app
done
endef

define Package/gzip/postrm
#!/bin/sh
for app in gunzip gzip zcat; do
  ln -sf busybox $${IPKG_INSTROOT}/bin/$$app
  $${IPKG_INSTROOT}/bin/$$app 2>&1 | grep 'applet not found' > /dev/null 2>&1 && rm $${IPKG_INSTROOT}/bin/$$app
done
exit 0
endef

$(eval $(call BuildPackage,gzip))

