#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
$(call inherit-product, device/motorola/sm8250-common/common.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResPstar \
    SystemUIResPstar \
    SettingsProviderResPstar

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libgui_shim_vendor

# Camera configuration files from HelloUI KSU pstar module
PRODUCT_COPY_FILES += \
    vendor/motorola/pstar/proprietary/vendor/etc/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    vendor/motorola/pstar/proprietary/vendor/etc/media_profiles_kona.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_kona.xml \
    vendor/motorola/pstar/proprietary/vendor/etc/camera/vidhance_calibration:$(TARGET_COPY_OUT_VENDOR)/etc/camera/vidhance_calibration \
    vendor/motorola/pstar/proprietary/vendor/etc/camera/vidhance_calibration_32:$(TARGET_COPY_OUT_VENDOR)/etc/camera/vidhance_calibration_32

PRODUCT_SYSTEM_PROPERTIES += \
    camera.disable_zsl_mode=1 \
    init.svc.cameraserver=running \
    init.svc.imgtuner-hal-1-0=running

PRODUCT_PRODUCT_PROPERTIES += \
    ro.camera.cfa.packagelist=com.motorola.coresettingsext,com.motorola.camera2,com.motorola.camera3,com.motorola.actions \
    ro.com.google.lens.oem_camera_package=com.motorola.camera3 \
    ro.product.motcameradesktop=1

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.expose.aux=1 \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.motorola.camera3 \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.motorola.camera2,com.motorola.camera3,com.motorola.motocit \
    vendor.camera.aux.packagelist2=com.motorola.ccc,com.android.settings \
    vendor.vidhance.enabled=0 \
    vendor.vidhance.preview.enabled=0 \
    vendor.vidhance.video.enabled=0 \
    persist.vendor.vidhance.enabled=0 \
    persist.vendor.vidhance.preview.enabled=0 \
    persist.vendor.vidhance.video.enabled=0 \
    vendor.vidhance.video.usecallback=1 \
    vendor.vidhance.video.increasedsize=0 \
    vendor.vidhance.gyro.timestampbaseconversion=1 \
    persist.vendor.vidhance.video.usecallback=1 \
    persist.vendor.vidhance.video.increasedsize=0 \
    persist.vendor.vidhance.gyro.timestampbaseconversion=1 \
    persist.vendor.camera.eis.enable=0 \
    persist.vendor.camera.eisv2.enable=0 \
    persist.vendor.camera.eisv3.enable=0 \
    persist.vendor.camera.vidhance.cameraId1.enable=0 \
    persist.vendor.camera.vidhance.front.enable=0

# Init
PRODUCT_PACKAGES += \
    init.device.rc

# LiveDisplay
$(call soong_config_set_bool,livedisplay_sysfs,enable_af,true)

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_ODM)/etc/media_profiles_V1_0.xml

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/pstar/pstar-vendor.mk)

# Maintainer Name
INFINITY_MAINTAINER := VotikaBr

# Whether the device supports Fingerprint On Display
TARGET_HAS_UDFPS := false

# Whether Including Google Apps
WITH_GAPPS := true