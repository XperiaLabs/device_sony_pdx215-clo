#!/bin/bash

echo "This script will apply patches and fixes to your ROMs source code."
echo "Choose an option:"
echo "1. Apply first build patches and start building (For a first time build or if you have repo synced to update the ROM)"
echo "2. Skip patching process and start building (After the first build, if patches have been already been applied)"
read -p "Enter your choice: " choice

case $choice in
    1)
        echo -e
        echo 'Applying patches...'
        echo -e
        echo 'Applying patches to vendor/aospa'
        echo -e
        cd vendor/aospa
        git reset --hard FETCH_HEAD
        echo -e
        git am ../../device/sony/pdx215/configs/patches/vendor_aospa/0001-products-Introduce-Sony-Xperia-1-III-pdx215.patch
        cd ../..
        echo -e
        echo 'Done Applying all Patches!'
        echo -e
        echo 'Checking if problematic FM folder exists...'
        echo -e
        if [[ -d vendor/qcom/opensource/commonsys/fm ]]; then
            echo 'Problematic FM folder found! Removing...'
            rm -rf vendor/qcom/opensource/commonsys/fm/
            echo 'Problematic FM successfully removed!'
            echo -e
        else
            echo 'Problematic FM folder not found, skipping removal.'
            echo -e
        fi
        echo 'All patches and fixes have been applied! Starting build process...'
        echo -e
        ;;
    2)
        echo "Patches and fixes skipped... Starting build process."
        ;;
    *)
        echo "Invalid choice! Using option 2 as a fallback."
        choice=2
        ;;
esac

if [[ "$choice" == "2" ]]; then
    echo -e
fi