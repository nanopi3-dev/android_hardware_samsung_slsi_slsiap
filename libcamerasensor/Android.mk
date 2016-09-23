ifeq ($(BOARD_HAS_CAMERA),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)

LOCAL_C_INCLUDES += \
	frameworks/native/include \
	system/media/camera/include \
	$(LOCAL_PATH)/../include

LOCAL_SRC_FILES := \
	OV5640.cpp \
	S5K4ECGX.cpp \
	S5K5CAGX.cpp \
	SP0838.cpp \
	SP0A19.cpp \
	SP2518.cpp \
	GC2035.cpp \
	GC0308.cpp \
	MT9D111.cpp \
	THP7212.cpp \
	HM2057.cpp \
	TW9900.cpp \
	TW9992.cpp

ifeq ($(TARGET_CPU_VARIANT2),s5p4418)
LOCAL_CFLAGS += -DS5P4418
endif

ANDROID_VERSION_STR := $(subst ., ,$(PLATFORM_VERSION))
ANDROID_VERSION_MAJOR := $(firstword $(ANDROID_VERSION_STR))
ifeq "6" "$(ANDROID_VERSION_MAJOR)"
#@echo This is MARSHMALLOW!!!
LOCAL_C_INCLUDES += system/core/libion/include
LOCAL_CFLAGS += -DLOLLIPOP
endif

ifeq "5" "$(ANDROID_VERSION_MAJOR)"
#@echo This is LOLLIPOP!!!
LOCAL_C_INCLUDES += system/core/libion/include
LOCAL_CFLAGS += -DLOLLIPOP
endif

LOCAL_SHARED_LIBRARIES := liblog libv4l2-nexell

LOCAL_MODULE := libcamerasensor
LOCAL_MODULE_TAGS := optional

include $(BUILD_STATIC_LIBRARY)

endif
