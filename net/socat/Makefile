#
# Copyright (C) 2006-2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=socat
PKG_VERSION:=1.7.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.dest-unreach.org/socat/download
PKG_MD5SUM:=d2da659540c38139f388e9437bfaae16bb458d174d056cb3228432a8f489fbaa

PKG_MAINTAINER:= Ted Hess <thess@kitschensync.net>

PKG_LICENSE:=GPL-2.0 OpenSSL
PKG_LICENSE_FILES:=COPYING COPYING.OpenSSL

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/socat
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +librt +SOCAT_SSL:libopenssl
  TITLE:=A multipurpose relay (SOcket CAT)
  URL:=http://www.dest-unreach.org/socat/
endef

define Package/socat/description
	SoCat (for SOcket CAT) establishes two bidirectional byte streams and
	transfers data between them.
	Data channels may be files, pipes, devices (terminal or modem, etc.), or
	sockets (Unix, IPv4, IPv6, raw, UDP, TCP, SSL). It provides forking,
	logging and tracing, different modes for interprocess communication and
	many more options.
endef

define Package/socat/config
config SOCAT_SSL
        bool "SSL support"
        depends on PACKAGE_socat
        default n
        help
          Implements SSL support in socat (using libopenssl).
endef

define Package/socat/conffiles
/etc/config/socat
endef

CONFIGURE_ARGS += \
	--disable-libwrap \
	--disable-readline \
	--enable-termios

ifneq ($(CONFIG_SOCAT_SSL),y)
  CONFIGURE_ARGS+= --disable-openssl
endif

CONFIGURE_VARS += \
	sc_cv_termios_ispeed="no" \
	sc_cv_sys_crdly_shift=9 \
	sc_cv_sys_tabdly_shift=11 \
	sc_cv_sys_csize_shift=4

TARGET_CFLAGS += \
	-include stddef.h

define Package/socat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/socat $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/socat.config $(1)/etc/config/socat
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/socat.init $(1)/etc/init.d/socat
endef

$(eval $(call BuildPackage,socat))
