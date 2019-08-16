LOCAL_PATH := device/zte/kis3

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/fstab.qcom:root/fstab.qcom \
    $(LOCAL_PATH)/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(LOCAL_PATH)/recovery/ueventd.qcom.rc:root/ueventd.qcom.rc

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/verity.mk)

ifneq (,$(filter eng,$(TARGET_BUILD_VARIANT)))
	PRODUCT_SUPPORTS_BOOT_SIGNER := true
	PRODUCT_VERITY_SIGNING_KEY := build/target/product/security/verity
endif

PRODUCT_NAME := kis3