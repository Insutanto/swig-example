# SWIG tutorial

## homepage

SWIG is a software development tool that connects programs written in C and C++ with a variety of high-level programming languages.

http://www.swig.org/

## Document
http://www.swig.org/Doc3.0/

## install SWIG (macOS)
* pre download the pcre package and put 'pcre-8.40.tar' in the root of swig directory
* run `./Tools/pcre-build.sh`
* pre install automake
* ./autogen.sh 
* ./configure & make & make install


## SWIG for Python2.7

### create example.h and example.c
<pre>
/* File : example2.h */
#ifndef TEST_SWIG_LIBRARY_H
#define TEST_SWIG_LIBRARY_H

char* hello();
int m_mod(int n, int m);
#endif
</pre>

<pre>
/* File : example2.c */
#include "example2.h"
#include <stdio.h>

char * author = "moment";

char* hello() {
    return "moment's module";
}

int m_mod(int n, int m) {
    return(n % m);
}
</pre>

## create example2.i

<pre>
/* File : example2.i */
%module example2
%{
/* Put headers and other declarations here */
extern char* author;
extern char*    hello();
extern int    m_mod(int n, int m);
%}

extern char* author;
extern char*    hello();
extern int    m_mod(int n, int m);
</pre>

swig -python example2.i

gcc -fPIC -c example2_wrap.c -I ~/dev/py_venv/test_swig/include/python2.7

export DYLD_LIBRARY_PATH='/Users/moment/CLionProjects/swig_example/'

gcc -lpython2.7 -dynamiclib ../output/lib/libexample2.dylib example2_wrap.o -o _example2.so