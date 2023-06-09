#
# Copyright (C) 2006-2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=icu4c
PKG_VERSION:=58.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-58_2-src.tgz
PKG_SOURCE_URL:=http://download.icu-project.org/files/$(PKG_NAME)/$(PKG_VERSION)
PKG_MD5SUM:=fac212b32b7ec7ab007a12dff1f3aea1

PKG_LICENSE:=ICU-1.8.1+
PKG_LICENSE_FILES:=LICENSE

PKG_MAINTAINER:=Hirokazu MORIKAWA <morikw2@gmail.com>

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=icu/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

TAR_OPTIONS+= icu/source --strip-components 2
TAR_CMD=$(HOST_TAR) -C $(1) $(TAR_OPTIONS)

define Package/icu
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=International Components for Unicode
  URL:=http://icu-project.org
  DEPENDS:=+libstdcpp +libpthread
endef

CONFIGURE_CMD:= ./runConfigureICU
CONFIGURE_VARS:=
CONFIGURE_ARGS:= \
	Linux/gcc \
	--disable-debug \
	--enable-release \
	--enable-shared \
	--enable-static \
	--enable-draft \
	--enable-renaming \
	--disable-tracing \
	--disable-extras \
	--enable-dyload \
	--disable-tools \
	--disable-tests \
	--disable-samples \
	--with-cross-build="$(HOST_BUILD_DIR)" \
	--prefix=/usr

HOST_CONFIGURE_CMD:= ./runConfigureICU
HOST_CONFIGURE_VARS:=
HOST_CONFIGURE_ARGS:= \
	Linux/gcc \
	--disable-debug \
	--enable-release \
	--enable-shared \
	--enable-static \
	--enable-draft \
	--enable-renaming \
	--disable-tracing \
	--disable-extras \
	--enable-dyload \
	--prefix=$(HOST_BUILD_PREFIX)

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/* \
		$(1)/usr/include/

	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/* \
		$(1)/usr/lib/
endef

define Host/install
endef

define Package/icu/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so.* \
		$(1)/usr/lib/
endef

$(eval $(call BuildPackage,icu))
$(eval $(call HostBuild))
