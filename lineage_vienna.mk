#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable ADPF pipeline for UI performance
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.power.adpf.enable=true \
    ro.vendor.powerhal.adpf.enable=true

# Inherit LineageOS common config
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# GPU (Mali-G615 MC2 on MT6878)
GPU_FREQS_PATH := /sys/devices/platform/13000000.mali/devfreq/available_frequencies
GPU_MIN_FREQ_PATH := /sys/devices/platform/13000000.mali/devfreq/min_freq

# Inherit from vienna device
$(call inherit-product, device/motorola/vienna/device.mk)

PRODUCT_DEVICE := vienna
PRODUCT_NAME := lineage_vienna
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 50 neo
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

DEVICE_CODENAME := vienna

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="vienna_g_sys-user 15 V1UI35M.11-39-5 81bce release-keys" \
    BuildFingerprint=motorola/vienna_g_sys/vienna:15/V1UI35M.11-39-5/81bce:user/release-keys \
    DeviceProduct=vienna_g_sys