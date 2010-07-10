# Generic product
PRODUCT_NAME := AOSIP
PRODUCT_BRAND := AOSIP
PRODUCT_DEVICE := generic

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb

ifneq ($(filter aosip_flo aosip_hammerhead aosip_shamu aosip_sprout4 aosip_sprout8,$(TARGET_PRODUCT)),)
# Camera Effects
PRODUCT_COPY_FILES +=  \
    vendor/aosip/proprietary/common/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/aosip/proprietary/common/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/app/NovaLauncher.apk:system/priv-app/NovaLauncher.apk

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/bin/sysinit:system/bin/sysinit

# AOSiP-specific init file
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/etc/init.aosip.rc:root/init.aosip.rc

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# Required aosip packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME

# Optional aosip packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    Basic

# emoji
PRODUCT_PACKAGES += \
    libemoji

PRODUCT_PACKAGE_OVERLAYS += vendor/aosip/overlay/common
