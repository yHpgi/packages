#
# Copyright (C) 2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openobex
PKG_VERSION:=1.7.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-Source
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-Source.tar.gz
PKG_SOURCE_URL:=@SF/openobex
PKG_MD5SUM:=3181bfed9cb7db591605391068cb0085

PKG_LICENSE:=GPL-2.0+ LGPL-2.1+
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Nicolas Thill <nico@openwrt.org>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/openobex/Default
  TITLE:=Open Source impl of the OBject EXchange protocol
  URL:=https://www.gitorious.org/openobex
endef

define Package/openobex
$(call Package/openobex/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (meta)
  DEPENDS:=+openobex-apps +libopenobex
endef

define Package/openobex-apps
$(call Package/openobex/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (apps)
  DEPENDS:=+libopenobex +bluez-libs
endef

define Package/libopenobex
$(call Package/openobex/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
  DEPENDS:=+libusb-1.0
endef

CMAKE_OPTIONS += \
	-DBUILD_DOCUMENTATION:BOOL=OFF \

MAKE_FLAGS += \
	openobex openobex-apps \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/openobex $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libopenobex.so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/apps/lib/libopenobex-apps-common.a $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/openobex.pc $(1)/usr/lib/pkgconfig/
endef

define Package/openobex/install
	:
endef

define Package/openobex-apps/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
endef

define Package/libopenobex/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libopenobex.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,openobex))
$(eval $(call BuildPackage,openobex-apps))
$(eval $(call BuildPackage,libopenobex))
