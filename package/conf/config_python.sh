
PYTHON_DST="/python"
PYTHON_SRC="/system/etc/python"

#################################################################################################
#
#  make directory structure for Python
#  /python/bin
#  /python/lib
#  /python/lib/lib-dynload
#
################################################################################################
#mkdir -p /python/bin
cmd="mkdir -p $PYTHON_DST/bin"
echo $cmd
$cmd
chmod 777 $PYTHON_DST/bin

#mkdir -p /python/lib
cmd="mkdir -p $PYTHON_DST/lib"
echo $cmd
$cmd
chmod 777 $PYTHON_DST/lib

#mkdir -p /python/lib/lib-dynload
cmd="mkdir -p $PYTHON_DST/lib/lib-dynload"
echo $cmd
$cmd
chmod 777 $PYTHON_DST/lib/lib-dynload


#################################################################################################
#
#  soft link  python bin and lib
#       /python/bin/py   => /system/bin/python
#       /python/lib/python3.8  =>  /system/etc/python/lib/python3.8
#
#    >>> import sys
#    >>> sys.path
#       ['', '/python/lib/python38.zip', '/python/lib/python3.8', '/python/lib/lib-dynload', '/python/lib/python3.8/site-packages']
#
################################################################################################

#Link Python Package
#ln -s /system/etc/python/lib/python3.8 /python/lib/python3.8
cmd="ln -s $PYTHON_SRC/lib/python3.8 $PYTHON_DST/lib/python3.8"
echo $cmd
$cmd 

#link python 
cmd="ln -s /system/bin/python $PYTHON_DST/bin/py"
echo $cmd
$cmd 


#################################################################################################
#
#   soft link  python module shared lib 
#
################################################################################################

#ln -s /system/lib64/libPythonModuleStruct.so /python/lib/lib-dynload/_struct.so
cmd="ln -s /system/lib64/libPythonModuleStruct.so $PYTHON_DST/lib/lib-dynload/_struct.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleTED.so /python/lib/lib-dynload/_ted.so
cmd="ln -s /system/lib64/libPythonModuleTED.so $PYTHON_DST/lib/lib-dynload/_ted.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSocket.so /python/lib/lib-dynload/_socket.so
cmd="ln -s /system/lib64/libPythonModuleSocket.so $PYTHON_DST/lib/lib-dynload/_socket.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleMath.so /python/lib/lib-dynload/math.so
cmd="ln -s /system/lib64/libPythonModuleMath.so $PYTHON_DST/lib/lib-dynload/math.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSelect.so /python/lib/lib-dynload/select.so
cmd="ln -s /system/lib64/libPythonModuleSelect.so $PYTHON_DST/lib/lib-dynload/select.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleUnicodeData.so /python/lib/lib-dynload/select.so
cmd="ln -s /system/lib64/libPythonModuleUnicodeData.so $PYTHON_DST/lib/lib-dynload/unicodedata.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModulePosixSubProcess.so /python/lib/lib-dynload/_posixsubprocess.so
cmd="ln -s /system/lib64/libPythonModulePosixSubProcess.so $PYTHON_DST/lib/lib-dynload/_posixsubprocess.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSha1.so /python/lib/lib-dynload/_sha1.so
cmd="ln -s /system/lib64/libPythonModuleSha1.so $PYTHON_DST/lib/lib-dynload/_sha1.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSha256.so /python/lib/lib-dynload/_sha256.so
cmd="ln -s /system/lib64/libPythonModuleSha256.so $PYTHON_DST/lib/lib-dynload/_sha256.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleSha512.so /python/lib/lib-dynload/_sha512.so
cmd="ln -s /system/lib64/libPythonModuleSha512.so $PYTHON_DST/lib/lib-dynload/_sha512.so"
echo $cmd
$cmd 

#ln -s /system/lib64/libPythonModuleRandom.so /python/lib/lib-dynload/_random.so
cmd="ln -s /system/lib64/libPythonModuleRandom.so $PYTHON_DST/lib/lib-dynload/_random.so"
echo $cmd
$cmd 


#################################################################################################
#
#   soft link  /python/ted   /python/testcase
#
################################################################################################

#Link Python Package
#ln -s /system/etc/python/lib/python3.8 /python/ted
cmd="ln -s $PYTHON_SRC/lib/python3.8/site-packages/Anapass/Example/Android  $PYTHON_DST/ted"
echo $cmd
$cmd 
chmod 777 $PYTHON_DST/ted

#Link Python Package
#ln -s /system/etc/python/lib/python3.8/site-packages/TEDApp/TESys/TestCase  /python/testcase
cmd="ln -s $PYTHON_SRC/lib/python3.8/site-packages/TEDApp/TESys/TestCase  $PYTHON_DST/testcase"
echo $cmd
$cmd 
chmod 777 $PYTHON_DST/testcase


#################################################################################################
#
#   generate TED Command  on /python/bin/ 
#      ex)  /python/bin/ted.wreg   /python/bin/ted.rreg
#
################################################################################################

SearchDir=/python/ted
for entry in $SearchDir/*
do
	name=$(basename $entry)
	fileName="${name%.*}"
    fileExtension="${name##*.}"

	#echo "[$entry] [$name] [$fileName] [$fileExtension] "

	if [ "$fileExtension" == "py" ]; then
		echo "Python File :  [$entry] [$name] [$fileName] [$fileExtension] "

		echo "py $entry \$@" > /python/bin/ted.$fileName
		chmod 777 /python/bin/ted.$fileName
	fi

	

done




