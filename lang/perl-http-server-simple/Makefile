#
# Copyright (C) 2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-http-server-simple
PKG_VERSION:=0.51
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.cpan.org/authors/id/B/BP/BPS
PKG_SOURCE:=HTTP-Server-Simple-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=ef736daddc7a32a29207fa4ed5f5d62e

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Marcel Denia <naoir@gmx.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/HTTP-Server-Simple-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-http-server-simple
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Lightweight HTTP server
  URL:=http://search.cpan.org/dist/HTTP-Server-Simple/
  DEPENDS:=perl +perl-cgi +perlbase-base +perlbase-essential +perlbase-filehandle +perlbase-socket +perlbase-test
endef

define Build/Configure
        $(call perlmod/Configure,,)
endef

define Build/Compile
        $(call perlmod/Compile,,)
endef

define Package/perl-http-server-simple/install
        $(call perlmod/Install,$(1),HTTP auto/HTTP)
endef


$(eval $(call BuildPackage,perl-http-server-simple))
