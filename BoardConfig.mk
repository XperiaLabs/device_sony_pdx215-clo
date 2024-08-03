#
# Copyright (C) 2024 XperiaLabs Project
# Copyright (C) 2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit Mainline Common BoardConfig
include build/make/target/board/BoardConfigMainlineCommon.mk

# Paths
DEVICE_PATH := device/sony/pdx215
BOARD_VENDOR := sony

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

TARGET_BOOTLOADER_BOARD_NAME := lahaina
TARGET_NO_BOOTLOADER := true

# AVB
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# Use sha256 for dm-verity partitions
BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_ODM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256

# Audio
TARGET_COMBINES_MIXER_PATHS := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Display
TARGET_SCREEN_DENSITY := 440

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/filesystem/config.fs

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_pdx215
TARGET_RECOVERY_DEVICE_MODULES := libinit_pdx215

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/vintf/device_framework_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/vintf/manifest_lahaina.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 \
    androidboot.hardware=qcom \
    androidboot.init_fatal_reboot_target=recovery \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    kpti=off \
    lpm_levels.sleep_disabled=1 \
    android_kmalloc_64_create=true \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    androidboot.usbcontroller=a600000.dwc3 \
    swiotlb=0 \
    loop.max_part=7 \
    cgroup.memory=nokmem,nosocket \
    pcie_ports=compat \
    loop.max_part=7 \
    iptable_raw.raw_before_defrag=1 \
    ip6table_raw.raw_before_defrag=1 \
    buildproduct=pdx215 \
    androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_RAMDISK_USE_LZ4 := true
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_KERNEL_SOURCE := kernel/sony/sagami
TARGET_KERNEL_CONFIG := pdx215_defconfig
TARGET_KERNEL_CONFIG += vendor/debugfs.config
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_NO_GCC := true
KERNEL_LTO := thin

# Use External DTC
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc \
    DTC_OVERLAY_TEST_EXT=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/libufdt/ufdt_apply_overlay \
    LLVM=1 LLVM_IAS=1

BOARD_VENDOR_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/adsp_loader_dlkm.ko \
    $(KERNEL_MODULES_OUT)/apr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/bolero_cdc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/bt_fm_slim.ko \
    $(KERNEL_MODULES_OUT)/btpower.ko \
    $(KERNEL_MODULES_OUT)/camera.ko \
    $(KERNEL_MODULES_OUT)/e4000.ko \
    $(KERNEL_MODULES_OUT)/fc0011.ko \
    $(KERNEL_MODULES_OUT)/fc0012.ko \
    $(KERNEL_MODULES_OUT)/fc0013.ko \
    $(KERNEL_MODULES_OUT)/fc2580.ko \
    $(KERNEL_MODULES_OUT)/hdmi_dlkm.ko \
    $(KERNEL_MODULES_OUT)/hid-aksys.ko \
    $(KERNEL_MODULES_OUT)/it913x.ko \
    $(KERNEL_MODULES_OUT)/llcc_perfmon.ko \
    $(KERNEL_MODULES_OUT)/m88rs6000t.ko \
    $(KERNEL_MODULES_OUT)/machine_dlkm.ko \
    $(KERNEL_MODULES_OUT)/max2165.ko \
    $(KERNEL_MODULES_OUT)/mbhc_dlkm.ko \
    $(KERNEL_MODULES_OUT)/mc44s803.ko \
    $(KERNEL_MODULES_OUT)/msi001.ko \
    $(KERNEL_MODULES_OUT)/msm_drm.ko \
    $(KERNEL_MODULES_OUT)/mt2060.ko \
    $(KERNEL_MODULES_OUT)/mt2063.ko \
    $(KERNEL_MODULES_OUT)/mt20xx.ko \
    $(KERNEL_MODULES_OUT)/mt2131.ko \
    $(KERNEL_MODULES_OUT)/mt2266.ko \
    $(KERNEL_MODULES_OUT)/mxl301rf.ko \
    $(KERNEL_MODULES_OUT)/mxl5005s.ko \
    $(KERNEL_MODULES_OUT)/mxl5007t.ko \
    $(KERNEL_MODULES_OUT)/native_dlkm.ko \
    $(KERNEL_MODULES_OUT)/pinctrl_lpi_dlkm.ko \
    $(KERNEL_MODULES_OUT)/pinctrl_wcd_dlkm.ko \
    $(KERNEL_MODULES_OUT)/platform_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_notifier_dlkm.ko \
    $(KERNEL_MODULES_OUT)/q6_pdr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/qm1d1b0004.ko \
    $(KERNEL_MODULES_OUT)/qm1d1c0042.ko \
    $(KERNEL_MODULES_OUT)/qt1010.ko \
    $(KERNEL_MODULES_OUT)/r820t.ko \
    $(KERNEL_MODULES_OUT)/radio-i2c-rtc6226-qca.ko \
    $(KERNEL_MODULES_OUT)/rdbg.ko \
    $(KERNEL_MODULES_OUT)/rmnet_core.ko \
    $(KERNEL_MODULES_OUT)/rmnet_ctl.ko \
    $(KERNEL_MODULES_OUT)/rmnet_offload.ko \
    $(KERNEL_MODULES_OUT)/rmnet_shs.ko \
    $(KERNEL_MODULES_OUT)/rx_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/si2157.ko \
    $(KERNEL_MODULES_OUT)/slimbus.ko \
    $(KERNEL_MODULES_OUT)/slimbus-ngd.ko \
    $(KERNEL_MODULES_OUT)/snd_event_dlkm.ko \
    $(KERNEL_MODULES_OUT)/stub_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_ctrl_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_dmic_dlkm.ko \
    $(KERNEL_MODULES_OUT)/swr_haptics_dlkm.ko \
    $(KERNEL_MODULES_OUT)/tda18212.ko \
    $(KERNEL_MODULES_OUT)/tda18218.ko \
    $(KERNEL_MODULES_OUT)/tda18250.ko \
    $(KERNEL_MODULES_OUT)/tda9887.ko \
    $(KERNEL_MODULES_OUT)/tea5761.ko \
    $(KERNEL_MODULES_OUT)/tea5767.ko \
    $(KERNEL_MODULES_OUT)/tua9001.ko \
    $(KERNEL_MODULES_OUT)/tuner-simple.ko \
    $(KERNEL_MODULES_OUT)/tuner-types.ko \
    $(KERNEL_MODULES_OUT)/tuner-xc2028.ko \
    $(KERNEL_MODULES_OUT)/tx_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/va_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd937x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd937x_slave_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd938x_slave_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd9xxx_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wcd_core_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wlan.ko \
    $(KERNEL_MODULES_OUT)/wsa883x_dlkm.ko \
    $(KERNEL_MODULES_OUT)/wsa_macro_dlkm.ko \
    $(KERNEL_MODULES_OUT)/xc4000.ko \
    $(KERNEL_MODULES_OUT)/xc5000.ko

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := \
    $(KERNEL_MODULES_OUT)/msm_drm.ko

# GPS
LOC_HIDL_VERSION = 4.0

# Partition
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vendor \
    vendor_boot \
    vendor_dlkm \
    vbmeta \
    vbmeta_system

AB_OTA_UPDATER := true

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    product \
    system \
    system_ext \
    odm \
    vendor \
    vendor_dlkm

# Metadata
BOARD_USES_METADATA_PARTITION := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x06000000
# Reserve space for data encryption (109553123000-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 235769556992
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_EROFS_PCLUSTER_SIZE := 262144
BOARD_EROFS_COMPRESSOR := lz4
BOARD_SOMC_DYNAMIC_PARTITIONS_PARTITION_LIST := product system vendor odm system_ext vendor_dlkm
# Dynamic partition size = (Super partition size / 2) - 4MB
BOARD_SOMC_DYNAMIC_PARTITIONS_SIZE := 7243563008
BOARD_SUPER_PARTITION_GROUPS := somc_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 14495514624
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Properties
TARGET_ODM_PROP += \
    $(DEVICE_PATH)/configs/properties/odm.prop

TARGET_PRODUCT_PROP += \
    $(DEVICE_PATH)/configs/properties/product.prop

TARGET_SYSTEM_PROP += \
    $(DEVICE_PATH)/configs/properties/system.prop

TARGET_VENDOR_PROP += \
    $(DEVICE_PATH)/configs/properties/vendor.prop

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := pdx215,XQ-BC42,XQ-BC52,XQ-BC62,XQ-BC72,SO-51B,SOG03,A101S

# Recovery
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.default
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security Patch Level
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# SEPolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include hardware/sony/sepolicy/qti/SEPolicy.mk

# SELinux Neverallows
ifdef SELINUX_IGNORE_NEVERALLOWS
else
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
SELINUX_IGNORE_NEVERALLOWS := true
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
SELINUX_IGNORE_NEVERALLOWS := true
endif
endif

# UFS
#namespace definition for librecovery_updater
#differentiate legacy 'sg' or 'bsg' framework
SOONG_CONFIG_NAMESPACES += ufsbsg
SOONG_CONFIG_ufsbsg += ufsframework
SOONG_CONFIG_ufsbsg_ufsframework := bsg