#
# Copyright (C) 2011 The Android Open-Source Project
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

SLSIAP_PATH := hardware/samsung_slsi/slsiap

# hw composer HAL
PRODUCT_PACKAGES += \
	hwcomposer.slsiap

# gralloc HAL
PRODUCT_PACKAGES += \
	gralloc.slsiap

# audio HAL
PRODUCT_PACKAGES += \
	audio.primary.slsiap

# lights HAL
PRODUCT_PACKAGES += \
	lights.slsiap

# power HAL
PRODUCT_PACKAGES += \
	power.slsiap

# keystore HAL
PRODUCT_PACKAGES += \
	keystore.slsiap

# ion library
PRODUCT_PACKAGES += \
	libion-nexell

# v4l2 library
PRODUCT_PACKAGES += \
	libv4l2-nexell

# omx
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libnx_vpu \
	libNX_OMX_VIDEO_DECODER \
	libNX_OMX_VIDEO_ENCODER \
	libNX_OMX_Base \
	libNX_OMX_Core \
	libNX_OMX_Common

# stagefright FFMPEG compnents
ifeq ($(EN_FFMPEG_AUDIO_DEC),true)
PRODUCT_PACKAGES += libNX_OMX_AUDIO_DECODER_FFMPEG
endif

ifeq ($(EN_FFMPEG_EXTRACTOR),true)
PRODUCT_PACKAGES += libNX_FFMpegExtractor

PRODUCT_COPY_FILES += \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libavcodec-2.1.4.so:system/lib/libavcodec-2.1.4.so \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libavdevice-2.1.4.so:system/lib/libavdevice-2.1.4.so \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libavfilter-2.1.4.so:system/lib/libavfilter-2.1.4.so \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libavformat-2.1.4.so:system/lib/libavformat-2.1.4.so \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libavresample-2.1.4.so:system/lib/libavresample-2.1.4.so \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libavutil-2.1.4.so:system/lib/libavutil-2.1.4.so \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libswresample-2.1.4.so:system/lib/libswresample-2.1.4.so \
	$(SLSIAP_PATH)/omx/codec/ffmpeg/libs/libswscale-2.1.4.so:system/lib/libswscale-2.1.4.so
endif

# haptic HAL
ifeq ($(BOARD_HAS_HAPTIC),true)
PRODUCT_PACKAGES += \
	libhapticapi \
	libhapticjavaapi
endif

PRODUCT_VENDOR_KERNEL_HEADERS := $(SLSIAP_PATH)/kernel-headers
