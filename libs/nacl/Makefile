#
# Copyright (C) 2011-2014 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nacl
PKG_VERSION:=20110221
PKG_RELEASE:=2

PKG_MAINTAINER:=Matthias Schiffer <mschiffer@universe-factory.net>
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://hyperelliptic.org/nacl
PKG_MD5SUM:=7efb5715561c3d10dafd3fa97b4f2d20

PKG_LICENSE:=PublicDomain

PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

define Package/nacl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=NaCl Networking and Cryptography library
  URL:=http://nacl.cace-project.eu/
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR) && \
			CC="$(TARGET_CC)" \
			CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
			AR="$(TARGET_CROSS)ar" \
			RANLIB="$(TARGET_CROSS)ranlib" \
		$(CURDIR)/do-openwrt \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/nacl
	$(CP) $(PKG_BUILD_DIR)/build/include/*.h $(1)/usr/include/nacl/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/build/lib/libnacl.a $(1)/usr/lib/
endef

$(eval $(call BuildPackage,nacl))
