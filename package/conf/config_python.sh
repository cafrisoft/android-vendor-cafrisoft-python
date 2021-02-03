
PYTHON_DST="/data/python"
PYTHON_SRC="/system/etc/python"

PYTHON_DST_PYGAME="$PYTHON_DST/lib/python3.8/site-packages/pygame"
PYTHON_DST_LIBDYNLOAD="$PYTHON_DST/lib/lib-dynload"

#################################################################################################
#
#  soft link  python bin and lib
#       /python/bin/py   => /system/bin/python
#       /python/lib/python3.8  =>  /system/etc/python/lib/python3.8
#
#    >>> import sys
#    >>> sys.path
#       ['', '/data/python/lib/python38.zip', '/data/python/lib/python3.8', '/data/python/lib/lib-dynload', '/data/python/lib/python3.8/site-packages']
#
################################################################################################

cmd="mkdir -p $PYTHON_DST/lib"
echo $cmd
$cmd

#Link Python Package
#ln -s /system/etc/python/lib/python3.8 /python/lib/python3.8
cmd="cp $PYTHON_SRC/lib/python3.8 $PYTHON_DST/lib/ -r"
echo $cmd
$cmd 

cmd="mkdir -p $PYTHON_DST_PYGAME"
echo $cmd
$cmd

cmd="mkdir -p $PYTHON_DST_LIBDYNLOAD"
echo $cmd
$cmd

#################################################################################################
#
#   soft link  python module shared lib 
#
################################################################################################

#ln -s /system/lib64/libPythonModuleStruct.so /python/lib/lib-dynload/_struct.so
cmd="ln -s /system/lib64/libPythonModuleStruct.so $PYTHON_DST_LIBDYNLOAD/_struct.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleTED.so /python/lib/lib-dynload/_ted.so
cmd="ln -s /system/lib64/libPythonModuleTED.so $PYTHON_DST_LIBDYNLOAD/_ted.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSocket.so /python/lib/lib-dynload/_socket.so
cmd="ln -s /system/lib64/libPythonModuleSocket.so $PYTHON_DST_LIBDYNLOAD/_socket.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleMath.so /python/lib/lib-dynload/math.so
cmd="ln -s /system/lib64/libPythonModuleMath.so $PYTHON_DST_LIBDYNLOAD/math.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSelect.so /python/lib/lib-dynload/select.so
cmd="ln -s /system/lib64/libPythonModuleSelect.so $PYTHON_DST_LIBDYNLOAD/select.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleUnicodeData.so /python/lib/lib-dynload/select.so
cmd="ln -s /system/lib64/libPythonModuleUnicodeData.so $PYTHON_DST_LIBDYNLOAD/unicodedata.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModulePosixSubProcess.so /python/lib/lib-dynload/_posixsubprocess.so
cmd="ln -s /system/lib64/libPythonModulePosixSubProcess.so $PYTHON_DST_LIBDYNLOAD/_posixsubprocess.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSha1.so /python/lib/lib-dynload/_sha1.so
cmd="ln -s /system/lib64/libPythonModuleSha1.so $PYTHON_DST_LIBDYNLOAD/_sha1.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSha256.so /python/lib/lib-dynload/_sha256.so
cmd="ln -s /system/lib64/libPythonModuleSha256.so $PYTHON_DST_LIBDYNLOAD/_sha256.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSha512.so /python/lib/lib-dynload/_sha512.so
cmd="ln -s /system/lib64/libPythonModuleSha512.so $PYTHON_DST_LIBDYNLOAD/_sha512.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleRandom.so /python/lib/lib-dynload/_random.so
cmd="ln -s /system/lib64/libPythonModuleRandom.so $PYTHON_DST_LIBDYNLOAD/_random.so"
echo $cmd
$cmd 

#################################################################################################
#
#   soft link  pygame module
#
################################################################################################

cmd="ln -s /system/lib64/libPythonModulePyGameBase.so $PYTHON_DST_PYGAME/base.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameDisplay.so $PYTHON_DST_PYGAME/display.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameJoyStick.so $PYTHON_DST_PYGAME/joystick.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameRWObject.so $PYTHON_DST_PYGAME/rwobject.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameBufferProxy.so $PYTHON_DST_PYGAME/bufferproxy.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameDraw.so $PYTHON_DST_PYGAME/draw.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameKey.so $PYTHON_DST_PYGAME/key.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameRect.so $PYTHON_DST_PYGAME/rect.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameColor.so $PYTHON_DST_PYGAME/color.so"
echo $cmd
$cmd 
          
cmd="ln -s /system/lib64/libPythonModulePyGameEvent.so $PYTHON_DST_PYGAME/event.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameMath.so $PYTHON_DST_PYGAME/math.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameSurface.so $PYTHON_DST_PYGAME/surface.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameConstants.so $PYTHON_DST_PYGAME/constants.so"
echo $cmd
$cmd 
           
cmd="ln -s /system/lib64/libPythonModulePyGameImage.so $PYTHON_DST_PYGAME/image.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameMouse.so $PYTHON_DST_PYGAME/mouse.so"
echo $cmd
$cmd 

cmd="ln -s /system/lib64/libPythonModulePyGameSurflock.so $PYTHON_DST_PYGAME/surflock.so"
echo $cmd
$cmd 
               
          

#################################################################################################
#
#   generate TED Command  on /python/bin/ 
#      ex)  /python/bin/ted.wreg   /python/bin/ted.rreg
#
################################################################################################

#SearchDir=/python/ted
#for entry in $SearchDir/*
#do
#	name=$(basename $entry)
#	fileName="${name%.*}"
#    fileExtension="${name##*.}"

	#echo "[$entry] [$name] [$fileName] [$fileExtension] "

#	if [ "$fileExtension" == "py" ]; then
#		echo "Python File :  [$entry] [$name] [$fileName] [$fileExtension] "
#
#		echo "py $entry \$@" > /python/bin/ted.$fileName
#		chmod 777 /python/bin/ted.$fileName
#	fi
#done





