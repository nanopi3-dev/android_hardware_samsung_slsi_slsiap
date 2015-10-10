LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SHARED_LIBRARIES := liblog

LOCAL_C_INCLUDES += hardware/samsung_slsi/slsiap/include \
					hardware/samsung_slsi/slsiap/kernel-headers

LOCAL_SRC_FILES := nxp-v4l2.cpp nxp-v4l2-dev.cpp
LOCAL_SRC_FILES += android-nxp-v4l2.cpp

# { <!-- S5P4418 V4L2 support
ifeq ($(BOARD_CAMERA_BACK),true)
LOCAL_CFLAGS += -DUSES_CAMERA_BACK=1
endif
ifeq ($(BOARD_CAMERA_FRONT),true)
LOCAL_CFLAGS += -DUSES_CAMERA_FRONT=1
endif
ifeq ($(BOARD_USES_HDMI),true)
LOCAL_CFLAGS += -DUSES_HDMI=1
endif
ifeq ($(BOARD_USES_RESOL),true)
LOCAL_CFLAGS += -DUSES_RESOL=1
endif # End of V4L2 config --> }

LOCAL_MODULE := libv4l2-nexell
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
