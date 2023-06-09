#
# Copyright (C) 2014 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bogofilter
PKG_VERSION:=1.2.4
PKG_RELEASE:=4

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=COPYING

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/bogofilter
PKG_MD5SUM:=d0a5eebb3274b23ceabe766a6443a1c5

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/bogofilter
  SECTION:=mail
  CATEGORY:=Mail
  DEPENDS:=+libdb47
  TITLE:=bogofilter
  MAINTAINER:=W. Michael Petullo <mike@flyn.org>
  URL:=http://bogofilter.sourceforge.net/
endef

define Package/bogofilter/description
	Bogofilter is a fast Bayesian spam filter
endef

CONFIGURE_ARGS += \
	--disable-unicode \
	--with-libdb-prefix=$(STAGING_DIR) \
	--with-included-gsl

define Package/bogofilter/install
	$(INSTALL_DIR)  $(1)/etc/ \
                        $(1)/usr/bin \
                        $(1)/usr/sbin
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/bogofilter.cf.example $(1)/etc/bogofilter.cf
	$(INSTALL_BIN) ./files/postfix-bogofilter $(1)/usr/sbin/postfix-bogofilter
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/bf_compact $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/bf_copy $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/bf_tar $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/bogofilter $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/bogolexer $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/bogotune $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/bogoutil $(1)/usr/bin/
endef

$(eval $(call BuildPackage,bogofilter))
