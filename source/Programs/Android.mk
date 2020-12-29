LOCAL_PATH := $(call my-dir)

##########################################################################################################
# app : gct_ltesetup
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)/..

LOCAL_SRC_FILES:=  python.c
      
#LOCAL_C_INCLUDES += $(LIBS_TOP)/standalone/lte/lib/Sdk7243/ \
#                    $(LIBS_TOP)/standalone/lte/lib/Sdk \#
#LOCAL_CFLAGS += -Wno-error=unused-parameter  -Wno-error=sign-compare
#LOCAL_CFLAGS += -DWITHOUT_IFADDRS -Wno-sign-compare
#LOCAL_CFLAGS += -Wno-error=date-time

LOCAL_CFLAGS += -DPy_BUILD_CORE
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
  
LOCAL_SHARED_LIBRARIES :=    \
		libbinder            \
        libutils             \
        libcutils            \
        libui                \
		libgui  

LOCAL_MODULE:= mypy
include $(BUILD_EXECUTABLE)

