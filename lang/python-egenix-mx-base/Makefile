#
# Copyright (C) 2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-egenix-mx-base
PKG_VERSION:=3.2.8
PKG_RELEASE:=1
PKG_MAINTAINER:=Dmitry Trefilov <the-alien@live.ru>
PKG_LICENSE:=eGenix.com Public License 1.1.0
PKG_LICENSE_FILES:=LICENSE COPYRIGHT

PKG_SOURCE:=egenix-mx-base-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://downloads.egenix.com/python/
PKG_MD5SUM:=9d9d3a25f9dc051a15e97f452413423b

PKG_BUILD_DIR:=$(BUILD_DIR)/egenix-mx-base-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-egenix-mx-base
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=+USE_EGLIBC:librt +USE_UCLIBC:librt +python
  TITLE:=Egenix mxBase
  URL:=http://www.egenix.com/products/python/mxBase/
endef

define Package/python-egenix-mx-base/description
 The eGenix.com mx Base Distribution for Python is a collection
 of professional quality software tools which enhance Python's
 usability in many important areas such as fast text searching,
 date/time processing and high speed data types.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define PyPackage/python-egenix-mx-base/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call PyPackage,python-egenix-mx-base))
$(eval $(call BuildPackage,python-egenix-mx-base))
