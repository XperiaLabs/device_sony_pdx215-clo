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
        git am --abort
        git rebase --abort
        git reset --hard FETCH_HEAD
        git am ../../device/sony/pdx215/configs/patches/vendor_aospa/0001-products-Introduce-Sony-Xperia-1-III-pdx215.patch
        cd ../..
        echo -e
        echo 'Applying patches to vendor/qcom/opensource/usb'
        cd vendor/qcom/opensource/usb
        git am --abort
        git rebase --abort
        git reset --hard FETCH_HEAD
        git am ../../../../device/sony/pdx215/configs/patches/vendor_qcom_opensource_usb/0001-usb-Add-USB-inits-from-Xiaomi-lisa-DT.patch
        cd ../../../..
        echo -e
        echo 'Applying patches to frameworks/av'
        cd frameworks/av
        git am --abort
        git rebase --abort
        git reset --hard FETCH_HEAD
        git am ../../device/sony/pdx215/configs/patches/frameworks_av/0001-Fixes-vtservice-cpu-hogging.patch
        cd ../..
        echo -e
        echo 'Applying patches to frameworks/base'
        cd frameworks/base
        git am --abort
        git rebase --abort
        git reset --hard FETCH_HEAD
        git am ../../device/sony/pdx215/configs/patches/frameworks_base/0001-SystemUI-Follow-monet-theme-on-privacy-indicators.patch
        git am ../../device/sony/pdx215/configs/patches/frameworks_base/0002-DisplayUtils-Introduce-getScaleFactor.patch
        git am ../../device/sony/pdx215/configs/patches/frameworks_base/0003-SystemUI-Fix-SB-paddings.patch
        cd ../..
        echo -e
        echo 'Applying patches to hardware/libhardware'
        cd hardware/libhardware
        git am --abort
        git rebase --abort
        git reset --hard aospa/uvite
        git am ../../device/sony/pdx215/configs/patches/hardware_libhardware/0001-audio_amplifier-pass-amplifier_device-pointer-to-cal.patch
        cd ../..
        echo -e
        echo 'Applying patches to vendor/qcom/opensource/audio-hal/primary-hal'
        cd vendor/qcom/opensource/audio-hal/primary-hal
        git am --abort
        git rebase --abort
        git reset --hard FETCH_HEAD
        git reset --hard uvite-888
        git reset --hard aospa/uvite-888
        git reset --hard origin/uvite-888
        git am ../../../../../device/sony/pdx215/configs/patches/vendor_qcom_opensource_audio-hal_primary-hal/0001-audio_amplifier-pass-amplifier_device-pointer-to-cal.patch
        cd ../../../../..
        echo -e
        echo 'Applying patches to device/qcom/common'
        cd device/qcom/common
        git am --abort
        git rebase --abort
        git reset --hard FETCH_HEAD
        git am ../../../device/sony/pdx215/configs/patches/device_qcom_common/0001-system-telephony-Build-older-radio-packages.patch
        cd ../../..
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