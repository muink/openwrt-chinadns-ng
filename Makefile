include $(TOPDIR)/rules.mk

PKG_NAME:=chinadns-ng
PKG_VERSION:=2024.03.27
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/zfl9/chinadns-ng/tar.gz/$(PKG_VERSION)?
PKG_HASH:=45774bc6969049161d0ba5be4e12c56e6b525f07454d7a5ee1d65d25f8c8d1e8

PKG_LICENSE:=AGPL-3.0-only
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=pexcn <pexcn97@gmail.com>

PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0
PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk

define Package/chinadns-ng
	SECTION:=net
	CATEGORY:=Network
	TITLE:=ChinaDNS Next Generation, refactoring with epoll and ipset
	URL:=https://github.com/zfl9/chinadns-ng
	DEPENDS:= #+ipset only required if openwrt <= 21.02
endef

define Package/chinadns-ng/description
ChinaDNS Next Generation, refactoring with epoll and ipset.
endef

define Package/chinadns-ng/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/chinadns-ng $(1)/usr/bin
endef

$(eval $(call BuildPackage,chinadns-ng))
