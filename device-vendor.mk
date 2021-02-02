
LOCAL_PATH:=vendor/cafrisoft/python

#python package copy
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/package,system/etc/python)
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/system/etc/profile:system/etc/profile

#python binary, core
PRODUCT_PACKAGES += \
       python libPythonCore

#python module
PRODUCT_PACKAGES += \
        libPythonModuleMath \
        libPythonModulePosixSubProcess \
        libPythonModuleSelect \
        libPythonModuleSocket \
        libPythonModuleStruct \
        libPythonModuleTED \
        libPythonModuleUnicodeData \
        libPythonModuleSha1  libPythonModuleSha256 libPythonModuleSha512 libPythonModuleRandom


#pygamen module
PRODUCT_PACKAGES += \
libPythonModulePyGameBase \
libPythonModulePyGameConstants \
libPythonModulePyGameRect \
libPythonModulePyGameRWObject \
libPythonModulePyGameSurflock \
libPythonModulePyGameColor \
libPythonModulePyGameBufferProxy \
libPythonModulePyGameMath \
libPythonModulePyGameDisplay \
libPythonModulePyGameDraw \
libPythonModulePyGameImage \
libPythonModulePyGameJoyStick \
libPythonModulePyGameKey \
libPythonModulePyGameMouse \
libPythonModulePyGameSurface \
libPythonModulePyGameEvent \
libPythonModulePyGameTime \
libPythonModulePyGamePixelCopy \
libPythonModulePyGameTransform \
libPythonModulePyGameFont \





