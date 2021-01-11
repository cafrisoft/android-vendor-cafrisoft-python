LOCAL_PATH := $(call my-dir)

##########################################################################################################
# libPythonModulePyGameBase
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/SDL-2.0.15-14640
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/base.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameBase
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# libPythonModulePyGameConstants
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/SDL-2.0.15-14640
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/constants.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameConstants
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

