#
# Copyright (C) 2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=iptraf-ng
PKG_VERSION:=1.1.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://fedorahosted.org/releases/i/p/iptraf-ng/
PKG_MD5SUM:=de27cfeeede96e2acfb0edc8439b034a

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_MAINTAINER:=Florian Fainelli <florian@openwrt.org>

PKG_CHECK_FORMAT_SECURITY:=0

include $(INCLUDE_DIR)/package.mk

define Package/iptraf-ng
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses
  TITLE:=A console-based network monitoring program
  URL:=https://fedorahosted.org/iptraf-ng/
endef

define Package/iptraf-ng/description
  iptraf-ng is a console-based network statistics utility for Linux. It gathers a
  variety of figures such as TCP connection packet and byte counts, interface
  statistics and activity indicators, TCP/UDP traffic breakdowns, and LAN
  station packet and byte counts.
endef

define Package/iptraf-ng/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	mkdir -p $${IPKG_INSTROOT}/var/log/iptraf-ng \
		 $${IPKG_INSTROOT}/var/run/iptraf-ng \
		 $${IPKG_INSTROOT}/var/lib/iptraf-ng
fi
endef

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
	CPPFLAGS="$(TARGET_CPPFLAGS) -D_GNU_SOURCE" \
	NCURSES_CFLAGS="$(TARGET_CFLAGS)" \
	NCURSES_LDFLAGS="$(TARGET_LDFLAGS) -lncurses -lpanel" \
	iptraf-ng rvnamed-ng

define Package/iptraf-ng/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/iptraf-ng $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rvnamed-ng $(1)/usr/bin/
endef

$(eval $(call BuildPackage,iptraf-ng))
