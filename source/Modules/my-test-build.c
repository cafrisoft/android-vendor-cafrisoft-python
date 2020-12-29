#include <stdio.h>
#include <sys/limits.h>
//#include "Python.h"

int main11(int argc, char* argv[]) {

    printf("py app\n");
    printf("sizeof(long) %d \n", sizeof(long));

#ifdef LONG_BIT
    //#define LONG_BIT (8 * SIZEOF_LONG)
#if (LONG_BIT==32)
#error "LONG_BIT(32) SIZEOF_LONG(8)"
#elif (LONG_BIT==64)
#error "LONG_BIT(64) SIZEOF_LONG(8)"
#endif

#else

#error "LONG_BIT is not defined"

#endif

#ifdef __LP64__
    //#error "__LP64__ is defined"
#endif
    return 0;
}
