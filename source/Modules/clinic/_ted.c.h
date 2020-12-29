/*[clinic input]
preserve
[clinic start generated code]*/

PyDoc_STRVAR(Ted___init____doc__,
"Ted(format)\n"
"--\n"
"\n"
"Create a compiled struct object.\n"
"\n"
"Return a new Ted object which writes and reads binary data according to\n"
"the format string.\n"
"\n"
"See help(struct) for more on format strings.");

static int
Ted___init___impl(PyTedObject *self, PyObject *format);

static int
Ted___init__(PyObject *self, PyObject *args, PyObject *kwargs)
{
    int return_value = -1;
    static const char * const _keywords[] = {"format", NULL};
    static _PyArg_Parser _parser = {NULL, _keywords, "Ted", 0};
    PyObject *argsbuf[1];
    PyObject * const *fastargs;
    Py_ssize_t nargs = PyTuple_GET_SIZE(args);
    PyObject *format;

    fastargs = _PyArg_UnpackKeywords(_PyTuple_CAST(args)->ob_item, nargs, kwargs, NULL, &_parser, 1, 1, 0, argsbuf);
    if (!fastargs) {
        goto exit;
    }
    format = fastargs[0];
    return_value = Ted___init___impl((PyTedObject *)self, format);

exit:
    return return_value;
}

/*[clinic end generated code: output=6a6228cfc4b7099c input=a9049054013a1b77]*/
