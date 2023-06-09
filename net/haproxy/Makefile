#
# Copyright (C) 2010-2016 BoluWrt.org
# Copyright (C) 2009-2016 Thomas Heil <heil@terminal-consulting.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=haproxy
PKG_VERSION:=1.7.8
PKG_RELEASE:=18

PKG_SOURCE:=haproxy-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.haproxy.org/download/1.7/src/
PKG_MD5SUM:=7e94653cc5a1dba006bbe43736f53595

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)
PKG_LICENSE:=GPL-2.0
MAINTAINER:=Thomas Heil <heil@terminal-consulting.de>

include $(INCLUDE_DIR)/package.mk

define Package/haproxy/Default
  SUBMENU:=Web Servers/Proxies
  SECTION:=net
  CATEGORY:=Network
  TITLE:=The Reliable, High Performance TCP/HTTP Load Balancer
  URL:=http://haproxy.1wt.eu/
endef

define Download/lua533
	FILE:=lua-5.3.3.tar.gz
	URL:=http://www.lua.org/ftp/
	MD5SUM:=703f75caa4fdf4a911c1a72e67a27498
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	tar -zxvf $(DL_DIR)/lua-5.3.3.tar.gz -C $(PKG_BUILD_DIR)
	ln -s $(PKG_BUILD_DIR)/lua-5.3.3 $(PKG_BUILD_DIR)/lua
endef

define Package/haproxy/Default/conffiles
/etc/haproxy.cfg
endef

define Package/haproxy/Default/description
 Open source Reliable, High Performance TCP/HTTP Load Balancer.
endef

define Package/haproxy
  DEPENDS+= +libpcre +libltdl +zlib +libpthread +libopenssl +libncursesw +libreadline +@OPENSSL_WITH_DEPRECATED +@OPENSSL_WITH_EC +@OPENSSL_WITH_EC2M  +@OPENSSL_WITH_DTLS +@OPENSSL_WITH_COMPRESSION +@OPENSSL_WITH_NPN  +@OPENSSL_WITH_PSK +@OPENSSL_WITH_SRP +@OPENSSL_ENGINE_DIGEST +@OPENSSL_ENGINE_CRYPTO

  TITLE+= (with SSL support)
  VARIANT:=ssl
$(call Package/haproxy/Default)
endef

define Package/haproxy/conffiles
$(call Package/haproxy/Default/conffiles)
endef

define Package/haproxy/description
$(call Package/haproxy/Default/description)
 This package is built with SSL and LUA support.
endef

define Package/haproxy/config
	select CONFIG_OPENSSL_WITH_DEPRECATED
	$(call Package/haproxy/Default/config)
endef

define Package/haproxy-nossl
  TITLE+= (without SSL support)
  VARIANT:=nossl
  DEPENDS+= +libpcre +libltdl +zlib +libpthread
  TITLE+= (without SSL support)
$(call Package/haproxy/Default)
endef

define Package/haproxy-nossl/conffiles
$(call Package/haproxy/Default/conffiles)
endef

define Package/haproxy-nossl/description
$(call Package/haproxy/Default/description)
 This package is built without SSL support.
endef

ifeq ($(CONFIG_avr32),y)
  LINUX_TARGET:=linux26
else
  LINUX_TARGET:=linux2628
endif

ifeq ($(BUILD_VARIANT),ssl)
	ADDON+=USE_OPENSSL=1
	ADDON+=USE_LUA=1
	ADDON+=LUA_LIB_NAME="lua533"
	ADDON+=LUA_INC="$(STAGING_DIR)/lua-5.3.3/include"
	ADDON+=LUA_LIB="$(STAGING_DIR)/lua-5.3.3/lib"
	ADDON+=ADDLIB="-lcrypto -lm "	
else
	ADDON+=ADDLIB="-lm"
endif


define Build/Compile
	$(MAKE) TARGET=$(LINUX_TARGET) -C $(PKG_BUILD_DIR)/lua \
		INSTALL_TOP="$(STAGING_DIR)/lua-5.3.3/" \
		CC="$(TARGET_CC)" \
		LDFLAGS="$(TARGET_LDFLAGS) -lncurses -lreadline" \
		LD="$(TARGET_LD)" \
		linux install

	mv $(STAGING_DIR)/lua-5.3.3/lib/liblua.a $(STAGING_DIR)/lua-5.3.3/lib/liblua533.a

	$(MAKE) TARGET=$(LINUX_TARGET) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CC="$(TARGET_CC)" \
		PCREDIR="$(STAGING_DIR)/usr/include" \
		SMALL_OPTS="-DBUFSIZE=16384 -DMAXREWRITE=1030 -DSYSTEM_MAXCONN=165530 " \
		USE_LINUX_TPROXY=1 USE_LINUX_SPLICE=1 USE_REGPARM=1 \
		USE_ZLIB=yes USE_PCRE=1 USE_PCRE_JIT=1\
		VERSION="$(PKG_VERSION)-patch$(PKG_RELEASE)" \
		$(ADDON)
		CFLAGS="$(TARGET_CFLAGS) -fno-align-jumps -fno-align-functions -fno-align-labels -fno-align-loops -pipe -fomit-frame-pointer -fhonour-copts" \
		LD="$(TARGET_LD)" \
		LDFLAGS="$(TARGET_LDFLAGS) -lcurses -lreadline" \
		GNOREGIT=1

	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		LD="$(TARGET_CC)" \
                LDFLAGS="$(TARGET_LDFLAGS)" \
		$(MAKE_FLAGS) \
		install

	$(MAKE_VARS) $(MAKE) -C $(PKG_BUILD_DIR)/contrib/halog \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		$(MAKE_FLAGS) \
		ADDLIB="-lcrypto" \
		VERSION="$(PKG_VERSION)-patch$(PKG_RELEASE)" \
		halog
endef

define Package/haproxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/haproxy $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/haproxy.cfg $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/haproxy.init $(1)/etc/init.d/haproxy
	$(INSTALL_DIR) $(1)/etc/hotplug.d/net
	$(INSTALL_BIN) ./files/haproxy.hotplug $(1)/etc/hotplug.d/net/90-haproxy
endef

Package/haproxy-nossl/install = $(Package/haproxy/install)


define Package/halog
	MENU:=1
	$(call Package/haproxy)
	TITLE+= halog
	DEPENDS:=haproxy
endef

define Package/halog/description
	HAProxy Log Analyzer
endef

define Package/halog/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/contrib/halog/halog $(1)/usr/bin/
endef

$(eval $(call Download,lua533))
$(eval $(call BuildPackage,haproxy))
$(eval $(call BuildPackage,halog))
$(eval $(call BuildPackage,haproxy-nossl))

