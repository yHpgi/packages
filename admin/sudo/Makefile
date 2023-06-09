#
# Copyright (C) 2006-2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=sudo
PKG_VERSION:=1.8.14p3
PKG_RELEASE:=1
PKG_LICENSE:=ISC
PKG_LICENSE_FILES:=doc/LICENSE

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.sudo.ws/dist
PKG_MD5SUM:=93dbd1e47c136179ff1b01494c1c0e75

PKG_INSTALL:=1

PKG_BUILD_DEPENDS:=sudo/host

include $(INCLUDE_DIR)/package.mk

define Package/sudo
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=Delegate authority to run commands
  URL:=http://www.sudo.ws/
  MAINTAINER:=Gergely Kiss <mail.gery@gmail.com>
endef

define Package/sudo/description
 Sudo (su "do") allows a system administrator to delegate authority to
 give certain users (or groups of users) the ability to run some (or
 all) commands as root or another user while providing an audit trail of
 the commands and their arguments.
endef

define Package/sudo/conffiles
/etc/sudoers
/etc/sudoers.d/
endef

CONFIGURE_ARGS+= \
	--without-pam \
	--disable-pam-session \
	--with-editor=/bin/vi \
	--without-lecture \
	--disable-zlib \
	--with-rundir=/var/lib/sudo \
	--with-vardir=/var/lib/sudo

CONFIGURE_VARS+= \
	sudo_cv_uid_t_len=10 \
	sudo_cv_func_unsetenv_void=no

include $(INCLUDE_DIR)/host-build.mk

define Host/Compile
	cd $(HOST_BUILD_DIR)/lib/util; \
	    $(MAKE) mksiglist; $(MAKE) mksigname
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOSTPKG)/bin
	$(CP) $(HOST_BUILD_DIR)/lib/util/mksig{list,name} $(STAGING_DIR_HOSTPKG)/bin/
endef

$(eval $(call HostBuild))

define Package/sudo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sudo $(1)/usr/bin/
	chmod 4755 $(1)/usr/bin/sudo
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/visudo $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/sudoers $(1)/etc/
	chmod 0440 $(1)/etc/sudoers
	$(INSTALL_DIR) $(1)/etc/sudoers.d
	$(INSTALL_DIR) $(1)/usr/lib/sudo
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sudo/*.so* $(1)/usr/lib/sudo/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/sudo.init $(1)/etc/init.d/sudo
endef

define Package/sudo/postinst
#!/bin/sh

[ -n "$$IPKG_INSTROOT" ] || {
	/etc/init.d/sudo enable
	/etc/init.d/sudo start
}
endef

$(eval $(call BuildPackage,sudo))
