LOCAL_PATH := $(call my-dir)

##########################################################################################################
# libPythonModulePyGameBase
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/base.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP
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

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/constants.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
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


##########################################################################################################
# libPythonModulePyGameRect
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/rect.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameRect
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# libPythonModulePyGameRWObject
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/rwobject.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameRWObject
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameSurflock
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/surflock.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameSurflock
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# libPythonModulePyGameColor
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/color.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameColor
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameBufferProxy
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/bufferproxy.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameBufferProxy
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameMath
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/math.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameMath
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameDisplay display.c
##########################################################################################################
include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/display.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := liblog libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameDisplay
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# libPythonModulePyGameDraw draw.c
##########################################################################################################
include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/draw.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameDraw
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameImage image.c
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/image.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameImage
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameJoyStick joystick.c
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/joystick.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameJoyStick
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameKey key.c
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/key.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameKey
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameMouse mouse.c
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/mouse.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameMouse
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# libPythonModulePyGameSurface
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/surface.c \
   src_c/alphablit.c \
   src_c/surface_fill.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameSurface
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameEvent
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/event.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameEvent
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameTime
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/time.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameTime
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# libPythonModulePyGamePixelCopy
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/pixelcopy.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGamePixelCopy
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameTransform
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/transform.c  src_c/scale2x.c src_c/rotozoom.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2

LOCAL_MODULE:= libPythonModulePyGameTransform
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameFont
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/font.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 
LOCAL_C_INCLUDES += $(SDL_TOP)/../sdl2_ttf

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2 libSDL2_ttf

LOCAL_MODULE:= libPythonModulePyGameFont
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# libPythonModulePyGameMask
##########################################################################################################

include $(CLEAR_VARS)

SDL_TOP := $(TOP)/vendor/cafrisoft/sdl/source
PYTHON_TOP := $(LOCAL_PATH)/../source

LOCAL_SRC_FILES := src_c/mask.c src_c/bitmask.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DANDROID_CAFRISOFT_AOSP 
LOCAL_CFLAGS += -DPy_BUILD_CORE     
LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9

LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
LOCAL_C_INCLUDES += $(SDL_TOP)/include 
LOCAL_C_INCLUDES += $(SDL_TOP)/../sdl2_ttf

#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := libPythonCore libSDL2 libSDL2_ttf

LOCAL_MODULE:= libPythonModulePyGameMask
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

