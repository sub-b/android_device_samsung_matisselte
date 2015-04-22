# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from common msm8226
-include device/samsung/msm8226-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/matisselte/include

TARGET_OTA_ASSERT_DEVICE := matissewifi,matissewifixx,matisselte,matisseltexx,matisselteattxx,matisselteusc,matisselteuscxx,matisseltevzw,matisseltevzwxx,matisse3g,matisse3gxx

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/matisselte/mkbootimg-lte.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
TARGET_KERNEL_SOURCE := kernel/samsung/s3ve3g
TARGET_KERNEL_CONFIG := msm8226-cm_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8926-cm_matisselte_defconfig
KERNEL_TOOLCHAIN_PREFIX := arm-linux-gnueabihf-
KERNEL_TOOLCHAIN := "$(ANDROID_BUILD_TOP)/prebuilt/$(HOST_OS)-x86/toolchain/linaro-4.9-14.06/bin/"

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1

# Audio
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true
BOARD_HAVE_SAMSUNG_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_FLUENCE_FOR_VOIP := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_DISABLED_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# GPS
TARGET_NO_RPC := true
TARGET_GPS_HAL_PATH := device/samsung/matisselte/gps
TARGET_PROVIDES_GPS_LOC_API := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/samsung/matisselte/init/init_matisselte.c
TARGET_UNIFIED_DEVICE := true

# Graphics
TARGET_HAVE_NEW_GRALLOC := true
BOARD_USES_LEGACY_MMAP := true

# Camera
#TARGET_SAMSUNG_GRALLOC_EXTERNAL_USECASES := true
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/matisselte/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true


# Custom RIL class
BOARD_RIL_CLASS := ../../../device/samsung/matisselte/ril/

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2569011200
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 12661537792
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12562627584
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# PowerHAL
TARGET_POWERHAL_SET_INTERACTIVE_EXT := device/samsung/matisselte/power/power_ext.c
TARGET_POWERHAL_VARIANT := cm

# Recovery
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB := device/samsung/matisselte/rootdir/etc/fstab.qcom

include device/qcom/sepolicy/sepolicy.mk

#ifdef xxxfm
ifeq ($(TARGET_DEVICE),matisseltese)

BOARD_SEPOLICY_DIRS += device/samsung/matisselte/sepolicy

BOARD_SEPOLICY_UNION += \
  file_contexts \
  file.te \
  init.te \
  keystore.te \
  mediaserver.te \
  mm-pp-daemon.te \
  mm-qcamerad.te \
  mpdecision.te \
  rmt_storage.te \
  system_app.te \
  system_server.te \
  tee.te \
  thermal-engine.te \
  time_daemon.te \
  ueventd.te \
  vold.te \
  wcnss-service.te \

endif

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
