#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修复rust编译错误
sed -i 's/download-ci-llvm=true/download-ci-llvm=false/g' package/feeds/packages/rust/Makefile

# 修改默认 IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate

# 修改默认端口
sed -i "s/ucidef_set_interface_lan 'eth0'/ucidef_set_interface_lan 'eth1'/g" package/base-files/files/etc/board.d/99-default_network
sed -i "s/ucidef_set_interface_wan 'eth1'/ucidef_set_interface_wan 'eth0'/g" package/base-files/files/etc/board.d/99-default_network
