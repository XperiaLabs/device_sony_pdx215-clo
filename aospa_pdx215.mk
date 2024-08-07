# Copyright (C) 2024 XperiaLabs Project
# Copyright (C) 2022-2024 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the custom device configuration.
$(call inherit-product, device/sony/pdx215/device.mk)

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# Environment Flags
IS_PHONE := true
TARGET_BUILD_WITH_LTO := true

# Boot Animation
TARGET_SCREEN_HEIGHT := 3840
TARGET_SCREEN_WIDTH := 1644
TARGET_BOOT_ANIMATION_RES := 1440
TARGET_BOOTANIMATION_HALF_RES := true

# Device Identifiers
PRODUCT_NAME := aospa_pdx215
PRODUCT_DEVICE := pdx215
PRODUCT_MANUFACTURER := Sony
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia 1 III

PRODUCT_GMS_CLIENTID_BASE := android-sonymobile

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="XQ-EC72-user 14 69.0.A.2.32 069000A002003200522519484 release-keys"

BUILD_FINGERPRINT := Sony/XQ-EC72/XQ-EC72:14/69.0.A.2.32/069000A002003200522519484:user/release-keys
