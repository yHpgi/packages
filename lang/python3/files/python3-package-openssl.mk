#
# Copyright (C) 2006-2016 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Package/python3-openssl
$(call Package/python3/Default)
  TITLE:=Python $(PYTHON3_VERSION) SSL module
  DEPENDS:=+python3-light +libopenssl
endef

$(eval $(call Py3BasePackage,python3-openssl, \
	/usr/lib/python$(PYTHON3_VERSION)/lib-dynload/_hashlib.$(PYTHON3_SO_SUFFIX) \
	/usr/lib/python$(PYTHON3_VERSION)/lib-dynload/_ssl.$(PYTHON3_SO_SUFFIX) \
))
