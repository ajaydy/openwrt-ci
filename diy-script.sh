#!/bin/bash
set -e

# Remove LuCI feed if it exists
sed -i '/src-git luci/d' feeds.conf.default

# Add OUI feed if not already present
grep -q 'src-git oui' feeds.conf.default || echo "src-git oui https://github.com/zhaojh329/oui.git" >> feeds.conf.default

# Remove any existing feeds/luci folder
rm -rf feeds/luci

# Optional: Remove LuCI-related config entries
if [ -f .config ]; then
  sed -i '/CONFIG_PACKAGE_luci/d' .config
  sed -i '/CONFIG_PACKAGE_luci-/d' .config
  sed -i '/CONFIG_PACKAGE_luci_/d' .config
  sed -i '/CONFIG_LUCI_/d' .config
fi

echo "[OK] diy-script.sh executed successfully."