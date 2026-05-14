#
# APK Prebuilt modules for Motorola pstar camera
#

LOCAL_PATH := $(call my-dir)

# MotCamera3 (MotCamera4.apk)
include $(CLEAR_VARS)
LOCAL_MODULE := MotCamera4
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := product/priv-app/MotCamera3/MotCamera4.apk
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PREBUILT_JNI_LIBS := \
    product/priv-app/MotCamera3/lib/%/libcamxcapturerequestprocessor.so
include $(BUILD_PREBUILT)

# MotCamera3AI
include $(CLEAR_VARS)
LOCAL_MODULE := MotCamera3AI
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := product/app/MotCamera3AI/MotCamera3AI.apk
include $(BUILD_PREBUILT)

# MotCameraDesktop
include $(CLEAR_VARS)
LOCAL_MODULE := MotCameraDesktop
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := system_ext/priv-app/MotCameraDesktop/MotCameraDesktop.apk
LOCAL_PRIVILEGED_MODULE := true
include $(BUILD_PREBUILT)

# MotoFaceUnlockArcSoft
include $(CLEAR_VARS)
LOCAL_MODULE := MotoFaceUnlockArcSoft
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := product/priv-app/MotoFaceUnlockArcSoft/MotoFaceUnlockArcSoft.apk
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PREBUILT_JNI_LIBS := \
    product/priv-app/MotoFaceUnlockArcSoft/lib/%/libarcsoft-lib.so \
    product/priv-app/MotoFaceUnlockArcSoft/lib/%/libarcsoft_faceid.so \
    product/priv-app/MotoFaceUnlockArcSoft/lib/%/libarcsoftbase.so \
    product/priv-app/MotoFaceUnlockArcSoft/lib/%/libmpbase.so
include $(BUILD_PREBUILT)

# CameraExtensionsProxy
include $(CLEAR_VARS)
LOCAL_MODULE := CameraExtensionsProxy
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := system/app/CameraExtensionsProxy/CameraExtensionsProxy.apk
include $(BUILD_PREBUILT)

# MotoSignatureApp
include $(CLEAR_VARS)
LOCAL_MODULE := MotoSignatureApp
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := system/app/MotoSignatureApp/MotoSignatureApp.apk
include $(BUILD_PREBUILT)

# MotoSignature2App
include $(CLEAR_VARS)
LOCAL_MODULE := MotoSignature2App
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := .apk
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := system/app/MotoSignature2App/MotoSignature2App.apk
include $(BUILD_PREBUILT)
