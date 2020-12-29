LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)/..

#LOCAL_SRC_FILES:=  my-test-build.c

LOCAL_SRC_FILES += _abc.c           _collectionsmodule.c  _functoolsmodule.c  _io/iobase.c           _math.c         _sre.c            _threadmodule.c
LOCAL_SRC_FILES += atexitmodule.c   config.c              gcmodule.c          _io/_iomodule.c        _operator.c     _stat.c           timemodule.c
LOCAL_SRC_FILES += _io/bufferedio.c     errnomodule.c         getbuildinfo.c      itertoolsmodule.c  posixmodule.c   _io/stringio.c        _tracemalloc.c
LOCAL_SRC_FILES += _io/bytesio.c        faulthandler.c        getpath.c           _localemodule.c    pwdmodule.c     symtablemodule.c  _weakref.c
LOCAL_SRC_FILES += _codecsmodule.c  _io/fileio.c              hashtable.c         main.c             signalmodule.c  _io/textio.c          xxsubtype.c

LOCAL_CFLAGS += -DPy_BUILD_CORE     


LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
#LOCAL_CFLAGS += -D__LP64__
  
LOCAL_SHARED_LIBRARIES :=    \
		libbinder            \
        libutils             \
        libcutils            \
        libui                \
		libgui  

LOCAL_MODULE:= libPythonCore
include $(BUILD_SHARED_LIBRARY)

