#
# Copyright (C) 2015-2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mmc-utils
PKG_VERSION=2016-09-11-$(PKG_SOURCE_VERSION)
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
PKG_SOURCE_VERSION:=2cb6695e8dec00d887bdd5309d1b57d836fcd214
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=Michael Heimpold <mhei@heimpold.de>

PKG_BUILD_PARALLEL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/mmc-utils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Userspace tools for MMC/SD devices
  URL:=http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git
endef

define Package/mmc-utils/description
  This package contains the userspace mmc utils, the userspace
  counterpart to the Linux MMC/SD subsystem.
endef

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	        $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2" \
	        mmc
endef

define Package/mmc-utils/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mmc $(1)/sbin
endef

$(eval $(call BuildPackage,mmc-utils))
