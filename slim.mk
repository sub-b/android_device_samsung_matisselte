# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Inherit some common Slim stuff.
$(call inherit-product, vendor/slim/config/common_full_tablet_lte.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/matisselte/full_matisselte.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := slim_matisselte
