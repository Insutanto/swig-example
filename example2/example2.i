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