
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
echo "copy PyGame Module "
echo "------------------------------------------------------------------"
for python_module in $host_OUTT/$libpath/libPythonModulePyGame*
do
        #echo# "python_modules = ${python_modules[@]}"
        cmd="$adb $1 $2 push $python_module /$libpath"
        echo $cmd
        $cmd
done

echo ""
