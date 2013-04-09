# Copyright (C) 2009 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include vendor/samsung/apollo/BoardConfigVendor.mk

# Board
TARGET_BOARD_PLATFORM := s5p6442
#TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_ARCH_VARIANT_CPU := arm1176jzf-s
TARGET_GLOBAL_CFLAGS += -mtune=arm1176jzf-s -mfpu=vpf -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=softfp

TARGET_BOOTLOADER_BOARD_NAME := GT-I5800
TARGET_OTA_ASSERT_DEVICE := apollo,GT-I5800,GT-I5801

# Camera
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true
#BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_CAMERA_LIBRARIES := libcamera libseccamera libsecjpeg
#USE_OVERLAY_FORMAT_YCbCr_420_SP := true
BUILD_PV_VIDEO_ENCODERS := 1
BOARD_V4L2_DEVICE := /dev/video2
BOARD_CAMERA_DEVICE := /dev/video0

# 2d/3d
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
#BOARD_USES_COPYBIT := false
#BOARD_NO_RGBX_8888 := true
TARGET_BOARD_PLATFORM_GPU := fimg
BOARD_EGL_CFG := vendor/samsung/apollo/proprietary/JPM/egl.cfg
BOARD_USES_OVERLAY := false

# GPS
BOARD_GPS_LIBRARIES := libsecgps libsecril-client
BOARD_USES_GPSSHIM := true

# sensors
TARGET_USES_OLD_LIBSENSORS_HAL := true
TARGET_SENSORS_NO_OPEN_CHECK := true

# TARGET_PROVIDES_LIBRIL := true

WITH_DEXPREOPT := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8

# FM Radio
BOARD_HAVE_FM_RADIO := true
TARGET_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
TARGET_GLOBAL_CPPFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4709

TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_RECOVERY_INITRC := device/samsung/apollo/initramfs/init.rc

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BT_ALT_STACK := true
BRCM_BT_USE_BTL_IF := true
BRCM_BTL_INCLUDE_A2DP := true
BRCM_BTL_INCLUDE_OBEX := true
BRCM_BTL_OBEX_USE_DBUS := true

#BOARD_USES_LIBSECRIL_STUB := true

# storage
BOARD_USE_USB_MASS_STORAGE_SWITCH := false
# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Kernel
TARGET_PREBUILT_KERNEL := device/samsung/apollo/kernel
BOARD_KERNEL_CMDLINE := console=ttySAC1,115200 loglevel=4
BOARD_KERNEL_BASE := 0x20000000
BOARD_NAND_PAGE_SIZE := 4096 -s 128
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 7864320
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 196608000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2013265920
BOARD_FLASH_BLOCK_SIZE := 4096

# Wifi
WPA_SUPPLICANT_VERSION      := VER_0_5_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE 	    := eth0
WIFI_DRIVER_MODULE_PATH     := "/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/bcm4329_sta.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/bcm4329_aps.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcm4329_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"
#BOARD_SOFTAP_DEVICE         := eth0
#BOARD_WEXT_NO_COMBO_SCAN := true

# USB Tether defines
RNDIS_DEVICE := "/sys/devices/virtual/sec/switch/tethering"

#
#BOARD_USES_FFORMAT := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_HAS_NO_RECOVERY_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_PROVIDES_BOOTMODE := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/apollo/recovery/recovery_ui.c
BOARD_BOOT_DEVICE := /dev/block/bml5
BOARD_DATA_DEVICE := /dev/block/stl7
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_HAS_DATADATA := false
#BOARD_DATADATA_DEVICE := /dev/block/stl10
#BOARD_DATADATA_FILESYSTEM := auto
#BOARD_DATADATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_SYSTEM_DEVICE := /dev/block/stl6
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no
BOARD_CACHE_DEVICE := /dev/block/stl8
BOARD_CACHE_FILESYSTEM := ext2
BOARD_CACHE_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_SDEXT_DEVICE := /dev/block/mmcblk0p2
BOARD_SDEXT_FILESYSTEM := auto
BOARD_HAS_PARAMFS := false
#BOARD_PARAMFS_DEVICE := dev/block/stl3
#BOARD_PARAMFS_FILESYSTEM := rfs
BOARD_USES_BMLUTILS := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p1
BOARD_HAS_SDCARD_INTERNAL := false
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_ROOT_IS_RECOVERY := true
TARGET_BOOT_IS_RAMDISK := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
BOARD_LDPI_RECOVERY := true



