/* struct module -- pack values into and (out of) bytes objects */

/* New version supporting byte order, alignment and size options,
   character strings, and unsigned numbers */

#define PY_SSIZE_T_CLEAN

#include "Python.h"
#include "structmember.h"
#include <ctype.h>

#include <TED/Api.h>

#ifdef PYMYDBGMSG
#define TEDDBGMSG PYMYDBGMSG
#else
#define TEDDBGMSG
#endif

static PyObject *TedError = NULL;
/* Define various structs to figure out the alignments of types */

/* ---- Standalone functions  ---- */


/*
System 
*/
static PyObject* SysDelayMS(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    Bool bRet;
    int miliSec;
    miliSec = PyLong_AsLong(args[0]);
    bRet = TedSysDelayMS(miliSec);
    return PyLong_FromLong(bRet);
}

static PyObject* SysSetBoardID(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    Bool bRet;
    int boardID = PyLong_AsLong(args[0]);
    bRet = TedSysSetBoardID(boardID);
    return PyLong_FromLong(bRet);
}

static PyObject* SysSetTcLocalSave(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    Bool bRet;
    int boardID = PyLong_AsLong(args[0]);
    int isTcLocalSaveFlag = PyLong_AsLong(args[1]);
    bRet = TedSysSetTcLocalSave(boardID, isTcLocalSaveFlag);
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedSysNotifyPyStart(const char* pyFileName);
static PyObject* SysNotifyPyStart(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    
    Bool bRet;
    PyObject* strObject;
    char pyFileName[64];
    
    strObject = PyUnicode_AsASCIIString(args[0]);
    strncpy(pyFileName, PyBytes_AS_STRING(strObject), 64-1);
    Py_DECREF(strObject);

    bRet = TedSysNotifyPyStart(pyFileName);
    
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedSysNotifyPyStop(const char* pyFileName);
static PyObject* SysNotifyPyStop(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    PyObject* strObject;
    char pyFileName[64];

    strObject = PyUnicode_AsASCIIString(args[0]);
    strncpy(pyFileName, PyBytes_AS_STRING(strObject), 64 - 1);
    Py_DECREF(strObject);

    bRet = TedSysNotifyPyStop(pyFileName);
    return PyLong_FromLong(bRet);
}

//COMM_API int  TedSysGetDutCount()
static PyObject* SysGetDutCount(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    int dutCnt = TedSysGetDutCount();
    return PyLong_FromLong(dutCnt);
}

//COMM_API int TedSysGetDutIndexAllDeviceValue();
static PyObject* SysGetDutIndexAllDeviceValue(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    int dutCnt = TedSysGetDutIndexAllDeviceValue();
    return PyLong_FromLong(dutCnt);
}

//COMM_API long long  TedSysGetTickCount64();
static PyObject* SysGetTickCount64(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    long long tick = TedSysGetTickCount64();
    return PyLong_FromLongLong(tick);
}

//COMM_API long long  TedSysGetCurUtcTime(void);
static PyObject* SysGetCurUtcTime(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    long long t = TedSysGetCurUtcTime();
    return PyLong_FromLongLong(t);
}

//COMM_API long long  TedSysGetUtcTimeKST(int year, int month, int day, int hour, int min, int sec);
static PyObject* SysGetUtcTimeKST(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    
    int year = PyLong_AsLong(args[0]);
    int month = PyLong_AsLong(args[1]);
    int day = PyLong_AsLong(args[2]);
    int hour = PyLong_AsLong(args[3]);
    int min = PyLong_AsLong(args[4]);
    int sec = PyLong_AsLong(args[5]);

    long long t = TedSysGetUtcTimeKST(year, month, day, hour, min, sec);
    return PyLong_FromLongLong(t);
}

//COMM_API long long  TedSysGetErrFlag(void);
static PyObject* SysGetErrFlag(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    long long errFlag = TedSysGetErrFlag();
    return PyLong_FromLongLong(errFlag);
}

//COMM_API Bool  TedSysMipiLock(void);
static PyObject* SysMipiLock(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    bRet = TedSysMipiLock();
    return PyLong_FromLong(bRet);
}

//COMM_API Bool  TedSysMipiUnlock(void);
static PyObject* SysMipiUnlock(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    bRet = TedSysMipiUnlock();
    return PyLong_FromLong(bRet);
}

//COMM_API Bool  TedSysMipiIsLock();
static PyObject* SysMipiIsLock(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    bRet = TedSysMipiIsLock();
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedSysLedSetRed(int r);
static PyObject* SysLedSetRed(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int r = PyLong_AsLong(args[0]);
    bRet = TedSysLedSetRed(r);
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedSysLedSetGreen(int g);
static PyObject* SysLedSetGreen(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int g = PyLong_AsLong(args[0]);
    bRet = TedSysLedSetGreen(g);
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedSysLedSetBlue(int g);
static PyObject* SysLedSetBlue(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int b = PyLong_AsLong(args[0]);
    bRet = TedSysLedSetBlue(b);
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedSysLedSetRGB(int r, int g, int b);
static PyObject* SysLedSetRGB(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int r = PyLong_AsLong(args[0]);
    int g = PyLong_AsLong(args[1]);
    int b = PyLong_AsLong(args[2]);
    bRet = TedSysLedSetRGB(r, g, b);
    return PyLong_FromLong(bRet);
}

//COMM_API int TedSysLedGetRed();
static PyObject* SysLedGetRed(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    int value = TedSysLedGetRed();
    return PyLong_FromLong(value);
}

//COMM_API int TedSysLedGetGreen();
static PyObject* SysLedGetGreen(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    int value = TedSysLedGetGreen();
    return PyLong_FromLong(value);
}

//COMM_API int TedSysLedGetBlue();
static PyObject* SysLedGetBlue(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    int value = TedSysLedGetBlue();
    return PyLong_FromLong(value);
}
/*
Pattern
*/

//COMM_API Bool TedPatternConnect(void)
static PyObject* PatternConnect(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    Bool bRet = TedPatternConnect();
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedPatternDisconnect(void)
static PyObject* PatternDisconnect(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    Bool bRet = TedPatternDisconnect();
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedPatternIsConnect(void)
static PyObject* PatternIsConnect(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    Bool bRet = TedPatternIsConnect();
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedPatternSetCommand(const char* cmd);
static PyObject* PatternSetCommand(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    
    Bool bRet = False;
    PyObject* strObject;
    char* ptrnCmd;

    strObject = PyUnicode_AsASCIIString(args[0]);

    ptrnCmd = PyMem_Malloc(PyBytes_GET_SIZE(strObject) + 1);
    if (ptrnCmd == NULL) {
        PyErr_NoMemory();
    }
    else {
        strcpy(ptrnCmd, PyBytes_AS_STRING(strObject));
        bRet = TedPatternSetCommand(ptrnCmd);
        PyMem_Free(ptrnCmd);
    }
    Py_DECREF(strObject);

    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedPatternPaint(unsigned char r, unsigned char g, unsigned char b, unsigned char a);
static PyObject* PatternPaint(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int ir = PyLong_AsLong(args[0]);
    int ig = PyLong_AsLong(args[1]);
    int ib = PyLong_AsLong(args[2]);
    int ia = PyLong_AsLong(args[3]);


    Bool bRet = TedPatternPaint((unsigned char)ir, (unsigned char)ig, (unsigned char)ib, (unsigned char)ia);

    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedPatternUpdateScreen();
static PyObject* PatternUpdateScreen(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    Bool bRet = TedPatternUpdateScreen();
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedPatternDrawImage(const char* imgFileName);
static PyObject* PatternDrawImage(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {
    
    Bool bRet = False;
    PyObject* strObject;
    char* imgFileName;

    strObject = PyUnicode_AsASCIIString(args[0]);

    imgFileName = PyMem_Malloc(PyBytes_GET_SIZE(strObject) + 1);
    if (imgFileName == NULL) {
        PyErr_NoMemory();
    }
    else {
        strcpy(imgFileName, PyBytes_AS_STRING(strObject));
        bRet = TedPatternDrawImage(imgFileName);
        PyMem_Free(imgFileName);
    }
    Py_DECREF(strObject);

    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedPatternScreenVerify(unsigned char r, unsigned char g, unsigned char b);
static PyObject* PatternScreenVerify(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int ir = PyLong_AsLong(args[0]);
    int ig = PyLong_AsLong(args[1]);
    int ib = PyLong_AsLong(args[2]);
    

    Bool bRet = TedPatternScreenVerify((unsigned char)ir, (unsigned char)ig, (unsigned char)ib);

    return PyLong_FromLong(bRet);
}

/*
 Display DSIM
*/
//COMM_API Bool TedDD_DSIM_manual_ctrl(int dutIdx, int value) {
static PyObject* DD_DSIM_manual_ctrl(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_manual_ctrl(dutIdx, value);
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedDD_DSIM_power_ctrl(int dutIdx, int value) {
static PyObject* DD_DSIM_power_ctrl(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_power_ctrl(dutIdx, value);
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedDD_DSIM_source_cal(int dutIdx, int value) {
static PyObject* DD_DSIM_source_cal(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_source_cal(dutIdx, value);
    return PyLong_FromLong(bRet);
}




//COMM_API Bool TedDD_DSIM_sleepin(int dutIdx, int value);
static PyObject* DD_DSIM_sleepin(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_sleepin(dutIdx, value);
    return PyLong_FromLong(bRet);
}
//COMM_API Bool TedDD_DSIM_sleepout(int dutIdx, int value);
static PyObject* DD_DSIM_sleepout(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_sleepout(dutIdx, value);
    return PyLong_FromLong(bRet);
}
//COMM_API Bool TedDD_DSIM_deep_standby(int dutIdx, int value);
static PyObject* DD_DSIM_deep_standby(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_deep_standby(dutIdx, value);
    return PyLong_FromLong(bRet);
}
//COMM_API Bool TedDD_DSIM_displayon(int dutIdx, int value);
static PyObject* DD_DSIM_displayon(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_displayon(dutIdx, value);
    return PyLong_FromLong(bRet);
}
//COMM_API Bool TedDD_DSIM_reset_ctrl(int dutIdx, int value);
static PyObject* DD_DSIM_reset_ctrl(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_DSIM_reset_ctrl(dutIdx, value);
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedDD_DSIM_MipiReadReg(int dutIdx, int addr, int byteOffset, int readCount, unsigned char* buf, int bufMaxByteSize);
// 
// ted.DD_DSIM_MipiReadReg(dutIdx, regAddr, byteOffset, readCount)
//  return Type: List
static PyObject* DD_DSIM_MipiReadReg(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    PyListObject* list = NULL;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);
    int byteOffset = PyLong_AsLong(args[2]);
    int readCount = PyLong_AsLong(args[3]);
    unsigned char* readBuf = (unsigned char*)malloc(sizeof(char) * readCount);
    if (readBuf == NULL) {
        PyErr_SetString(PyExc_TypeError, "Fail to alloc internal buf");
        return NULL;
    }
    
    list = (PyListObject*)PyList_New(readCount);
    if (TedDD_DSIM_MipiReadReg(dutIdx, addr, byteOffset, readCount, readBuf, readCount) == True) {

        Py_ssize_t i;
        for (i = 0; i < readCount; i++) {
            int v = (int)readBuf[i] & 0xFF;
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(v));
        }
    }
    else {
        Py_ssize_t i;
        for (i = 0; i < readCount; i++) {
            int v = 0xFF;
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(v));
        }
    }
    free(readBuf);

    return (PyObject*)list;
}

//COMM_API unsigned char TedDD_DSIM_MipiReadReg1Byte(int dutIdx, int addr, int byteOffset);
// 
// ted.DD_DSIM_MipiReadReg1Byte(dutIdx, regAddr, byteOffset)
//  return Type: List
static PyObject* DD_DSIM_MipiReadReg1Byte(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    PyListObject* list = NULL;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);
    int byteOffset = PyLong_AsLong(args[2]);
    
    unsigned char data = TedDD_DSIM_MipiReadReg1Byte(dutIdx, addr, byteOffset);

    return PyLong_FromLong(((int)data)&0xFF);
}

//COMM_API Bool TedDD_DSIM_MipiWriteReg(int dutIdx, int addr, int byteOffset, int writeCount, unsigned char* buf);
//Python :   ted.DD_DSIM_MipiWriteReg(dutIdx, regAddr, byteOffset, regValueList)
static PyObject* DD_DSIM_MipiWriteReg(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet = False;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);
    int byteOffset = PyLong_AsLong(args[2]);
    PyListObject* regValueList = (PyListObject * )args[3];
    Py_ssize_t writeCount = PyList_Size((PyObject*)regValueList);

    unsigned char* buf = (unsigned char*)malloc(writeCount);
    if (buf) {

        int i;
        for (i = 0; i < writeCount; i++) {
            PyObject* pyObj = PyList_GetItem((PyObject*)regValueList, i);
            buf[i] = (unsigned char)PyLong_AsLong(pyObj);
        }
        bRet = TedDD_DSIM_MipiWriteReg(dutIdx, addr, byteOffset, (int)writeCount, buf);
        //TEDDBGMSG("addr=0x%x  byteOffset=%d writeCount=%d ", addr, byteOffset, writeCount);
        free(buf);
    }

    return PyBool_FromLong(bRet);
}

//COMM_API Bool TedDD_DSIM_MipiWriteReg1Byte(int dutIdx, int addr, int byteOffset, unsigned char data);
// 
// ted.DD_DSIM_MipiWriteReg1Byte(dutIdx, regAddr, byteOffset, data)
//  return Type: List
static PyObject* DD_DSIM_MipiWriteReg1Byte(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    PyListObject* list = NULL;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);
    int byteOffset = PyLong_AsLong(args[2]);
    int data = PyLong_AsLong(args[3]);

    Bool bRet = TedDD_DSIM_MipiWriteReg1Byte(dutIdx, addr, byteOffset, (unsigned char)data);

    return PyLong_FromLong(bRet);
}


//COMM_API Bool TedDD_DSIM_MipiWriteReg39(int dutIdx, int addr, int writeCount, unsigned char* buf);
//Python: Bool ted.DD_DSIM_MipiWriteReg39(dutIdx, regAddr, regValueList)
static PyObject* DD_DSIM_MipiWriteReg39(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet = False;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);
    PyListObject* valueList = (PyListObject * )args[2];
    Py_ssize_t writeCount = PyList_Size((PyObject * )valueList);

    unsigned char* buf = (unsigned char*)malloc(writeCount);
    if (buf) {
        int i;
        for (i = 0; i < writeCount; i++) {
            PyObject* pyObj = PyList_GetItem((PyObject*)valueList, i);
            buf[i] = (unsigned char)PyLong_AsLong(pyObj);
        }
        bRet = TedDD_DSIM_MipiWriteReg39(dutIdx, addr, (int)writeCount, buf);
        //TEDDBGMSG("addr=0x%x  byteOffset=%d writeCount=%d ", addr, byteOffset, writeCount);
        free(buf);
    }
    return PyBool_FromLong(bRet);
}

//COMM_API Bool TedDD_DSIM_MipiWriteReg15(int dutIdx, int addr, unsigned char value);
//Python :  Bool ted.DD_DSIM_MipiWriteReg15(dutIdx, regAddr, regValue)
static PyObject* DD_DSIM_MipiWriteReg15(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet = False;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);
    unsigned char value = (unsigned char)PyLong_AsLong(args[2]);

    bRet = TedDD_DSIM_MipiWriteReg15(dutIdx, addr, value);
    //TEDDBGMSG("addr=0x%x  byteOffset=%d writeCount=%d ", addr, byteOffset, writeCount);
    
    return PyBool_FromLong(bRet);
}

//COMM_API Bool TedDD_DSIM_MipiWriteReg05(int dutIdx, int addr);
//Python :  Bool ted.DD_DSIM_MipiWriteReg05(dutIdx, regAddr)
static PyObject* DD_DSIM_MipiWriteReg05(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet = False;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);
    
    bRet = TedDD_DSIM_MipiWriteReg05(dutIdx, addr);
    //TEDDBGMSG("addr=0x%x  byteOffset=%d writeCount=%d ", addr, byteOffset, writeCount);

    return PyBool_FromLong(bRet);
}

//COMM_API Bool TedDD_DSIM_MipiWriteReg07(int dutIdx, int addr);
//Python :  Bool ted.DD_DSIM_MipiWriteReg07(dutIdx, addr)
static PyObject* DD_DSIM_MipiWriteReg07(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet = False;
    int dutIdx = PyLong_AsLong(args[0]);
    int addr = PyLong_AsLong(args[1]);

    bRet = TedDD_DSIM_MipiWriteReg07(dutIdx, addr);
    //TEDDBGMSG("addr=0x%x  byteOffset=%d writeCount=%d ", addr, byteOffset, writeCount);

    return PyBool_FromLong(bRet);
}


/*
 Display FB
*/

//COMM_API Bool TedDD_FB_blank(int dutIdx, int value)
static PyObject* DD_FB_blank(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    Bool bRet = TedDD_FB_blank(dutIdx, value);
    return PyLong_FromLong(bRet);
}


/*
 ADC
*/
//COMM_API int TedAdcGetInvalidValue()
static PyObject* AdcGetInvalidValue(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int value = TedAdcGetInvalidValue();
    return PyLong_FromLong(value);
}


//COMM_API int TedAdcGetGroupCount(int dutIdx);
static PyObject* AdcGetGroupCount(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupCount = TedAdcGetGroupCount(dutIdx);
    return PyLong_FromLong(groupCount);
}

//COMM_API Bool TedAdcGetGroupName(int dutIdx, int groupIdx, char* szGroupName);
static PyObject* AdcGetGroupName(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    char szName[32];
    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    
    TedAdcGetGroupName(dutIdx, groupIdx, szName);

    PyObject* strObject = PyUnicode_FromString(szName);

    return strObject;
}


//COMM_API int TedAdcGetGroupIndexByName(int dutIdx, const char* groupName);
static PyObject* AdcGetGroupIndexByName(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int groupIdx;
    char szGroupName[32];
    int dutIdx= PyLong_AsLong(args[0]);
    PyObject* strObject = PyUnicode_AsASCIIString(args[1]);
        
    strcpy(szGroupName, PyBytes_AS_STRING(strObject));
    Py_DECREF(strObject);

    groupIdx = TedAdcGetGroupIndexByName(dutIdx, szGroupName);

    return PyLong_FromLong(groupIdx);
}

//COMM_API int TedAdcGetChannelCount(int dutIdx, int groupIdx);
static PyObject* AdcGetChannelCount(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]); ;
    int chCount = TedAdcGetChannelCount(dutIdx, groupIdx);
    return PyLong_FromLong(chCount);
}

//COMM_API Bool TedAdcGetChannelName(int dutIdx, int groupIdx, int chIdx, /*OUT*/ char* szChName);
static PyObject* AdcGetChannelName(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    char szChName[32];
    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int chIdx = PyLong_AsLong(args[2]);

    TedAdcGetChannelName(dutIdx, groupIdx, chIdx, szChName);

    PyObject* strObject = PyUnicode_FromString(szChName);

    return strObject;
}

//COMM_API Bool TedAdcSetDevConfig(int dutIdx, int groupIdx, int value);
static PyObject* AdcSetDevConfig(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int value = PyLong_AsLong(args[2]);

    Bool bRet = TedAdcSetDevConfig(dutIdx, groupIdx, value);
    
    return PyLong_FromLong(bRet);
}

//COMM_API int TedAdcGetDevConfig(int dutIdx, int groupIdx);
static PyObject* AdcGetDevConfig(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    
    int value = TedAdcGetDevConfig(dutIdx, groupIdx);

    return PyLong_FromLong(value);
}

//COMM_API Bool TedAdcSetInConfig(int dutIdx, int groupIdx, int chIdx, int value);
static PyObject* AdcSetInConfig(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int chIdx = PyLong_AsLong(args[2]);
    int value = PyLong_AsLong(args[3]);

    Bool bRet = TedAdcSetInConfig(dutIdx, groupIdx, chIdx, value);

    return PyLong_FromLong(bRet);
}

//COMM_API int TedAdcGetInConfig(int dutIdx, int groupIdx, int chIdx);
static PyObject* AdcGetInConfig(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int chIdx = PyLong_AsLong(args[2]);
    
    int value = TedAdcGetInConfig(dutIdx, groupIdx, chIdx);

    return PyLong_FromLong(value);
}

//COMM_API int TedAdcGetVoltage(int dutIdx, int groupIdx, int chIdx);
static PyObject* AdcGetVoltage(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int chIdx = PyLong_AsLong(args[2]); 
    
    int volt = TedAdcGetVoltage(dutIdx, groupIdx, chIdx);

    return PyLong_FromLong(volt);
}

//COMM_API Bool TedAdcGetAllVoltage(int dutIdx, int groupIdx, int* valueArray);
static PyObject* AdcGetAllVoltage(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int i;
    PyListObject* list;
    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int channelCount = TedAdcGetChannelCount(dutIdx, groupIdx);

    if (channelCount > 0) {

        list = (PyListObject*)PyList_New(channelCount);
        int* valueArray = (int*)malloc(channelCount * sizeof(int));
        assert(valueArray);

        if (TedAdcGetAllVoltage(dutIdx, groupIdx, valueArray) == True) {

            for (i = 0; i < channelCount; i++) {
                PyList_SetItem((PyObject*)list, i, PyLong_FromLong(valueArray[i]));
            }
        }
        else {
            for (i = 0; i < channelCount; i++) {
                PyList_SetItem((PyObject*)list, i, PyLong_FromLong(-1));
            }
        }

        free(valueArray);
    }
    else {
        list = (PyListObject*)PyList_New(0);
    }

    return (PyObject*)list;

}

//COMM_API int TedAdcGetCurrent(int dutIdx, int groupIdx, int chIdx);
static PyObject* AdcGetCurrent(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int chIdx = PyLong_AsLong(args[2]);

    int volt = TedAdcGetCurrent(dutIdx, groupIdx, chIdx);

    return PyLong_FromLong(volt);
}

//COMM_API Bool TedAdcGetAllCurrent(int dutIdx, int groupIdx, int* valueArray);
static PyObject* AdcGetAllCurrent(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int i;
    PyListObject* list;
    int dutIdx = PyLong_AsLong(args[0]);
    int groupIdx = PyLong_AsLong(args[1]);
    int channelCount = TedAdcGetChannelCount(dutIdx, groupIdx);

    if (channelCount > 0) {

        list = (PyListObject*)PyList_New(channelCount);
        int* valueArray = (int*)malloc(channelCount * sizeof(int));
        assert(valueArray);

        if (TedAdcGetAllCurrent(dutIdx, groupIdx, valueArray) == True) {

            for (i = 0; i < channelCount; i++) {
                PyList_SetItem((PyObject*)list, i, PyLong_FromLong(valueArray[i]));
            }
        }
        else {
            for (i = 0; i < channelCount; i++) {
                PyList_SetItem((PyObject*)list, i, PyLong_FromLong(-1));
            }
        }

        free(valueArray);
    }
    else {
        list = (PyListObject*)PyList_New(0);
    }

    return (PyObject*)list;
}

//COMM_API Bool TedAdcSoutSetRBSel(int dutIdx, int value)
static PyObject* AdcSoutSetRBSel(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = PyLong_AsLong(args[1]);
    
    Bool bRet = TedAdcSoutSetRBSel(dutIdx, value);

    return PyLong_FromLong(bRet);
}

//COMM_API int TedAdcSoutGetRBSel(int dutIdx)
static PyObject* AdcSoutGetRBSel(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int value = TedAdcSoutGetRBSel(dutIdx);

    return PyLong_FromLong(value);
}

/*
ANA670X
*/
//COMM_API Bool TedANA670X_GetChipIDCount();
static PyObject* ANA670X_GetChipIDCount(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int chipIDCount = TedANA670X_GetChipIDCount();
    return PyLong_FromLong(chipIDCount);
}

//COMM_API Bool TedANA670X_GetChipID(int dutIdx, /*OUT*/unsigned char* chipIDArr);  
static PyObject* ANA670X_GetChipID(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int i;
    PyListObject* list;
    int dutIdx = PyLong_AsLong(args[0]);
    int chipIDCount = TedANA670X_GetChipIDCount();
    int dutCount;

    if (dutIdx == TedSysGetDutIndexAllDeviceValue()) {
        dutCount = TedSysGetDutCount();
    }
    else {
        dutCount = 1;
    }

    unsigned char* valueArr = (unsigned char*)malloc(dutCount * chipIDCount);
    assert(valueArr);
    
    list = (PyListObject*)PyList_New(dutCount * chipIDCount);
    assert(list);

    if (TedANA670X_GetChipID(dutIdx, valueArr) == True) {

        for (i = 0; i < (dutCount * chipIDCount); i++) {
            int v = ((int)valueArr[i])&0xFF;
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(v));
        }
    }
    else {
        for (i = 0; i < (dutCount * chipIDCount); i++) {
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(-1));
        }
    }

    free(valueArr);
    

    return (PyObject*)list;
}

//COMM_API int TedANA670X_GetProductRevisionBytesCount();
static PyObject* ANA670X_GetProductRevisionBytesCount(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int chipIDCount = TedANA670X_GetProductRevisionBytesCount();
    return PyLong_FromLong(chipIDCount);
}

//COMM_API Bool TedANA670X_GetProductRevisionBytes(int dutIdx, /*OUT*/unsigned char* revArr);
static PyObject* ANA670X_GetProductRevisionBytes(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int i;
    PyListObject* list;
    int dutIdx = PyLong_AsLong(args[0]);
    int revBytesCount = TedANA670X_GetProductRevisionBytesCount();
    int dutCount;

    if (dutIdx == TedSysGetDutIndexAllDeviceValue()) {
        dutCount = TedSysGetDutCount();
    }
    else {
        dutCount = 1;
    }

    unsigned char* valueArr = (unsigned char*)malloc(dutCount * revBytesCount);
    assert(valueArr);

    list = (PyListObject*)PyList_New(dutCount * revBytesCount);
    assert(list);

    if (TedANA670X_GetProductRevisionBytes(dutIdx, valueArr) == True) {

        for (i = 0; i < (dutCount * revBytesCount); i++) {
            int v = ((int)valueArr[i]) & 0xFF;
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(v));
        }
    }
    else {
        for (i = 0; i < (dutCount * revBytesCount); i++) {
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(-1));
        }
    }

    free(valueArr);


    return (PyObject*)list;
}

//COMM_API Bool TedANA670X_SetFrameRate(int dutIdx, int fr);
static PyObject* ANA670X_SetFrameRate(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int fr = PyLong_AsLong(args[1]);

    Bool bRet = TedANA670X_SetFrameRate(dutIdx, fr);
    
    return PyLong_FromLong(bRet);
}

//COMM_API int TedANA670X_GetFrameRate(int dutIdx);
static PyObject* ANA670X_GetFrameRate(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int dutIdx = PyLong_AsLong(args[0]);
    int fr = TedANA670X_GetFrameRate(dutIdx);
    return PyLong_FromLong(fr);
}


/*
Aging
*/
//COMM_API Bool TedAgingSetCurJobInfo(int dutIdx, int jobID, int status, int scIdx, int scCount, const char* desc);
static PyObject* AgingSetCurJobInfo(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int jobID, scIdx, scCnt;
    int status;
    
    PyObject* descPyObj;
    const char* desc;

    int dutIdx = PyLong_AsLong(args[0]);
    jobID = PyLong_AsLong(args[1]);
    status = PyLong_AsLong(args[2]);
    scIdx = PyLong_AsLong(args[3]);
    scCnt = PyLong_AsLong(args[4]);

    descPyObj = PyUnicode_AsASCIIString(args[5]);
    desc = PyBytes_AS_STRING(descPyObj);

    bRet = TedAgingSetCurJobInfo(dutIdx, jobID, status, scIdx, scCnt, desc);

    Py_DECREF(descPyObj);
    
    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedAgingSetCurSCInfo(int dutIdx, int scID, int status, int tcIdx, int tcCount, const char* desc);
static PyObject* AgingSetCurSCInfo(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int scID, tcIdx, tcCount;
    int status;

    PyObject* descPyObj;
    const char* desc;

    int dutIdx = PyLong_AsLong(args[0]);
    scID = PyLong_AsLong(args[1]);
    status = PyLong_AsLong(args[2]);
    tcIdx = PyLong_AsLong(args[3]);
    tcCount = PyLong_AsLong(args[4]);

    descPyObj = PyUnicode_AsASCIIString(args[5]);
    desc = PyBytes_AS_STRING(descPyObj);

    bRet = TedAgingSetCurSCInfo(dutIdx, scID, status, tcIdx, tcCount, desc);

    Py_DECREF(descPyObj);

    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedAgingSetCurTCInfo(int dutIdx, int tcID, int status, int tcStepIdx, int tcStepCount, const char* desc);
static PyObject* AgingSetCurTCInfo(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int tcID, tcStepIdx, tcStepCount;
    int status;

    PyObject* descPyObj;
    const char* desc;

    int dutIdx = PyLong_AsLong(args[0]);
    tcID = PyLong_AsLong(args[1]);
    status = PyLong_AsLong(args[2]);
    tcStepIdx = PyLong_AsLong(args[3]);
    tcStepCount = PyLong_AsLong(args[4]);

    descPyObj = PyUnicode_AsASCIIString(args[5]);
    desc = PyBytes_AS_STRING(descPyObj);

    bRet = TedAgingSetCurTCInfo(dutIdx, tcID, status, tcStepIdx, tcStepCount, desc);

    Py_DECREF(descPyObj);

    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedAgingSetCurTCStepInfo(int dutIdx, int tcStepID, int status, const char* desc);
static PyObject* AgingSetCurTCStepInfo(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    Bool bRet;
    int tcStepID;
    int status;

    PyObject* descPyObj;
    const char* desc;

    int dutIdx = PyLong_AsLong(args[0]);
    tcStepID = PyLong_AsLong(args[1]);
    status = PyLong_AsLong(args[2]);
    
    descPyObj = PyUnicode_AsASCIIString(args[3]);
    desc = PyBytes_AS_STRING(descPyObj);

    bRet = TedAgingSetCurTCStepInfo(dutIdx, tcStepID, status, desc);

    Py_DECREF(descPyObj);

    return PyLong_FromLong(bRet);
}

//COMM_API Bool TedAgingMeasureADC(int dutIdx, /*OUT*/void* res);
static PyObject* AgingMeasureADC(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int i;
    int listCount;
    PyListObject* list = NULL;
    Bool bRet;
    
    int resStructByteSize = TedAgingMeasureADCResultStructureByteSize();
    int* adcArr;
    unsigned char* resStructData = (unsigned char*)malloc(resStructByteSize);
    assert(resStructData);

    int dutIdx = PyLong_AsLong(args[0]);
    bRet = TedAgingMeasureADC(dutIdx, resStructData);
    listCount = resStructByteSize / sizeof(int);
    list = (PyListObject*)PyList_New(listCount);

    if (bRet) {
        adcArr = (int*)resStructData;
        for (i = 0; i < listCount; i++) {
            int v = adcArr[i];
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(v));
        }
    }
    else {
        for (i = 0; i < listCount; i++) {
            int v = -1;
            PyList_SetItem((PyObject*)list, i, PyLong_FromLong(v));
        }
    }

    free(resStructData);

    return (PyObject*)list;
}

//COMM_API int TedAgingMeasureADCResultStructureByteSize();
static PyObject* AgingMeasureADCResultStructureByteSize(PyObject* self, PyObject* const* args, Py_ssize_t nargs) {

    int byteSize = TedAgingMeasureADCResultStructureByteSize();
    return PyLong_FromLong(byteSize);
}


static struct PyMethodDef module_functions[] = {
    
    //System
    {"SysDelayMS",       (PyCFunction)(void(*)(void))SysDelayMS, METH_FASTCALL,   NULL},
    {"SysSetBoardID",       (PyCFunction)(void(*)(void))SysSetBoardID, METH_FASTCALL,   NULL},
    {"SysSetTcLocalSave",       (PyCFunction)(void(*)(void))SysSetTcLocalSave, METH_FASTCALL,   NULL},
    {"SysNotifyPyStart",       (PyCFunction)(void(*)(void))SysNotifyPyStart, METH_FASTCALL,   NULL},
    {"SysNotifyPyStop",       (PyCFunction)(void(*)(void))SysNotifyPyStop, METH_FASTCALL,   NULL},
    {"SysGetDutCount",       (PyCFunction)(void(*)(void))SysGetDutCount, METH_FASTCALL,   NULL},
    {"SysGetDutIndexAllDeviceValue",       (PyCFunction)(void(*)(void))SysGetDutIndexAllDeviceValue, METH_FASTCALL,   NULL}, 
    {"SysGetTickCount64",       (PyCFunction)(void(*)(void))SysGetTickCount64, METH_FASTCALL,   NULL},
    {"SysGetCurUtcTime",       (PyCFunction)(void(*)(void))SysGetCurUtcTime, METH_FASTCALL,   NULL}, 
    {"SysGetUtcTimeKST",       (PyCFunction)(void(*)(void))SysGetUtcTimeKST, METH_FASTCALL,   NULL}, 
    {"SysGetErrFlag",       (PyCFunction)(void(*)(void))SysGetErrFlag, METH_FASTCALL,   NULL},

    {"SysMipiLock",       (PyCFunction)(void(*)(void))SysMipiLock, METH_FASTCALL,   NULL},
    {"SysMipiUnlock",       (PyCFunction)(void(*)(void))SysMipiUnlock, METH_FASTCALL,   NULL},
    {"SysMipiIsLock",       (PyCFunction)(void(*)(void))SysMipiIsLock, METH_FASTCALL,   NULL},
    
    {"SysLedSetRed",       (PyCFunction)(void(*)(void))SysLedSetRed, METH_FASTCALL,   NULL}, 
    {"SysLedSetGreen",       (PyCFunction)(void(*)(void))SysLedSetGreen, METH_FASTCALL,   NULL}, 
    {"SysLedSetBlue",       (PyCFunction)(void(*)(void))SysLedSetBlue, METH_FASTCALL,   NULL}, 
    {"SysLedSetRGB",       (PyCFunction)(void(*)(void))SysLedSetRGB, METH_FASTCALL,   NULL}, 

    {"SysLedGetRed",       (PyCFunction)(void(*)(void))SysLedGetRed, METH_FASTCALL,   NULL}, 
    {"SysLedGetGreen",       (PyCFunction)(void(*)(void))SysLedGetGreen, METH_FASTCALL,   NULL}, 
    {"SysLedGetBlue",       (PyCFunction)(void(*)(void))SysLedGetBlue, METH_FASTCALL,   NULL}, 


    //#Pattern
    {"PatternConnect", (PyCFunction)(void(*)(void))PatternConnect, METH_FASTCALL, NULL},
    {"PatternDisconnect", (PyCFunction)(void(*)(void))PatternDisconnect, METH_FASTCALL, NULL},
    {"PatternIsConnect", (PyCFunction)(void(*)(void))PatternIsConnect, METH_FASTCALL, NULL},
    {"PatternSetCommand", (PyCFunction)(void(*)(void))PatternSetCommand, METH_FASTCALL, NULL},
    {"PatternPaint", (PyCFunction)(void(*)(void))PatternPaint, METH_FASTCALL, NULL},
    {"PatternUpdateScreen", (PyCFunction)(void(*)(void))PatternUpdateScreen, METH_FASTCALL, NULL},
    {"PatternDrawImage", (PyCFunction)(void(*)(void))PatternDrawImage, METH_FASTCALL, NULL},
    {"PatternScreenVerify", (PyCFunction)(void(*)(void))PatternScreenVerify, METH_FASTCALL, NULL},

    //Display DSIM
    {"DD_DSIM_manual_ctrl", (PyCFunction)(void(*)(void))DD_DSIM_manual_ctrl, METH_FASTCALL, NULL},
    {"DD_DSIM_power_ctrl", (PyCFunction)(void(*)(void))DD_DSIM_power_ctrl, METH_FASTCALL, NULL},
    {"DD_DSIM_source_cal", (PyCFunction)(void(*)(void))DD_DSIM_source_cal, METH_FASTCALL, NULL},

    {"DD_DSIM_sleepin", (PyCFunction)(void(*)(void))DD_DSIM_sleepin, METH_FASTCALL, NULL},
    {"DD_DSIM_sleepout", (PyCFunction)(void(*)(void))DD_DSIM_sleepout, METH_FASTCALL, NULL},
    {"DD_DSIM_deep_standby", (PyCFunction)(void(*)(void))DD_DSIM_deep_standby, METH_FASTCALL, NULL},
    {"DD_DSIM_displayon", (PyCFunction)(void(*)(void))DD_DSIM_displayon, METH_FASTCALL, NULL},
    {"DD_DSIM_reset_ctrl", (PyCFunction)(void(*)(void))DD_DSIM_reset_ctrl, METH_FASTCALL, NULL},

    {"DD_DSIM_MipiReadReg", (PyCFunction)(void(*)(void))DD_DSIM_MipiReadReg, METH_FASTCALL, NULL},
    {"DD_DSIM_MipiReadReg1Byte", (PyCFunction)(void(*)(void))DD_DSIM_MipiReadReg1Byte, METH_FASTCALL, NULL},
    {"DD_DSIM_MipiWriteReg", (PyCFunction)(void(*)(void))DD_DSIM_MipiWriteReg, METH_FASTCALL, NULL},
    {"DD_DSIM_MipiWriteReg1Byte", (PyCFunction)(void(*)(void))DD_DSIM_MipiWriteReg1Byte, METH_FASTCALL, NULL},
    {"DD_DSIM_MipiWriteReg39", (PyCFunction)(void(*)(void))DD_DSIM_MipiWriteReg39, METH_FASTCALL, NULL},
    {"DD_DSIM_MipiWriteReg15", (PyCFunction)(void(*)(void))DD_DSIM_MipiWriteReg15, METH_FASTCALL, NULL},
    {"DD_DSIM_MipiWriteReg05", (PyCFunction)(void(*)(void))DD_DSIM_MipiWriteReg05, METH_FASTCALL, NULL},
    {"DD_DSIM_MipiWriteReg07", (PyCFunction)(void(*)(void))DD_DSIM_MipiWriteReg07, METH_FASTCALL, NULL},

    //Display FB
    {"DD_FB_blank", (PyCFunction)(void(*)(void))DD_FB_blank, METH_FASTCALL, NULL},

    //ADC
    {"AdcGetInvalidValue", (PyCFunction)(void(*)(void))AdcGetInvalidValue, METH_FASTCALL, NULL},
    {"AdcGetGroupCount", (PyCFunction)(void(*)(void))AdcGetGroupCount, METH_FASTCALL, NULL},
    {"AdcGetGroupName", (PyCFunction)(void(*)(void))AdcGetGroupName, METH_FASTCALL, NULL},
    {"AdcGetGroupIndexByName", (PyCFunction)(void(*)(void))AdcGetGroupIndexByName, METH_FASTCALL, NULL},
    {"AdcGetChannelCount", (PyCFunction)(void(*)(void))AdcGetChannelCount, METH_FASTCALL, NULL},
    {"AdcGetChannelName", (PyCFunction)(void(*)(void))AdcGetChannelName, METH_FASTCALL, NULL},

    {"AdcSetDevConfig", (PyCFunction)(void(*)(void))AdcSetDevConfig, METH_FASTCALL, NULL},
    {"AdcGetDevConfig", (PyCFunction)(void(*)(void))AdcGetDevConfig, METH_FASTCALL, NULL},
    {"AdcSetInConfig", (PyCFunction)(void(*)(void))AdcSetInConfig, METH_FASTCALL, NULL},
    {"AdcGetInConfig", (PyCFunction)(void(*)(void))AdcGetInConfig, METH_FASTCALL, NULL},

    {"AdcGetVoltage", (PyCFunction)(void(*)(void))AdcGetVoltage, METH_FASTCALL, NULL},
    {"AdcGetAllVoltage", (PyCFunction)(void(*)(void))AdcGetAllVoltage, METH_FASTCALL, NULL},
    {"AdcGetCurrent", (PyCFunction)(void(*)(void))AdcGetCurrent, METH_FASTCALL, NULL},
    {"AdcGetAllCurrent", (PyCFunction)(void(*)(void))AdcGetAllCurrent, METH_FASTCALL, NULL},

    {"AdcSoutSetRBSel", (PyCFunction)(void(*)(void))AdcSoutSetRBSel, METH_FASTCALL, NULL},
    {"AdcSoutGetRBSel", (PyCFunction)(void(*)(void))AdcSoutGetRBSel, METH_FASTCALL, NULL},

    //ANA670X
    {"ANA670X_GetChipIDCount", (PyCFunction)(void(*)(void))ANA670X_GetChipIDCount, METH_FASTCALL, NULL},
    {"ANA670X_GetChipID", (PyCFunction)(void(*)(void))ANA670X_GetChipID, METH_FASTCALL, NULL},
    {"ANA670X_GetProductRevisionBytesCount", (PyCFunction)(void(*)(void))ANA670X_GetProductRevisionBytesCount, METH_FASTCALL, NULL},
    {"ANA670X_GetProductRevisionBytes", (PyCFunction)(void(*)(void))ANA670X_GetProductRevisionBytes, METH_FASTCALL, NULL},

    {"ANA670X_SetFrameRate", (PyCFunction)(void(*)(void))ANA670X_SetFrameRate, METH_FASTCALL, NULL},
    {"ANA670X_GetFrameRate", (PyCFunction)(void(*)(void))ANA670X_GetFrameRate, METH_FASTCALL, NULL},

    
    //#Aging
    {"AgingSetCurJobInfo", (PyCFunction)(void(*)(void))AgingSetCurJobInfo, METH_FASTCALL, NULL},
    {"AgingSetCurSCInfo", (PyCFunction)(void(*)(void))AgingSetCurSCInfo, METH_FASTCALL, NULL},
    {"AgingSetCurTCInfo", (PyCFunction)(void(*)(void))AgingSetCurTCInfo, METH_FASTCALL, NULL},
    {"AgingSetCurTCStepInfo", (PyCFunction)(void(*)(void))AgingSetCurTCStepInfo, METH_FASTCALL, NULL},
    {"AgingMeasureADC", (PyCFunction)(void(*)(void))AgingMeasureADC, METH_FASTCALL, NULL},
    {"AgingMeasureADCResultStructureByteSize", (PyCFunction)(void(*)(void))AgingMeasureADCResultStructureByteSize, METH_FASTCALL, NULL},

    {NULL,       NULL}          /* sentinel */
};


/* Module initialization */

PyDoc_STRVAR(module_doc,
"Functions to convert between Python values and C structs.\n\
Python bytes objects are used to hold the data representing the C struct\n\
and also as format strings (explained below) to describe the layout of data\n\
in the C struct.\n\
\n\
The optional first format char indicates byte order, size and alignment:\n\
  @: native order, size & alignment (default)\n\
  =: native order, std. size & alignment\n\
  <: little-endian, std. size & alignment\n\
  >: big-endian, std. size & alignment\n\
  !: same as >\n\
\n\
The remaining chars indicate types of args and must match exactly;\n\
these can be preceded by a decimal repeat count:\n\
  x: pad byte (no data); c:char; b:signed byte; B:unsigned byte;\n\
  ?: _Bool (requires C99; if not available, char is used instead)\n\
  h:short; H:unsigned short; i:int; I:unsigned int;\n\
  l:long; L:unsigned long; f:float; d:double; e:half-float.\n\
Special cases (preceding decimal count indicates length):\n\
  s:string (array of char); p: pascal string (with count byte).\n\
Special cases (only available in native format):\n\
  n:ssize_t; N:size_t;\n\
  P:an integer type that is wide enough to hold a pointer.\n\
Special case (not in native mode unless 'long long' in platform C):\n\
  q:long long; Q:unsigned long long\n\
Whitespace between formats is ignored.\n\
\n\
The variable struct.error is an exception raised on errors.\n");


static struct PyModuleDef _tedmodule = {
    PyModuleDef_HEAD_INIT,
    "_ted",
    module_doc,
    -1,
    module_functions,
    NULL,
    NULL,
    NULL,
    NULL
};

PyMODINIT_FUNC
PyInit__ted(void)
{
    PyObject *m;

    m = PyModule_Create(&_tedmodule);
    if (m == NULL)
        return NULL;

    /* Add some symbolic constants to the module */
    if (TedError == NULL) {
        TedError = PyErr_NewException("ted.error", NULL, NULL);
        if (TedError == NULL)
            return NULL;
    }

    Py_INCREF(TedError);
    PyModule_AddObject(m, "error", TedError);

    return m;
}
