#
# Copyright (C) 2010-2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=flashrom
PKG_VERSION:=0.9.9
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://download.flashrom.org/releases
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_MD5SUM:=aab9c98925d9cfb5ffb28b67a6112530
PKG_MAINTAINER:=Álvaro Fernández Rojas <noltari@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_SOURCE_SUBDIR)

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include flashrom.mk

TARGET_CFLAGS+= \
	-std=gnu89

MAKE_FLAGS+= \
	PREFIX="/usr"

define Package/flashrom/default
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=FlashROM Utility
  URL:=http://www.flashrom.org/
endef

define Package/flashrom
  $(Package/flashrom/default)
  TITLE+= (full)
  DEPENDS+= \
    +(TARGET_x86||TARGET_x86_64):dmidecode \
    +libftdi1 \
    +libusb-1.0 \
    +libusb-compat \
    +pciutils
  VARIANT:=full
  DEFAULT_VARIANT:=1
endef

define Package/flashrom-pci
  $(Package/flashrom/default)
  TITLE+= (pci)
  DEPENDS+= \
    +(TARGET_x86||TARGET_x86_64):dmidecode \
    +pciutils
  VARIANT:=pci
endef

define Package/flashrom-spi
  $(Package/flashrom/default)
  TITLE+= (spi)
  VARIANT:=spi
endef

define Package/flashrom-usb
  $(Package/flashrom/default)
  TITLE+= (usb)
  DEPENDS+= \
    +libftdi1 \
    +libusb-1.0 \
    +libusb-compat
  VARIANT:=usb
endef

define Package/flashrom/default/description
 flashrom is an utility for identifying, reading, writing, verifying
 and erasing flash chips. It's often used to flash BIOS/EFI/coreboot
 /firmware images.
endef
Package/flashrom/description = $(Package/flashrom/default/description)
Package/flashrom-pci/description = $(Package/flashrom/default/description)
Package/flashrom-spi/description = $(Package/flashrom/default/description)
Package/flashrom-usb/description = $(Package/flashrom/default/description)

define Package/flashrom/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/flashrom $(1)/usr/sbin/flashrom
endef
define Package/flashrom-pci/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/flashrom $(1)/usr/sbin/flashrom-pci
endef
define Package/flashrom-spi/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/flashrom $(1)/usr/sbin/flashrom-spi
endef
define Package/flashrom-usb/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/flashrom $(1)/usr/sbin/flashrom-usb
endef

$(eval $(call BuildPackage,flashrom))
$(eval $(call BuildPackage,flashrom-pci))
$(eval $(call BuildPackage,flashrom-spi))
$(eval $(call BuildPackage,flashrom-usb))
