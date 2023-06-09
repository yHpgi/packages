#
# Copyright (C) 2014 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=f2fs-tools
PKG_VERSION:=1.7.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://git.kernel.org/cgit/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot/
PKG_MD5SUM:=9db22274264f0c88dbee012f257917b1

PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

PKG_MAINTAINER:=Luka Perkov <luka@openwrt.org>

include $(INCLUDE_DIR)/package.mk

define Package/f2fs-tools/Default
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  DEPENDS:=+libf2fs
  URL:=http://git.kernel.org/cgit/linux/kernel/git/jaegeuk/f2fs-tools.git
endef

define Package/mkf2fs
  $(Package/f2fs-tools/Default)
  TITLE:=Utility for creating a Flash-Friendly File System (F2FS)
endef

define Package/f2fsck
  $(Package/f2fs-tools/Default)
  TITLE:=Utility for checking/repairing a Flash-Friendly File System (F2FS)
endef

define Package/f2fs-tools
  $(Package/f2fs-tools/Default)
  TITLE:=Tools for Flash-Friendly File System (F2FS)
  DEPENDS += +mkf2fs +f2fsck
endef

define Package/libf2fs
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Library for Flash-Friendly File System (F2FS) tools
  DEPENDS:=+libuuid
endef

define Package/libf2fs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/libf2fs.so* $(1)/usr/lib/
endef

define Package/mkf2fs/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/mkfs.f2fs $(1)/usr/sbin
endef

define Package/f2fsck/install
	$(INSTALL_DIR) $(1)/usr/sbin

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/fsck.f2fs $(1)/usr/sbin
	ln -s /usr/sbin/fsck.f2fs $(1)/usr/sbin/defrag.f2fs
	ln -s /usr/sbin/fsck.f2fs $(1)/usr/sbin/dump.f2fs
	ln -s /usr/sbin/fsck.f2fs $(1)/usr/sbin/sload.f2fs
	ln -s /usr/sbin/fsck.f2fs $(1)/usr/sbin/resize.f2fs
endef

define Package/f2fs-tools/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/f2fstat $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/fibmap.f2fs $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/parse.f2fs $(1)/usr/sbin
endef

$(eval $(call BuildPackage,libf2fs))
$(eval $(call BuildPackage,mkf2fs))
$(eval $(call BuildPackage,f2fsck))
$(eval $(call BuildPackage,f2fs-tools))
