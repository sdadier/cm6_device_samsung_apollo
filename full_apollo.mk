# Inherit AOSP device configuration for passion.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/samsung/apollo/prelink-linux-arm-apollo.map

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120

PRODUCT_COPY_FILES += \
        device/common/gps/gps.conf_EU_SUPL:system/etc/gps.conf \
        device/samsung/apollo/prebuilt/LBSModeApp.apk:system/app/LBSModeApp.apk

# For FM-Radio
PRODUCT_PROPERTY_OVERRIDES += \
    fmradio.device = fmradio

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

# Add device package overlay
  DEVICE_PACKAGE_OVERLAYS += device/samsung/apollo/overlay

# Add LDPI assets, in addition to MDPI
  PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
  PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

# Broadcom FM radio
#  $(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# apns config file
PRODUCT_COPY_FILES += \
        vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/apollo/media_profiles.xml:system/etc/media_profiles.xml

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    libcamera.so \
    libsecjpeg.so \
    libsecgps.so \
    gps.GT-I5800 \
    lights.s5p6442 \

# OpenVPN
PRODUCT_PACKAGES += \
    openvpn

PRODUCT_PACKAGES += \
    ADWLauncher \
    CMParts \
    CMPartsHelper \
    CMStats \
    CMUpdateNotify \
    CMWallpapers \
    FileManager \
    Stk \
    Superuser \
    FM \
    dexpreopt

#ifeq ($(BOARD_HAVE_FM_RADIO),true)
#    PRODUCT_PACKAGES += \
#    FM
#endif

#Hardware OMX Codecs
PRODUCT_PACKAGES += \
    libSEC_OMX_Core.s5p6442 \
    libOMX.SEC.AVC.Decoder.s5p6442 \
    libOMX.SEC.M4V.Decoder.s5p6442 \
    libOMX.SEC.AVC.Encoder.s5p6442 \
    libOMX.SEC.M4V.Encoder.s5p6442

PRODUCT_COPY_FILES += \
	device/samsung/apollo/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    librs_jni

# /etc files
PRODUCT_COPY_FILES += \
	device/samsung/apollo/prebuilt/hw/librender.so:system/lib/librender.so \
	device/samsung/apollo/prebuilt/hw/gralloc.GT-I5800.so:system/lib/hw/gralloc.GT-I5800.so \
        device/samsung/apollo/prebuilt/hw/libChunkAlloc.so:system/lib/libChunkAlloc.so \
        device/samsung/apollo/prebuilt/hw/akmd2:system/bin/akmd2 \
        device/samsung/apollo/prebuilt/hw/lights.s5p6442.so:system/lib/hw/lights.s5p6442.so \
	device/samsung/apollo/prebuilt/hw/copybit.GT-I5800.so:system/lib/hw/copybit.GT-I5800.so 

PRODUCT_COPY_FILES += \
	device/samsung/apollo/asound.conf:system/etc/asound.conf \
	device/samsung/apollo/dhcpcd.conf:system/etc/dhcpcd.conf \
	device/samsung/apollo/vold.fstab:system/etc/vold.fstab \
	device/samsung/apollo/vold.conf:system/etc/vold.conf \
	device/samsung/apollo/dbus.conf:system/etc/dbus.conf 


#
# serviceModeApp
#
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/apollo/servicemodeapp/serviceModeApp.apk:system/app/serviceModeApp.apk

#
# Bluetooth
#
PRODUCT_COPY_FILES += \
    device/samsung/apollo/prebuilt/BCM4329B1_002.002.023.0417.0431.hcd:system/bin/BCM4329B1_002.002.023.0417.0431.hcd

# Keyboard maps
PRODUCT_COPY_FILES += \
	device/samsung/apollo/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	device/samsung/apollo/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	device/samsung/apollo/prebuilt/keychars/qt602240_ts_input.kcm.bin:system/usr/keychars/qt602240_ts_input.kcm.bin \
	device/samsung/apollo/prebuilt/keychars/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
	device/samsung/apollo/prebuilt/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
	device/samsung/apollo/prebuilt/keylayout/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl \
	device/samsung/apollo/prebuilt/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
	device/samsung/apollo/prebuilt/keylayout/sec_headset.kl:system/usr/keylayout/sec_headset.kl 


# wifi
PRODUCT_COPY_FILES += \
	device/samsung/apollo/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
	device/samsung/apollo/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
	device/samsung/apollo/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
	device/samsung/apollo/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
	device/samsung/apollo/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
	device/samsung/apollo/wifi/wifi.conf:system/etc/wifi/wifi.conf \
	device/samsung/apollo/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 


PRODUCT_COPY_FILES += \
    device/samsung/apollo/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/apollo/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/apollo/vold.fstab:system/etc/vold.fstab 

# 3d fimg
PRODUCT_COPY_FILES += \
	device/samsung/apollo/prebuilt/fimg-libs/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
        device/samsung/apollo/prebuilt/fimg-libs/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
        device/samsung/apollo/prebuilt/fimg-libs/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so 

# RIL
PRODUCT_COPY_FILES += \
	device/samsung/apollo/prebuilt/apollo/common/lib/libsec-ril.so:system/lib/libsec-ril.so \
        device/samsung/apollo/prebuilt/apollo/common/lib/libril.so:system/lib/libril.so \
        device/samsung/apollo/prebuilt/apollo/common/bin/rild:system/bin/rild

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml
 
#        mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \

PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=eth0 \
       wifi.supplicant_scan_interval=20 \
       dalvik.vm.heapsize=32m \
       ro.opengles.version=131072 \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       media.stagefright.enable-player=true \
       media.stagefright.enable-meta=true \
       media.stagefright.enable-scan=true \
       media.stagefright.enable-http=true \
       keyguard.no_require_sim=true \
       ro.com.android.dataroaming=false \
       dalvik.vm.lockprof.threshold=500 \
       dalvik.vm.dexopt-flags=m=y \
       dalvik.vm.heapsize=32m \
       dalvik.vm.execution-mode=int:jit \
       dalvik.vm.dexopt-data-only=1 

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1


DISABLE_DEXPREOPT := false


# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_apollo
PRODUCT_DEVICE := GT-I5800
PRODUCT_MODEL := GT-I5800
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung


