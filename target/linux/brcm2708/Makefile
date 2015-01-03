#
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/host.mk

ARCH:=arm
BOARD:=brcm2708
BOARDNAME:=Broadcom BCM2708/BCM2835
FEATURES:=ext4 audio usb usbgadget display gpio
MAINTAINER:=Florian Fainelli <florian@openwrt.org>
CPU_TYPE:=arm1176jzf-s
CPU_SUBTYPE:=vfp

LINUX_VERSION:=3.10.49

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += kmod-usb-hid kmod-sound-core kmod-sound-arm-bcm2835 kmod-rtl8192c-common \
										kmod-rtl8192cu kmod-rtlwifi kmod-rtlwifi-usb wpad-mini rpi-userland \
										kmod-usb-core kmod-bluetooth dbus bluez-libs bluez-utils \
										libruby ruby-stdlib ruby \
										lua-bencode lua-penlight lua-sha2 luabitop luafilesystem luai2c lualanes luaposix luasec dkjson \
										python-base python-dns python-imglib python-pip python simplejson \
										python3-base python3

define Target/Description
	Build firmware image for Broadcom BCM2708/BCM2835 SoC devices.
	Currently produces SD Card image for Raspberry Pi.
endef

KERNELNAME="Image"

$(eval $(call BuildTarget))
