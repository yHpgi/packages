#
# Copyright (C) 2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-html-form
PKG_VERSION:=6.03
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.cpan.org/authors/id/G/GA/GAAS
PKG_SOURCE:=HTML-Form-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=fa6c2680207ed4fef5ea2ef09c210614

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Marcel Denia <naoir@gmx.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/HTML-Form-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-html-form
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Class that represents an HTML form element
  URL:=http://search.cpan.org/dist/HTML-Form/
  DEPENDS:=perl +perl-html-parser +perl-http-message +perl-uri +perlbase-encode +perlbase-essential
endef

define Build/Configure
        $(call perlmod/Configure,,)
endef

define Build/Compile
        $(call perlmod/Compile,,)
endef

define Package/perl-html-form/install
        $(call perlmod/Install,$(1),HTML auto/HTML)
endef


$(eval $(call BuildPackage,perl-html-form))
