#
# Copyright (C) 2009-2012 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pcsc-lite
PKG_VERSION:=1.8.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://alioth.debian.org/frs/download.php/file/4203
PKG_MD5SUM:=ec7d0114016c788c1c09859c84860f6cec6c4595436d23245105154b9c046bb2
PKG_MAINTAINER:=Daniel Golle <daniel@makrotopia.org>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/pcsc-lite/Default
  TITLE:=Middleware to access a smart card using SCard API (PC/SC).
  URL:=http://pcsclite.alioth.debian.org/
endef

define Package/pcsc-lite/Default/description
  The purpose of PC/SC Lite is to provide a Windows(R) SCard
  interface in a very small form factor for communicating to
  smart cards and smart cards readers.
endef

define Package/libpcsclite
  $(call Package/pcsc-lite/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
  DEPENDS:=+libusb-1.0 +libpthread +librt
endef

define Package/libpcsclite/description
  $(call Package/pcsc-lite/Default/description)
  .
  This package contains the PC/SC shared library.
endef

define Package/pcscd
  $(call Package/pcsc-lite/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (daemon)
  DEPENDS:=+libpcsclite
endef

define Package/pcscd/description
  $(call Package/pcsc-lite/Default/description)
  .
  This package contains the PC/SC daemon.
endef

TARGET_CFLAGS += $(FPIC)
TARGET_LDFLAGS += -lpthread

CONFIGURE_ARGS += \
	--disable-libudev \
	--enable-libusb \
	--enable-static \
	--enable-usbdropdir=/usr/lib/pcsc/drivers

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/PCSC
	$(CP) $(PKG_INSTALL_DIR)/usr/include/PCSC/* $(1)/usr/include/PCSC/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpcsclite.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libpcsclite.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libpcsclite/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpcsclite.so.* $(1)/usr/lib/
endef

define Package/pcscd/conffiles
/etc/reader.conf.d/reader.conf
endef

define Package/pcscd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/pcscd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/pcscd.init $(1)/etc/init.d/pcscd
	$(INSTALL_DIR) $(1)/etc/reader.conf.d
endef

$(eval $(call BuildPackage,libpcsclite))
$(eval $(call BuildPackage,pcscd))
