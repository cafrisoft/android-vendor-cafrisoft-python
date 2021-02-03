
adb="adb"

binpath="system/bin"
libpath="system/lib64"
python_conf_path="system/etc/python/conf"
python_package_path="system/etc/python/lib/python3.8"
python_site_package_path=$python_package_path/"site-packages"
python_module_path=$python_package_path"/lib-dynload"

host_OUTT="OUTT"
host_python_lib_path="vendor/cafrisoft/python/package/lib/python3.8"
host_python_conf_path="vendor/cafrisoft/python/package/conf"

echo "------------------------------------------------------------------"
echo "copy binary"
echo "------------------------------------------------------------------"
tesys_bin=("python" )
echo "tesys_bin = ${tesys_bin[@]}"
echo tesys_bin count : ${#tesys_bin[@]}
for (( i = 0 ; i < ${#tesys_bin[@]} ; i++ )) ; do
        cmd="$adb $1 $2 push $host_OUTT/$binpath/${tesys_bin[$i]} /$binpath"
        echo $cmd
        $cmd
done
echo ""

echo "------------------------------------------------------------------"
echo "copy *.so"
echo "------------------------------------------------------------------"
tesys_modules=("libPythonCore.so" )
echo "tesys_modules = ${tesys_modules[@]}"
echo tesys_modules count : ${#tesys_modules[@]}
for (( i = 0 ; i < ${#tesys_modules[@]} ; i++ )) ; do
        cmd="$adb $1 $2 push $host_OUTT/$libpath/${tesys_modules[$i]} /$libpath"
        echo $cmd
        $cmd
done
echo ""


echo "------------------------------------------------------------------"
echo "copy Python Module "
echo "------------------------------------------------------------------"
for python_module in $host_OUTT/$libpath/libPythonModule*
do
        #echo# "python_modules = ${python_modules[@]}"
        cmd="$adb $1 $2 push $python_module /$libpath"
        echo $cmd
        $cmd
done



echo "------------------------------------------------------------------"
echo "copy *.py"
echo "------------------------------------------------------------------"
cmd="$adb $1 $2 push $host_python_lib_path/ted.py  /$python_package_path"
echo $cmd
#$cmd

cmd="$adb $1 $2 push $host_python_lib_path/site-packages/Anapass  /$python_package_path/site-packages"
echo $cmd
#$cmd

echo ""

echo "------------------------------------------------------------------"
echo "copy *.sh"
echo "------------------------------------------------------------------"

#cmd="dos2unix $host_python_conf_path/config_python.sh"
#echo $cmd
#$cmd

cmd="$adb $1 $2 push $host_python_conf_path/config_python.sh  /$python_conf_path/config_python.sh"
echo $cmd
$cmd

echo ""