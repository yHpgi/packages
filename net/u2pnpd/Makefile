#
# Copyright (C) 2015-2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=u2pnpd
PKG_VERSION:=0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://github.com/mhei/u2pnpd/releases/download/v$(PKG_VERSION)
PKG_MD5SUM:=ac6f378590d3e4e38b40e4b13f03b369

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/u2pnpd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Announce device via UPnP on the network
  URL:=https://github.com/mhei/u2pnpd
  DEPENDS:=+libupnp
endef

define Package/u2pnpd/description
  This tools announces a device via UPnP on the local network, thus it is possible
  to find it within the network neightboorhood of a well-known OS and the user
  can easily double-click on an icon to open the web frontend of this device without
  knowing the IP address.
endef

define Package/u2pnpd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/u2pnpd $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/u2pnpd.init $(1)/etc/init.d/u2pnpd

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) ./files/u2pnpd.defaults $(1)/etc/uci-defaults/u2pnpd

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/u2pnpd.config $(1)/etc/config/u2pnpd
endef

define Package/u2pnpd/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || (. /etc/uci-defaults/u2pnpd) && rm -f /etc/uci-defaults/u2pnpd
exit 0
endef

$(eval $(call BuildPackage,u2pnpd))
