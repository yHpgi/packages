#
# Copyright (C) 2006-2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=forked-daapd
PKG_VERSION:=24.2
PKG_RELEASE:=1
PKG_REV:=1b6283752ed0b790a6658bed1f05946e1af193da

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/ejurgensen/forked-daapd.git
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=gperf/host
PKG_FIXUP:=autoreconf
PKG_USE_MIPS16:=0
PKG_INSTALL:=1

PKG_MAINTAINER:=Espen Jürgensen <espenjurgensen+openwrt@gmail.com>
PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/forked-daapd
SECTION:=sound
CATEGORY:=Sound
TITLE:=iTunes (DAAP) server for Apple Remote and AirPlay
URL:=https://github.com/ejurgensen/forked-daapd
DEPENDS:=+libgpg-error +libgcrypt +libgdbm +zlib +libexpat +libunistring \
	+libevent2 +libdaemon +libantlr3c +confuse +alsa-lib +libffmpeg-full \
	+mxml +libavahi-client +sqlite3-cli +libplist +libcurl +libjson-c \
	+libprotobuf-c +libgnutls $(ICONV_DEPENDS)
endef

define Package/forked-daapd/description
  forked-daapd is a Linux/FreeBSD DAAP (iTunes), MPD (Music Player Daemon) and
  RSP (Roku) media server. It has support for AirPlay speakers, Chromecast,
  Apple Remote (and compatibles), MPD clients, internet radio and LastFM. It
  does not support AirPlay/Chromecast video.
endef

define Package/forked-daapd/conffiles
/etc/forked-daapd.conf
endef

CONFIGURE_ARGS += \
	--enable-itunes \
	--enable-lastfm \
	--enable-mpd \
	--enable-chromecast

TARGET_CFLAGS += $(FPIC)
TARGET_LDFLAGS += -Wl,-rpath-link,$(STAGING_DIR)/usr/lib

define Package/forked-daapd/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/forked-daapd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/forked-daapd.conf $(1)/etc/forked-daapd.conf
	$(INSTALL_DIR) $(1)/usr/lib/forked-daapd
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/forked-daapd/* $(1)/usr/lib/forked-daapd/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/forked-daapd.init $(1)/etc/init.d/forked-daapd
endef

$(eval $(call BuildPackage,forked-daapd))
