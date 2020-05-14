%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "node.h"
#include "y.tab.h"
int *yyerror(const char *msg), number(char *in, int base);

char tempc;
%}
%x MINOR STRNG
%%

^program                            BEGIN MINOR; return PROGRAM; 
^module                             BEGIN MINOR; return MODULE;
<MINOR>^end                         BEGIN 0; return END;

<MINOR>\$\$.*                       ; // Explanatory comment
<MINOR>\$.+\$                       ; // Operational comment

<MINOR>^program                     yyerror("Reserved word in first column");
<MINOR>^module                      yyerror("Reserved word in first column");
<MINOR>start                        return START;
<MINOR>void                         return VOID;
<MINOR>const                        return CONST;
<MINOR>number                       return NUMBER;
<MINOR>array                        return ARRAY;
<MINOR>string                       return STRING;
<MINOR>function                     return FUNCTION;
<MINOR>public                       return PUBLIC;
<MINOR>forward                      return FORWARD;
<MINOR>if                           return IF;
<MINOR>then                         return THEN;
<MINOR>else                         return ELSE;
<MINOR>elif                         return ELIF;
<MINOR>fi                           return FI;
<MINOR>for                          return FOR;
<MINOR>until                        return UNTIL;
<MINOR>step                         return STEP;
<MINOR>do                           return DO;
<MINOR>done                         return DONE;
<MINOR>repeat                       return REPEAT;
<MINOR>stop                         return STOP;
<MINOR>return                       return RETURN;

<MINOR>\'\\n\'                      yylval.i = '\n'; return NUM;
<MINOR>\'\\t\'                      yylval.i = '\t'; return NUM;
<MINOR>\'\\r\'                      yylval.i = '\r'; return NUM;
<MINOR>\'\\[\\\']\'                 yylval.i = yytext[2]; return NUM;
<MINOR>\'\\([0-9A-Fa-f]{1,2})\'     yylval.i = number(strncpy(yytext, yytext+2, yyleng-3), 16); return NUM;
<MINOR>\'\\[^\']*\'                     yyerror("Invalid escape character");
<MINOR>\'.\'                        yylval.i = yytext[1]; return NUM;
<MINOR>\'[.|\n]*\'                  yyerror("Invalid character");

<MINOR>\"(\\\"|[^"])*\"             yylval.s = (char*) malloc(sizeof(char)*yyleng); *yylval.s = 0; REJECT;
<MINOR>\"                           BEGIN STRNG;
<STRNG>\\[ntr]                      strcat(yylval.s, yytext);
<STRNG>\\[\"\\]                     strcat(yylval.s, yytext+1);
<STRNG>\\([0-9A-Fa-f]{1,2})         tempc = (char) number(yytext+1,16); strncat(yylval.s, &tempc, 1);
<STRNG>\\                           yyerror("Invalid escape character in string");
<STRNG>[^"]                         strcat(yylval.s, yytext);
<STRNG>\"                           BEGIN MINOR; return STR;

<MINOR>0[0-7]+                      yylval.i = number(yytext+1, 8); return NUM;
<MINOR>0x[0-9A-Fa-f]+               yylval.i = number(yytext+2, 16); return NUM;
<MINOR>0b[01]+                      yylval.i = number(yytext+2, 2); return NUM;
<MINOR>[1-9][0-9]*|0                yylval.i = number(yytext, 10); return NUM;

<MINOR>[A-Za-z]+[0-9A-Za-z\_]*      yylval.s = strdup(yytext); return ID;

<MINOR>\:\=                         return DEF;
<MINOR>\>\=                         return GE;
<MINOR>\<\=                         return LE;
<MINOR>\~\=                         return NE;
<MINOR>[-+*/%^<>=|&~?#\[\]();:!,]   return *yytext;

<MINOR>[ \t\n\r]+		    ; /* ignore whitespace */ 
<MINOR>.                            yyerror("Unknown character");


%%
int yywrap(void) {
    if (YYSTATE == MINOR) yyerror("unterminated comment");
    if (YYSTATE == STRNG) yyerror("unterminated string");
    return 1;
} 
char *getyytext() { return yytext; }
int number(char *in, int base) {
    errno = 0;
    int ret = strtol(in, 0, base);
    if (ret < 0 || errno == ERANGE) yyerror("overflow");
    return ret;
}
