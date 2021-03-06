#
# Copyright (C) 2015-2016 The CyanogenMod Project
#           (C) 2017-2018 The LineageOS Project
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
#

# inherit from common msm8956-common
-include device/xiaomi/msm8956-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/kenzo

# Assertions
TARGET_OTA_ASSERT_DEVICE := kate,kenzo

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26838785024 # 26838801408 - 16384

# Kernel
TARGET_KERNEL_CONFIG := lineageos_kenzo_defconfig

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Sepolicy
#BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy-minimal

# Security patch level
VENDOR_SECURITY_PATCH := 2018-07-01

#--------ut--------------------------

# To enable system image
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Extra foldes
BOARD_ROOT_EXTRA_FOLDERS := \
    /firmware \
    /dsp \
    /cust \
    /metadata \
    /factory \
    /persist
    
#kernel
BOARD_KERNEL_CMDLINE += console=tty0


#-----------------------------------

#treble
#BOARD_VNDK_RUNTIME_DISABLE := true
#BOARD_VNDK_VERSION := current

#PRODUCT_FULL_TREBLE_OVERRIDE := true
#PRODUCT_SHIPPING_API_LEVEL := 22
#PRODUCT_VENDOR_MOVE_ENABLED := true
#TARGET_COPY_OUT_VENDOR := vendor

# inherit from the proprietary version
-include vendor/xiaomi/kenzo/BoardConfigVendor.mk
