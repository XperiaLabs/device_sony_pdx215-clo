#
# Copyright (C) 2024 XperiaLabs Project
# Copyright (C) 2023-2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Include pdx215 vendor blobs
$(call inherit-product, vendor/sony/pdx215/pdx215-vendor.mk)

# Paths
DEVICE_PATH := device/sony/pdx215
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# API
BOARD_SHIPPING_API_LEVEL := 30
BOARD_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := 30

# Architecture
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOOTLOADER_BOARD_NAME := lahaina

# Authsecret
PRODUCT_PACKAGES += \
    android.hardware.authsecret@1.0.vendor

# Audio
PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_hhg.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_hhg.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_cdp.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_hdk.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_cdp.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_hdk.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_qrd.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_hhg.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_hhg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_hhg.xml\
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_cdp.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_hdk.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths_qrd.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_cdp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_cdp.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_hdk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_hdk.xml\
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths_qrd.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths.xml

# Boot
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service \
    checkpoint_gc \
    otapreopt_script \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_PACKAGES += \
    android.hardware.camera.device@3.5.vendor \
    android.hardware.camera.provider@2.6.vendor \
    android.hardware.camera.common@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

# DebugFS
PRODUCT_ENABLE_UFFD_GC := false
PRODUCT_SET_DEBUGFS_RESTRICTIONS := true

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig.qti \
    libqdMetaData \
    libtinyxml \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    init.qti.display_boot.sh \
    libdisplayconfig.qti \
    libdisplayconfig.system.qti \
    libqdMetaData.system \
    libsdmcore \
    libsdmutils \
    memtrack.default \
    libmemutils \
    vendor.display.config@1.5 \
    vendor.display.config@1.15.vendor \
    vendor.display.config@2.0 \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.config-V5-ndk \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor

PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss@2.1.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# FM
BOARD_HAVE_QCOM_FM := false

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl-qti \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    libhidltransport.vendor \
    libhwbinder.vendor \
    android.hidl.memory.block@1.0.vendor

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Input
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

#  IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# Init
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.msim.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc \
    ueventd.sony.rc \
    fstab.default \
    fstab.default.vendor_ramdisk \
    init.sony-device-common.rc \
    init.sony-platform.rc \
    init.sony.rc

# Kernel Modules Install Path
KERNEL_MODULES_INSTALL := dlkm
KERNEL_MODULES_OUT := $(OUT_DIR)/target/product/pdx215/$(KERNEL_MODULES_INSTALL)/lib/modules

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \
    libavservices_minijail_vendor \
    libcodec2_hidl@1.0.vendor

# Media (Device)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/media/media_codecs_performance_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_lahaina.xml \
    $(DEVICE_PATH)/media/media_codecs_performance_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_lahaina_vendor.xml \
    $(DEVICE_PATH)/media/media_codecs_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_lahaina.xml \
    $(DEVICE_PATH)/media/media_codecs_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_lahaina_vendor.xml

# Light
PRODUCT_PACKAGES += \
    android.hardware.lights-service.qti \
    lights.sony

# Native Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/linker/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Net
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor \
    netutils-wrapper-1.0

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    Tag \
    NfcNci

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Overlay Packages
PRODUCT_PACKAGES += \
    CarrierConfigResCommon \
    SonyPDX215SystemUIRes \
    SonySagamiFrameworksResCommon \
    SonySagamiSettingsProviderOverlayCommon \
    SonySagamiSettingsResCommon \
    SonySagamiSystemUIResCommon \
    SonySagamiTelephonyResCommon \
    WifiResCommon \
    NfcResTarget

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    all \
    charging \
    dsprpcd \
    keymaster \
    qseecomd

# SDK
BOARD_SYSTEMSDK_VERSIONS := 30

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0 \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@2.0-service.multihal \
    libsensorndkbridge

# System Helper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0.vendor

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/sony \
    vendor/qcom/opensource/usb/etc

# Sony Display Interface
PRODUCT_PACKAGES += \
    vendor.semc.hardware.display@2.0.vendor \
    vendor.semc.hardware.display@2.1.vendor \
    vendor.semc.hardware.display@2.2.vendor \
    vendor.semc.hardware.display@2.3.vendor \
    vendor.semc.hardware.display@2.4.vendor

# Shim
PRODUCT_PACKAGES += \
    android.hardware.light-V1-ndk_platform.vendor \
    android.hidl.base@1.0.vendor

# Telephony
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-qti.xml

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service-qti

# Vendor libstdc++
PRODUCT_PACKAGES += \
    libstdc++_vendor

# Vendor Service Manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-sony.service.cs40l25

# QTI Service Tracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.0.vendor \
    vendor.qti.hardware.servicetracker@1.1.vendor \
    vendor.qti.hardware.servicetracker@1.2.vendor

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwpa_client \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    vendor.qti.hardware.wifi.hostapd@1.2.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    wpa_supplicant \
    wpa_supplicant.conf

# Xperia Modules | Xperia Extras
#$(call inherit-product, hardware/sony/XperiaModules.mk)
#$(call inherit-product, vendor/sony/extra/Sagami/extra.mk)

# Xperia Modules - Flags
#TARGET_SHIPS_XPERIA_SETTINGS_MENU := true
#TARGET_SUPPORTS_IMAGE_ENHANCEMENT := true
#TARGET_SUPPORTS_BATTERY_CARE := true
#TARGET_SUPPORTS_HIGH_REFRESH_RATE := true
#TARGET_SUPPORTS_HIGH_POLLING_RATE := true

# Xperia Extras - Flags
#TARGET_SHIPS_SONY_FRAMEWORK := true
#TARGET_SHIPS_SONY_CAMERA := true
#TARGET_SHIPS_SONY_APPS := true
#TARGET_SUPPORTS_GAME_CONTROLLERS := true
#TARGET_SUPPORTS_XPERIA_STREAM := true

# WLAN
PRODUCT_COPY_FILES += \
    device/qcom/wlan/lahaina/WCNSS_qcom_cfg_wlan.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini
