#!/bin/sh -l

cd /home/build/openwrt || exit 1

cp -f feeds.conf.default feeds.conf
sed -i 's#git.openwrt.org/project/luci#github.com/openwrt/luci#' feeds.conf

test -d "package/luci-app-v2ray" && \
rm -rf "package/luci-app-v2ray"

git clone -b luci2 https://github.com/woniuzfb/luci-app-v2ray.git package/luci-app-v2ray

./scripts/feeds update luci
./scripts/feeds install -a -p luci

make defconfig

make package/luci-app-v2ray/compile V=s

find "bin/packages/" -type f -name "luci-app-v2ray*.ipk" -exec sudo cp -f {} "$WORKSPACE" \;
find "bin/packages/" -type f -name "luci-i18n*.ipk" -exec sudo cp -f {} "$WORKSPACE" \;
find "$WORKSPACE" -type f -name "*.ipk" -exec ls -lh {} \;

date=$(date)
echo "::set-output name=date::$date"
