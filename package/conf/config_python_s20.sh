#!/bin/sh

ARGCNT=$#
ARG1=$1
ARG2=$2

echo "ARGCNT=[${ARGCNT}]"
echo "ARG1=[$ARG1]"
echo "ARG1=[$ARG2]"

PYTHON_SRC="/system/etc/python"
PYTHON_COPYED_ROOT="/storage/self/primary/ANAPASS_TESYS"

S20_SYSTEM_BIN_PATH="/system/bin"
S20_SYSTEM_LIB_PATH="/system/lib64"

PYTHON_DST_PYGAME="$PYTHON_DST/lib/python3.8/site-packages/pygame"

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


# Copy system/bin
copy_exe_to_system_bin() {
    
    SearchDir="$PYTHON_COPYED_ROOT/system/bin"
    
    echo "-----------------------------------------------"
    echo "cp $SearchDir/* $S20_SYSTEM_BIN_PATH"
    echo "-----------------------------------------------"
    
    for entry in $SearchDir/*
    do
        name=$(basename $entry)
        fileName="${name%.*}"
        fileExtension="${name##*.}"

        cmd="cp $entry $S20_SYSTEM_BIN_PATH"
        echo $cmd
        $cmd

        cmd="chmod 755 $S20_SYSTEM_BIN_PATH/$fileName"
        echo $cmd
        $cmd
    done
}

# Copy system/bin
copy_exe_to_system_lib64() {

    SearchDir="$PYTHON_COPYED_ROOT/system/lib64"

    echo "-----------------------------------------------"
    echo "cp $SearchDir/*.so $S20_SYSTEM_LIB_PATH"
    echo "-----------------------------------------------"
    
    for entry in $SearchDir/*
    do
        name=$(basename $entry)
        fileName="${name%.*}"
        fileExtension="${name##*.}"

        cmd="cp $entry $S20_SYSTEM_LIB_PATH"
        echo $cmd
        $cmd
        
    done
}

copy_python_to_data() {

    PYTHON_DST="/data/python"
    PYTHON_SRC="$PYTHON_COPYED_ROOT/system/etc/python"
    PYTHON_DST_LIBDYNLOAD="$PYTHON_DST/lib/lib-dynload"

    cmd="mkdir -p $PYTHON_DST"
    echo $cmd
    $cmd
    
    cmd="mkdir -p $PYTHON_DST_LIBDYNLOAD"
    echo $cmd
    $cmd

    cmd="cp -r $PYTHON_SRC $PYTHON_DST/"
    echo $cmd
    $cmd
    
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


}

ted_python_link() {

    SearchDir="/data/python/lib/python3.8/site-packages/Anapass/Example/Android"
    for entry in $SearchDir/*
    do
	    name=$(basename $entry)
	    fileName="${name%.*}"
        fileExtension="${name##*.}"

	    #echo "[$entry] [$name] [$fileName] [$fileExtension] "

	    if [ "$fileExtension" == "py" ]; then
		    echo "Python File :  [$entry] [$name] [$fileName] [$fileExtension] "

		    echo "python $entry \$@" > /system/bin/ted.$fileName
		    chmod 777 /system/bin/ted.$fileName
	    fi
    done
   
}


if [ $ARGCNT -eq 0 ];then

    copy_exe_to_system_bin
    copy_exe_to_system_lib64
    copy_python_to_data

elif [  $ARG1 = "copy_bin"  ];then
    
    copy_exe_to_system_bin

elif [  $ARG1 = "copy_lib"  ];then
    
    copy_exe_to_system_lib64

elif [  $ARG1 = "copy_python"  ];then
    
    copy_python_to_data

elif [  $ARG1 = "py_link"  ];then
    
    ted_python_link

fi

