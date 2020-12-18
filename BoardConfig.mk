#
# Copyright (C) 2015 The Android Open Source Project
# Copyright (C) 2015 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/sw/W9

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8909
TARGET_NO_BOOTLOADER := true


# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/sw/W9
TARGET_KERNEL_CONFIG := W9_defconfig
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
#CROSS_COMPILE=/home/sm/twrp6/prebuilts/gcc/linux-x86/arm/gcc-linaro-4.9.4-2017.01-i686_arm-eabi/bin/arm-eabi-

# Platform
TARGET_BOARD_PLATFORM := msm8909
TARGET_BOARD_PLATFORM_GPU := qcom-adreno304


### Qualcomm
BOARD_USES_QCOM_HARDWARE := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        # (32Mb)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    # (32Mb)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2336227328    # (2336Mb)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4797217792  # (4797Mb)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456      # (256Mb)
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432     # (32Mb)

# File systems
#BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_SUPPRESS_EMMC_WIPE := true

### Encryption
TARGET_HW_DISK_ENCRYPTION := true
#TARGET_CRYPTFS_HW_PATH := device/qcom/common/cryptfs_hw
TW_INCLUDE_CRYPTO := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
TARGET_PROVIDES_KEYMASTER := false


# Use qcom power hal
TARGET_POWERHAL_VARIANT := qcom
TARGET_USES_CPU_BOOST_HINT := true

# Charger
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/charging_enabled
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Init of the devices boots under 1s but just in case it is hot and charging...
#TARGET_INCREASES_COLDBOOT_TIMEOUT := true

# MISC
BOARD_USES_QC_TIME_SERVICES := true

# TWRP Configuration
DEVICE_RESOLUTION := 320x320
TWRP_NEW_THEME := true
TW_CUSTOM_THEME := $(DEVICE_PATH)/twres
TW_THEME := watch_mdpi
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := ru
TW_DEFAULT_BRIGHTNESS := "70"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
LZMA_RAMDISK_TARGETS := recovery
TW_NO_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_HAS_EDL_MODE := true
TW_TARGET_USES_QCOM_BSP := false
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "GGL_PIXEL_FORMAT_RGB_565"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/twrp.fstab
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery
TW_USE_BUSYBOX := true

# SELinux
TWHAVE_SELINUX := true
#include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
	device/qcom/sepolicy/
BOARD_SEPOLICY_DIRS += \
	device/qcom/caf-sepolicy/

# Debug flags
#TWRP_INCLUDE_LOGCAT := true
#TWRP_INCLUDE_LOGD := true
#TARGET_USES_LOGD := true
#TWRP_EVENT_LOGGING := true
