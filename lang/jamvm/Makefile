#
# Copyright (C) 2006-2015 BoluWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jamvm
PKG_VERSION:=2.0.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-2.0+
PKG_MAINTAINER:=Dana H. Myers <k6jq@comcast.net>

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=a6e3321ef4b3cfb4afc20bd75452e11e

PKG_USE_MIPS16:=0

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/jamvm
  SUBMENU:=Java
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A compact Java Virtual Machine
  URL:=http://sourceforge.net/projects/jamvm
  DEPENDS:=+zlib +libpthread +librt +classpath @!avr32
endef

define Package/jamvm/description
 JamVM is a new Java Virtual Machine which conforms to the JVM
 specification version (blue book). In comparison to most other VM's (free
 and commercial) it is extremely small.However, unlike other small VMs
 (e.g. KVM) it is designed to support the full specification, and includes
 support for object finalisation, Soft/Weak/Phantom References, the Java
 Native Interface (JNI) and the Reflection API.
endef

CONFIGURE_ARGS += \
	--with-java-runtime-library=gnuclasspath \
	--with-classpath-install-dir=/usr \
	--disable-int-inlining \
	--disable-shared \
	--without-pic

MAKE_FLAGS += \
	GLIBJ_ZIP=$(STAGING_DIR)/usr/share/classpath/glibj.zip

define Package/jamvm/install
	$(INSTALL_DIR) $(1)/usr
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin \
		$(PKG_INSTALL_DIR)/usr/share \
		$(1)/usr/
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,jamvm))
