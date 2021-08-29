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

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# call the proprietary setup
$(call inherit-product-if-exists, vendor/xiaomi/kenzo/kenzo-vendor.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_extcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_extcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9326.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/uinput-fpc.idc:system/usr/idc/uinput-fpc.idc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Atmel_maXTouch_Touchscreen.kl:system/usr/keylayout/Atmel_maXTouch_Touchscreen.kl \
    $(LOCAL_PATH)/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/msm8976-tashalite-snd-card_Button_Jack.kl:system/usr/keylayout/msm8976-tashalite-snd-card_Button_Jack.kl \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:system/usr/keylayout/uinput-fpc.kl

# Ramdisk
PRODUCT_PACKAGES += \
    init.kenzo.rc

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

#ut---------------------------------------------------------
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ubuntu/70-kenzo.rules:system/halium/etc/udev/rules.d/70-kenzo.rules \
    $(LOCAL_PATH)/ubuntu/config::system/halium/var/lib/lxc/android/config \
    $(LOCAL_PATH)/ubuntu/android.conf::system/halium/etc/ubuntu-touch-session.d/android.conf \
    $(LOCAL_PATH)/ubuntu/touch.pa:system/halium/etc/pulse/touch.pa  \
    $(LOCAL_PATH)/ubuntu/system/on-post-fs-data.rc:system/etc/init/on-post-fs-data.rc \
    $(LOCAL_PATH)/ubuntu/system/on-post-fs-data.sh:system/bin/on-post-fs-data.sh \
    $(LOCAL_PATH)/ubuntu/ril_subscription.conf:system/halium/etc/ofono/ril_subscription.conf \
    $(LOCAL_PATH)/ubuntu/wifi.conf:system/halium/etc/init/wifi.conf  
    
#missing dependenceess
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libprotobuf-cpp-lite \
    libnetutils \
    libandroid   \
    power.default \
    tls-padding  
    
PRODUCT_PACKAGES += \
    miniafservice \
    libminisf \
    android.hardware.contexthub@1.0 \
    android.hardware.media.omx@1.0-service \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth.a2dp@1.0 \
    libbluetooth-binder\
    libbluetooth \
    libbluetooth_jni\
    com.qualcomm.qti.bluetooth_audio@1.0_vendor \
    libqdma_file_agent \
    strace \
    rild  
#    android.hardware.radio@1.0  

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ubuntu/crash_dump.arm.policy:system/etc/seccomp_policy/crash_dump.arm.policy
    
    
#--------ut----------------------

# Inherit from msm8956-common
$(call inherit-product, device/xiaomi/msm8956-common/msm8956.mk)
