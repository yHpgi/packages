#
# Copyright (C) 2007-2014 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=MySQL-python
PKG_VERSION:=1.2.5
PKG_RELEASE:=1
PKG_LICENSE:=GPL-2.0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/M/MySQL-python/
PKG_MD5SUM:=654f75b302db6ed8dc5a898c625e030c

PKG_BUILD_DEPENDS:=python python-setuptools libmysqlclient

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-mysql
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=MySQL database adapter for Python
  URL:=https://pypi.python.org/pypi/MySQL-python
  MAINTAINER:=Gergely Kiss <mail.gery@gmail.com>
  DEPENDS:=+python +libmysqlclient
endef

define Package/python-mysql/description
 MySQLdb is an thread-compatible interface to the popular MySQL database
 server that provides the Python database API.
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root=$(PKG_INSTALL_DIR))
endef

define Package/python-mysql/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-mysql))
