#
# Copyright (C) 2014 - 2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-html-parser
PKG_VERSION:=3.72
PKG_RELEASE:=1

PKG_SOURCE_URL:=http://www.cpan.org/authors/id/G/GA/GAAS/
PKG_SOURCE:=HTML-Parser-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=eb7505e5f626913350df9dd4a03d54a8

PKG_LICENSE:=GPL-1.0+ Artistic-1.0-Perl
PKG_MAINTAINER:=Marcel Denia <naoir@gmx.net>

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/HTML-Parser-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-html-parser
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A collection of modules that parse HTML text documents
  URL:=http://search.cpan.org/dist/HTML-Parser/
  DEPENDS:=perl +perl-html-tagset +perlbase-essential +perlbase-xsloader
endef

define Build/Configure
	$(call perlmod/Configure,,)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-html-parser/install
	$(call perlmod/Install,$(1),HTML auto/HTML)
endef


$(eval $(call BuildPackage,perl-html-parser))
