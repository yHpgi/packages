#
# Copyright (C) 2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libnet
PKG_VERSION:=1.2-rc3
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://sourceforge.net/projects/libnet-dev/files/
PKG_MD5SUM:=f051e6e5bdecddb90f77c701c2ca1804
PKG_MAINTAINER:=Mislav Novakovic <mislav.novakovic@sartura.hr>
PKG_LICENSE:=GPL-2.0

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_CFLAGS += $(FPIC)

define Package/libnet-1.2.x
 SECTION:=libs
 CATEGORY:=Libraries
 DEPENDS:=+libpcap
 TITLE:=Low-level packet creation library
endef


CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static

CONFIGURE_VARS += \
	ac_cv_libnet_endianess=$(ENDIANESS) \
	libnet_cv_have_packet_socket=yes \
	LL_INT_TYPE=libnet_link_linux

define Build/Configure
	(cd $(PKG_BUILD_DIR); touch \
	configure.in \
	include.m4 \
	aclocal.m4 \
	Makefile.in \
	);
	$(call Build/Configure/Default)
endef


define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib/libnet-1.2.x/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libnet.h $(STAGING_DIR)/usr/lib/libnet-1.2.x/include

	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib/libnet-1.2.x/include/libnet
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libnet/libnet-*.h $(STAGING_DIR)/usr/lib/libnet-1.2.x/include/libnet

	$(INSTALL_DIR) $(STAGING_DIR)/usr/lib/libnet-1.2.x/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnet.{a,la,so*} $(STAGING_DIR)/usr/lib/libnet-1.2.x/lib
endef

define Package/libnet-1.2.x/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libnet.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnet-1.2.x))
