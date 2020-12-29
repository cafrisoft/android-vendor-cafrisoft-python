LOCAL_PATH := $(call my-dir)

##########################################################################################################
# libPythonCore
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)

#LOCAL_SRC_FILES:=  my-test-build.c


MODULES_SRC_FILES += Modules/_abc.c           Modules/_collectionsmodule.c  Modules/_functoolsmodule.c  Modules/_io/iobase.c           Modules/_math.c         Modules/_sre.c            Modules/_threadmodule.c
MODULES_SRC_FILES += Modules/atexitmodule.c   Modules/config.c              Modules/gcmodule.c          Modules/_io/_iomodule.c        Modules/_operator.c     Modules/_stat.c           Modules/timemodule.c
MODULES_SRC_FILES += Modules/_io/bufferedio.c     Modules/errnomodule.c         Modules/getbuildinfo.c      Modules/itertoolsmodule.c  Modules/posixmodule.c   Modules/_io/stringio.c        Modules/_tracemalloc.c
MODULES_SRC_FILES += Modules/_io/bytesio.c        Modules/faulthandler.c        Modules/getpath.c           Modules/_localemodule.c    Modules/pwdmodule.c     Modules/symtablemodule.c  Modules/_weakref.c
MODULES_SRC_FILES += Modules/_codecsmodule.c  Modules/_io/fileio.c              Modules/hashtable.c         Modules/main.c             Modules/signalmodule.c  Modules/_io/textio.c          Modules/xxsubtype.c
MODULES_SRC_FILES += Modules/_struct.c


OBJECTS_SRC_FILES += Objects/abstract.c         Objects/classobject.c    Objects/frameobject.c          Objects/moduleobject.c     Objects/structseq.c
OBJECTS_SRC_FILES += Objects/accu.c             Objects/codeobject.c     Objects/funcobject.c           Objects/namespaceobject.c  Objects/tupleobject.c
OBJECTS_SRC_FILES += Objects/boolobject.c       Objects/complexobject.c  Objects/genobject.c            Objects/object.c           Objects/typeobject.c
OBJECTS_SRC_FILES += Objects/bytearrayobject.c  Objects/descrobject.c    Objects/interpreteridobject.c  Objects/obmalloc.c         Objects/unicodectype.c
OBJECTS_SRC_FILES += Objects/bytes_methods.c    Objects/dictobject.c     Objects/iterobject.c           Objects/odictobject.c      Objects/unicodeobject.c
OBJECTS_SRC_FILES += Objects/bytesobject.c      Objects/enumobject.c     Objects/listobject.c           Objects/picklebufobject.c  Objects/weakrefobject.c
OBJECTS_SRC_FILES += Objects/call.c             Objects/exceptions.c     Objects/longobject.c           Objects/rangeobject.c
OBJECTS_SRC_FILES += Objects/capsule.c          Objects/fileobject.c     Objects/memoryobject.c         Objects/setobject.c
OBJECTS_SRC_FILES += Objects/cellobject.c       Objects/floatobject.c    Objects/methodobject.c         Objects/sliceobject.c

PYTHON_SRC_FILES += Python/asdl.c            Python/dtoa.c                 Python/getcompiler.c   Python/marshal.c     Python/pyhash.c       Python/structmember.c
PYTHON_SRC_FILES += Python/ast.c             Python/dynamic_annotations.c  Python/getcopyright.c  Python/modsupport.c  Python/pylifecycle.c  Python/symtable.c
PYTHON_SRC_FILES += Python/ast_opt.c         Python/dynload_shlib.c        Python/getopt.c        Python/mysnprintf.c  Python/pymath.c       Python/sysmodule.c
PYTHON_SRC_FILES += Python/ast_unparse.c     Python/errors.c               Python/getplatform.c   Python/mystrtoul.c   Python/pystate.c      Python/thread.c
PYTHON_SRC_FILES += Python/bltinmodule.c     Python/fileutils.c            Python/getversion.c    Python/pathconfig.c  Python/pystrcmp.c     Python/traceback.c
PYTHON_SRC_FILES += Python/bootstrap_hash.c  Python/formatter_unicode.c    Python/graminit.c      Python/peephole.c    Python/pystrhex.c     Python/_warnings.c
PYTHON_SRC_FILES += Python/ceval.c           Python/frozenmain.c           Python/hamt.c          Python/preconfig.c   Python/pystrtod.c
PYTHON_SRC_FILES += Python/codecs.c          Python/frozen.c               Python/importdl.c      Python/pyarena.c     Python/Python-ast.c
PYTHON_SRC_FILES += Python/compile.c         Python/future.c               Python/import.c        Python/pyctype.c     Python/pythonrun.c
PYTHON_SRC_FILES += Python/context.c         Python/getargs.c              Python/initconfig.c    Python/pyfpe.c       Python/pytime.c


PARSER_SRC_FILES += Parser/acceler.c   Parser/listnode.c    Parser/node.c    Parser/parsetok.c   Parser/token.c
PARSER_SRC_FILES += Parser/grammar1.c  Parser/myreadline.c  Parser/parser.c  Parser/tokenizer.c

LOCAL_SRC_FILES += $(MODULES_SRC_FILES) $(OBJECTS_SRC_FILES) $(PYTHON_SRC_FILES) $(PARSER_SRC_FILES)

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     


LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers  
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
#LOCAL_CFLAGS += -D__LP64__
        

LOCAL_SHARED_LIBRARIES := \
        libbinder \
        libcutils \
        libdl \
        libexpat \
        libgui \
        libicui18n \
        libicuuc \
        liblog \
        libmedia \
        libmediautils \
        libnetd_client \
        libssl \
        libsync \
        libui \
        libutils \
        libz 
        

LOCAL_MODULE:= libPythonCore
include $(BUILD_SHARED_LIBRARY)



##########################################################################################################
# libPythonModuleStruct
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)

LOCAL_SRC_FILES += Modules/_struct.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     

LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
#LOCAL_CFLAGS += -D__LP64__
        
LOCAL_SHARED_LIBRARIES := \
        libbinder \
        libcutils \
        libdl \
        libexpat \
        libgui \
        libicui18n \
        libicuuc \
        liblog \
        libmedia \
        libmediautils \
        libnetd_client \
        libssl \
        libsync \
        libui \
        libutils \
        libz \
        libPythonCore
       

LOCAL_MODULE:= libPythonModuleStruct
include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# Module Build "_socket"  libPythonModuleSocket
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)
TESYS_INC_TOP :=vendor/samsung_slsi/exynos8895/anapass/test-system-app

LOCAL_SRC_FILES += Modules/socketmodule.c 

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     

LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal   $(TESYS_INC_TOP)

LOCAL_SHARED_LIBRARIES := libcutils libdl libgui liblog libui libutils  libz \
        libPythonCore 

LOCAL_MODULE:= libPythonModuleSocket
include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# Module Build "math"  libPythonModuleMath
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)
TESYS_INC_TOP :=vendor/samsung_slsi/exynos8895/anapass/test-system-app

LOCAL_SRC_FILES += Modules/mathmodule.c 

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     

LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal   $(TESYS_INC_TOP)

LOCAL_SHARED_LIBRARIES := libcutils libdl libgui liblog libui libutils  libz \
        libPythonCore 

LOCAL_MODULE:= libPythonModuleMath
include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# Module Build "select"  libPythonModuleSelect
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)
TESYS_INC_TOP :=vendor/samsung_slsi/exynos8895/anapass/test-system-app

LOCAL_SRC_FILES += Modules/selectmodule.c 

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     

LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal   $(TESYS_INC_TOP)

LOCAL_SHARED_LIBRARIES := libcutils libdl libgui liblog libui libutils  libz \
        libPythonCore 

LOCAL_MODULE:= libPythonModuleSelect
include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# Module Build "unicodedata"  libPythonModuleUnicodeData
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)
TESYS_INC_TOP :=vendor/samsung_slsi/exynos8895/anapass/test-system-app

LOCAL_SRC_FILES += Modules/unicodedata.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     

LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal   $(TESYS_INC_TOP)

LOCAL_SHARED_LIBRARIES := libcutils libdl libgui liblog libui libutils  libz \
        libPythonCore 

LOCAL_MODULE:= libPythonModuleUnicodeData
include $(BUILD_SHARED_LIBRARY)

##########################################################################################################
# Module Build "_posixsubprocess"  libPythonModulePosixSubProcess
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)
TESYS_INC_TOP :=vendor/samsung_slsi/exynos8895/anapass/test-system-app

LOCAL_SRC_FILES += Modules/_posixsubprocess.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE     

LOCAL_CFLAGS += -Wno-error=date-time -Wno-error=int-conversion
LOCAL_CFLAGS += -Wno-unused-parameter  -Wno-missing-field-initializers
LOCAL_CFLAGS += -Wno-unused-function  -Wno-sign-compare  -Wno-shift-count-overflow   # 2020-12-26 newly add CFlag on Android9
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal   $(TESYS_INC_TOP)

LOCAL_SHARED_LIBRARIES := libcutils libdl libgui liblog libui libutils  libz \
        libPythonCore 

LOCAL_MODULE:= libPythonModulePosixSubProcess
include $(BUILD_SHARED_LIBRARY)


##########################################################################################################
# App 
##########################################################################################################

include $(CLEAR_VARS)

PYTHON_TOP := $(LOCAL_PATH)

LOCAL_SRC_FILES:=  Programs/python.c

LOCAL_CFLAGS += -DANDROID
LOCAL_CFLAGS += -DPy_BUILD_CORE
LOCAL_C_INCLUDES:= $(PYTHON_TOP)/android $(PYTHON_TOP)/Include $(PYTHON_TOP)/Include/internal 
  
LOCAL_SHARED_LIBRARIES := \
        libbinder \
        libcutils \
        libdl \
        libexpat \
        libgui \
        libicui18n \
        libicuuc \
        liblog \
        libmedia \
        libmediautils \
        libnetd_client \
        libssl \
        libsync \
        libui \
        libutils \
        libz \
        libPythonCore

LOCAL_MODULE:= python
include $(BUILD_EXECUTABLE)
