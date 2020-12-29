/* Minimal main program -- everything is loaded from the library */

#include "Python.h"
#include "pycore_pylifecycle.h"


#include <pwd.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <paths.h>
#include <private/android_filesystem_config.h>

static int set_su(void) {

    // The default user is root.
    uid_t uid = 0;
    gid_t gid = 0;

    uid_t current_uid = getuid();
    if (current_uid == AID_ROOT) {
        //printf("already root!!\n");
        return 0;
    }

    if (current_uid != AID_ROOT && current_uid != AID_SHELL && current_uid != AID_SYSTEM) {
        printf("already root!!\n");
        return -1;
    }

    if (setgid(gid)) {
        //error(1, errno, "setgid failed");
        printf("setgid failed!!\n");
        return -1;
    }

    if (setuid(uid)) {
        //error(1, errno, "setuid failed");
        printf("setuid failed!!\n");
        return -1;
    }

    // Reset parts of the environment.
    setenv("PATH", _PATH_DEFPATH, 1);
    unsetenv("IFS");
    struct passwd* pw = getpwuid(uid);
    if (pw) {
        setenv("LOGNAME", pw->pw_name, 1);
        setenv("USER", pw->pw_name, 1);
    }
    else {
        unsetenv("LOGNAME");
        unsetenv("USER");
    }

    return 0;
}


#ifdef MS_WINDOWS
int
wmain(int argc, wchar_t **argv)
{
    return Py_Main(argc, argv);
}
#else
int
main(int argc, char **argv)
{
//#ifdef ANDROID
  //  fprintf(stderr, "hthwang python start..........\n");
//#endif

    set_su();

    return Py_BytesMain(argc, argv);
}
#endif
