# Inherit device configuration
$(call inherit-product, device/zte/kis3/kis3.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/omni/config/gsm.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kis3
PRODUCT_NAME := lineage_kis3
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Kis 3
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := Kis 3
