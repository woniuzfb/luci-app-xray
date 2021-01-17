# luci-app-xray docker action

This action build luci-app-xray with openwrt docker container.

Package name is the same as luci-app-v2ray.

## Outputs

### `date`

The build date.

## Example usage

```bash
  env:
    WORKSPACE: ${{ github.workspace }}
  uses: woniuzfb/luci-app-xray@v1

git push -d origin v2.x.x
git tag -a v2.x.x -f
git push origin v2.x.x

opkg install luci-app-v2ray_2.x.x_all.ipk --force-reinstall
opkg install luci-i18n-v2ray-zh-cn_git-xxxx_all.ipk
```
