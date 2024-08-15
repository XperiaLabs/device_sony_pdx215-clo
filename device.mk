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

# Audio Policies
PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_io_policy.conf


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
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    vendor/qcom/opensource/audio-hal/primary-hal/configs/lahaina/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/bluetooth_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_hearing_aid_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_ODM)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_platform_info.xml

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
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
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

# UFFD
PRODUCT_ENABLE_UFFD_GC := false

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

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# FM
BOARD_HAVE_QCOM_FM := false

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# HIDL
PRODUCT_PACKAGES += \
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
    init.qcom.msim.sh \
    init.qcom.usb.sh \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.sony.rc \
    ueventd.pdx215.rc \
    fstab.default \
    fstab.default.vendor_ramdisk \
    init.sony-device-common.rc \
    init.sony-platform.rc \
    init.sony.rc \
    init.sony.usb.rc

# Kernel Modules
PRODUCT_VENDOR_KERNEL_HEADERS += $(DEVICE_PATH)-kernel/kernel-headers

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libcodec2_hidl@1.0.vendor

# Media (Device)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs_performance_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_lahaina.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_lahaina_vendor.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_lahaina.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_lahaina_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_lahaina_vendor.xml

# Native Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/linker/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Neural networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.nxp \
    android.hardware.secure_element@1.2.vendor \

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc

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

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-3.9.1-vendorcompat

# Protobuf Prebuilts
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm/arch-arm-armv7-a-neon/shared/vndk-core/libprotobuf-cpp-full.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-full.so \
    prebuilts/vndk/v29/arm/arch-arm-armv7-a-neon/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-lite.so \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-core/libprotobuf-cpp-full.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libprotobuf-cpp-full.so \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-core/libprotobuf-cpp-lite.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libprotobuf-cpp-lite.so

# QTI Components
TARGET_COMMON_QTI_COMPONENTS := \
    adreno \
    alarm \
    audio \
    av \
    bt \
    charging \
    display \
    dsprpcd \
    gps \
    init \
    keymaster \
    media \
    nfc \
    overlay \
    perf \
    qseecomd \
    telephony \
    usb \
    wfd \
    wlan

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
    hardware/sony

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

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti
    
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

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wlan/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

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
