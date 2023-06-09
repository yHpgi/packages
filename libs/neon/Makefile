#
# Copyright (C) 2007-2014 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=neon
PKG_VERSION:=0.30.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.webdav.org/neon
PKG_MD5SUM:=e28d77bf14032d7f5046b3930704ef41

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libneon
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=HTTP and WebDAV client library
  URL:=http://www.webdav.org/neon/
  DEPENDS:=+libopenssl +libexpat +zlib
  MAINTAINER:=Federico Di Marco <fededim@gmail.com>
endef

define Package/libneon/description
  neon is an HTTP and WebDAV client library, with a C interface. Features:

  - High-level wrappers for common HTTP and WebDAV operations (GET, MOVE, DELETE, etc)
  - Low-level interface to the HTTP request/response engine, allowing the use of arbitrary HTTP methods, headers, etc.
  - Authentication support including Basic and Digest support, along with GSSAPI-based Negotiate on Unix, and
    SSPI-based Negotiate/NTLM on Win32
  - SSL/TLS support using OpenSSL or GnuTLS; exposing an abstraction layer for verifying server certificates, handling client
    certificates, and examining certificate properties. Smartcard-based client certificates are also supported via a
    PKCS11 wrapper interface.
  - Abstract interface to parsing XML using libxml2 or expat, and wrappers for simplifying handling XML HTTP response bodies
  - WebDAV metadata support; wrappers for PROPFIND and PROPPATCH to simplify property manipulation.
endef


TARGET_CFLAGS += $(FPIC)
TARGET_CPPFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--with-expat \
	--with-ssl="openssl" \
	--without-egd \
	--without-libproxy

CONFIGURE_VARS += \
	LDFLAGS="$$$$LDFLAGS -lcrypto -lssl"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/neon-config $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/neon $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libneon.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/neon.pc $(1)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir}/,-I$(STAGING_DIR)/usr/include/,g' $(1)/usr/bin/neon-config
	$(SED) 's,-L$$$${libdir},,g' $(1)/usr/bin/neon-config
endef

define Package/libneon/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libneon.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libneon))
