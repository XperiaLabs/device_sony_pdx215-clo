#
# Copyright (C) 2024 XperiaLabs Project
# Copyright (C) 2024 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

# Bypass Errors
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

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
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/vintf/vendor_framework_compatibility_matrix.xml
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

BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_USE_LZ4 := true
KERNEL_PREBUILT_DIR := device/sony/pdx215-kernel

# Prebuilt Kernel
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_NO_KERNEL := false
BOARD_KERNEL_BINARIES := kernel
BOARD_USES_GENERIC_KERNEL_IMAGE := true
TARGET_HAS_GENERIC_KERNEL_HEADERS := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtbs/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbs/dtbo.img
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/Image
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)-kernel/dtbs/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(DEVICE_PATH)-kernel/Image:kernel \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/ramdisk-modules/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor-modules/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules)

# Kernel Modules
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/modules.include.recovery))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(KERNEL_PREBUILT_DIR)/modules.blocklist
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILT_DIR)/modules.load))

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
ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 660602880
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 660602880
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 660602880
endif
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := erofs
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
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/privatess

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