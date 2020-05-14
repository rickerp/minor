/* original parser id follows */
/* yysccsid[] = "@(#)yaccpar	1.9 (Berkeley) 02/21/93" */
/* (use YYMAJOR/YYMINOR for ifdefs dependent on parser version) */

#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYPATCH 20140715

#define YYEMPTY        (-1)
#define yyclearin      (yychar = YYEMPTY)
#define yyerrok        (yyerrflag = 0)
#define YYRECOVERING() (yyerrflag != 0)
#define YYENOMEM       (-2)
#define YYEOF          0
#define YYPREFIX "yy"

#define YYPURE 0

#line 2 "gram.y"
#include <stdio.h>
#include <stdlib.h>
#include "node.h"
#include "tabid.h"

#define YYDEBUG 1 /* for yyname */

#define CHECK_BIT(var,pos) ((var) & (1<<(pos)))
#define CHECK_FORWARD(var) CHECK_BIT(var, 3)

#define MASKENTITY(mask) (0b01 & mask)
#define MASKTYPE(mask) (0b011 & (mask>>1))
#define MASKQUALI(mask) (0b011 & (mask>>3))
#define MASKCONST(mask) (0b01 & (mask>>5))
#define MASKREC(mask) (0b01 & (mask>>6))

#define MASK(vf, type, quali, cons, r) (vf + 2*TYPECODE(type) + 8*QUALICODE(quali) + 32*cons + 64*r)
#define TYPECODE(type) (type < VOID ? type : type-VOID)
#define CODETYPE(code) (code < VOID ? code+VOID : code)
#define QUALICODE(quali) (quali < FUNCTION ? quali : quali-FUNCTION)
#define CODEQUALI(code) (code < FUNCTION ? code+FUNCTION : code)

#define EQUALQUALI(q1, q2) (QUALICODE(q1) == QUALICODE(q2))
#define EQUALTYPE(t1, t2) (TYPECODE(t1) == TYPECODE(t2))
#define BOTHTYPE(t1, t2, t) (EQUALTYPE(t1, t) && EQUALTYPE(t2, t))
#define ONETYPE(t1, t2, t) (EQUALTYPE(t1, t) || EQUALTYPE(t2, t))
#define ARRAYNUMBER(t1, t2) (EQUALTYPE(t1, ARRAY) && EQUALTYPE(t2, NUMBER))

int yylex(), yyparse(), yyerror(char*);
void entity(char *name, int ret_type, void* args, int vf, int typ, int qual, int cons, int rec);
#line 33 "gram.y"
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union { int i; char *s; Node *n; } YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
#line 61 "y.tab.c"

/* compatibility with bison */
#ifdef YYPARSE_PARAM
/* compatibility with FreeBSD */
# ifdef YYPARSE_PARAM_TYPE
#  define YYPARSE_DECL() yyparse(YYPARSE_PARAM_TYPE YYPARSE_PARAM)
# else
#  define YYPARSE_DECL() yyparse(void *YYPARSE_PARAM)
# endif
#else
# define YYPARSE_DECL() yyparse(void)
#endif

/* Parameters sent to lex. */
#ifdef YYLEX_PARAM
# define YYLEX_DECL() yylex(void *YYLEX_PARAM)
# define YYLEX yylex(YYLEX_PARAM)
#else
# define YYLEX_DECL() yylex(void)
# define YYLEX yylex()
#endif

/* Parameters sent to yyerror. */
#ifndef YYERROR_DECL
#define YYERROR_DECL() yyerror(const char *s)
#endif
#ifndef YYERROR_CALL
#define YYERROR_CALL(msg) yyerror(msg)
#endif

extern int YYPARSE_DECL();

#define DEF 257
#define NE 258
#define LE 259
#define GE 260
#define POINTER 261
#define UMINUS 262
#define NUM 263
#define STR 264
#define ID 265
#define PROGRAM 266
#define END 267
#define MODULE 268
#define START 269
#define VOID 270
#define NUMBER 271
#define STRING 272
#define ARRAY 273
#define CONST 274
#define FUNCTION 275
#define FORWARD 276
#define PUBLIC 277
#define RECUR 278
#define RETURN 279
#define IF 280
#define THEN 281
#define ELSE 282
#define ELIF 283
#define FI 284
#define FOR 285
#define UNTIL 286
#define STEP 287
#define DO 288
#define DONE 289
#define REPEAT 290
#define STOP 291
#define NIL 292
#define DECLS 293
#define FHEAD 294
#define PROPS 295
#define PRIV 296
#define TYPE 297
#define FBODY 298
#define VAR 299
#define DECLITS 300
#define BODY 301
#define LITS 302
#define INDEX 303
#define FUNC 304
#define DECVARS 305
#define INSTRS 306
#define IFBLOCK 307
#define FORHEAD 308
#define FORCHECK 309
#define ARRAYID 310
#define ARGS 311
#define CALL 312
#define PRIO 313
#define ACCESS 314
#define YYERRCODE 256
typedef short YYINT;
static const YYINT yylhs[] = {                           -1,
   30,   31,    0,    0,    1,    1,    2,    2,   32,   33,
    3,    3,   25,   25,   26,   26,    4,    4,    5,    5,
    6,    6,   27,   27,   28,   28,   28,    7,    7,   29,
   29,    8,    8,    9,    9,   10,   10,   11,   11,   12,
   12,   13,   14,   14,   15,   16,   16,   17,   17,   17,
   17,   17,   18,   18,   18,   18,   19,   19,   20,   20,
   21,   21,   22,   22,   23,   23,   24,   24,   24,   24,
   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
   24,   24,   24,   24,   24,   24,   24,   24,   24,
};
static const YYINT yylen[] = {                            2,
    0,    0,    7,    3,    0,    1,    1,    3,    0,    0,
    8,    4,    0,    1,    1,    1,    0,    1,    1,    3,
    2,    5,    1,    1,    1,    1,    1,    1,    2,    0,
    1,    0,    3,    1,    2,    1,    3,    0,    2,    1,
    1,    2,    0,    3,    2,    0,    2,    7,    9,    2,
    2,    4,    0,    1,    1,    2,    0,    5,    0,    2,
    0,    1,    1,    4,    1,    3,    2,    1,    4,    3,
    1,    2,    2,    3,    3,    3,    3,    3,    3,    3,
    3,    3,    3,    3,    3,    2,    3,    3,    3,
};
static const YYINT yydefred[] = {                         0,
    0,    0,    0,    0,   16,   15,    0,    0,    7,    0,
   14,    0,    0,    1,    0,   31,    0,    4,   24,   25,
   26,   27,    0,   23,   43,    8,    0,    0,    9,    0,
    0,    0,   12,    0,    0,    2,    0,   42,    0,   40,
   41,    0,    0,    0,    0,   19,    3,   44,    0,    0,
    0,   71,    0,    0,    0,    0,    0,   54,   55,   38,
   47,   45,    0,    0,    0,   33,    0,    0,   43,   28,
   10,    0,    0,   72,    0,    0,   73,    0,    0,    0,
   56,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,   50,   51,    0,   36,   39,   22,   29,   11,   20,
   70,    0,    0,    0,   46,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,   69,    0,   64,   57,    0,   52,   37,
    0,    0,    0,   46,    0,    0,    0,   60,    0,   48,
   46,   46,    0,   58,   49,
};
static const YYINT yydgoto[] = {                          3,
    7,    8,    9,   44,   45,   27,   71,   33,   66,  104,
   67,   60,   30,   31,   38,   39,   61,   62,  142,  146,
   81,   75,  112,   64,   10,   11,   23,   28,   17,   25,
   47,   35,  109,
};
static const YYINT yysindex[] = {                      -181,
 -166, -166,    0, -260,    0,    0, -245,   -8,    0, -241,
    0, -224, -202,    0, -166,    0, -148,    0,    0,    0,
    0,    0, -175,    0,    0,    0, -150, -127,    0, -124,
 -148, -225,    0,   54, -148,    0,   87,    0,  341,    0,
    0,  113,  -99, -214,  107,    0,    0,    0,  -98,  102,
  102,    0,  102,  -37,  102,  102,  102,    0,    0,    0,
    0,    0,  -34, 1262, -225,    0, -225,   84,    0,    0,
    0, -148,   88,    0,  -79,  455,    0, 1299,  102,  102,
    0, 1432, 1195, 1166, -225,  102,  102,  102,  102,  102,
  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
  102,    0,    0,  137,    0,    0,    0,    0,    0,    0,
    0,  -23, 1432, 1327,    0,  102, 1432, 1401,  525,  455,
 1306, 1306,  158,  158,  158,  158,   -5,   -5,   89,   89,
   89,   89, -225,    0,  102,    0,    0, 1155,    0,    0,
 1432, -204,  102,    0,  102, -102, 1006,    0, 1231,    0,
    0,    0, -103,    0,    0,
};
static const YYINT yyrindex[] = {                         0,
 -143, -179,    0, -167,    0,    0,    0, -128,    0,  -97,
    0,    0,    0,    0, -112,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,  -28,    0,    0,    0,
  795,    0,    0,   43, -174,    0,    0,    0,  -52,    0,
    0,  -53,    0,    0, -138,    0,    0,    0,    0,    0,
    0,    0,    0,  -33,  -25,    0,    0,    0,    0,    0,
    0,    0, 1273,    0,    0,    0,  -24,    0,    0,    0,
    0,    0,    3,    0,   39,  753,    0,    0,    0,    0,
    0,   -1,    0,    0,   75,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,   -2,    0,    0,    0,    0,    0,    0,
    0,    0,  -19,    0,    0,    0,  717,    0,  902,  892,
  857,  867,  520,  555,  592,  824,  450,  485,  111,  147,
  380,  415,    0,    0,    0,    0,    0,    0,    0,    0,
    8,  -91,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,
};
static const YYINT yygindex[] = {                         0,
  185,    0,  181,    0,    0,  -16,    0,    0,    0,    0,
  138,  -12,  128,    0,  -85,    0,    0,    0,    0,    0,
    0,  -26,    0, 1448,  198,    0,    0,  199,    0,    0,
    0,    0,    0,
};
#define YYTABLESIZE 1692
static const YYINT yytable[] = {                         63,
   87,   63,   79,   63,   63,   38,   53,   63,   63,   63,
   63,   63,   63,   63,   37,    5,    6,  134,   46,   42,
  135,   65,   74,   14,   65,   63,   63,   63,   63,  137,
   32,  100,   16,   61,   34,   63,   98,   40,   41,   63,
   63,   99,   18,   63,   63,   63,   63,   63,   66,   63,
   15,   66,  105,   80,  106,  110,   35,   62,  148,   63,
   63,   63,   63,   63,   63,  153,  154,   19,   20,   21,
   22,   68,  106,   69,   70,   68,   68,  144,  145,   68,
   68,   68,   68,   68,    1,   68,    2,    5,  101,   29,
   63,   13,   13,   13,   13,   63,   63,   68,   68,   68,
   68,   21,   13,   13,   13,   13,   32,   67,    4,    5,
    6,   67,   67,   17,   17,   67,   67,   67,   67,   67,
  140,   67,   20,   21,   22,    5,   63,   13,   13,   13,
   13,   68,   68,   67,   67,   67,   67,   34,    6,   49,
    6,   53,   36,   75,   43,   48,   51,   75,   75,   18,
   18,   75,   75,   75,   75,   75,   65,   75,   13,   13,
   13,   13,   68,   68,   52,   72,   73,   67,   67,   75,
   75,   75,   75,   30,   30,   30,  107,   86,   80,   76,
  133,  150,  101,   76,   76,  155,   12,   76,   76,   76,
   76,   76,   59,   76,  100,   26,  108,   85,   67,   98,
   96,   13,   97,   75,   99,   76,   76,   76,   76,   38,
   38,   24,    0,   38,   53,   38,   53,    0,    0,    0,
    0,    0,   86,   63,   63,   63,   63,   50,    0,   53,
   53,   53,    0,   63,   75,   63,   53,    0,   32,   76,
   32,   61,   34,   61,   34,    0,    0,   63,   63,   63,
   63,  101,   63,   63,   63,   63,   61,   61,   61,    0,
   63,   63,   63,   61,   35,   62,   35,   62,    0,   63,
   76,   63,    0,    0,    0,    0,    0,    0,    0,    0,
   62,   62,   62,   63,   63,   63,   63,   62,   63,   63,
   63,   63,    0,    0,    0,    0,   68,   68,   68,   21,
    0,    0,    0,    0,    0,   68,    0,   68,    0,   21,
    0,   21,    0,    0,    0,    0,    0,    0,    0,   68,
   68,   68,   68,    0,   68,   68,   68,   68,    0,    0,
   21,   21,   67,   67,   67,    0,    0,    0,    0,    0,
    0,   67,    0,   67,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,   67,   67,   67,   67,    0,
   67,   67,   67,   67,   40,   41,   54,    0,   75,   75,
   75,    0,    0,    0,    0,    0,    0,   75,   49,   75,
   53,    0,    0,    0,    0,   51,    0,    0,    0,    0,
    0,   75,   75,   75,   75,    0,   75,   75,   75,   75,
    0,    0,    0,   52,   76,   76,   76,    0,    0,    0,
    0,    0,   77,   76,    0,   76,   77,   77,    0,    0,
   77,   77,   77,   77,   77,    0,   77,   76,   76,   76,
   76,    0,   76,   76,   76,   76,    0,    0,   77,   77,
   77,   77,    0,    0,    0,    0,    0,   74,    0,    0,
    0,   74,   74,    0,    0,   74,   74,   74,   74,   74,
    0,   74,    0,    0,    0,    0,   50,    0,    0,    0,
    0,    0,   77,   74,   74,   74,   74,    0,    0,    0,
    0,    0,   78,    0,    0,    0,    0,   78,    0,    0,
   78,  100,   78,   78,   78,    0,   98,   96,    0,   97,
    0,   99,    0,   77,    0,    0,    0,   74,   78,   78,
   78,   78,    0,    0,   92,   91,   93,   79,    0,    0,
    0,    0,   79,    0,    0,   79,    0,   79,   79,   79,
    0,    0,    0,    0,    0,    0,    0,    0,   74,    0,
    0,    0,   78,   79,   79,   79,   79,    0,  101,    0,
    0,    0,   80,    0,    0,    0,    0,   80,    0,    0,
   80,  100,   89,   80,    0,    0,   98,   96,    0,   97,
    0,   99,    0,   78,    0,    0,    0,   79,   80,   80,
   80,   80,    0,    0,   92,   91,   93,   81,    0,    0,
    0,    0,   81,    0,    0,   81,    0,    0,   81,    0,
    0,    0,    0,   40,   41,   54,    0,    0,   79,    0,
    0,    0,   80,   81,   81,   81,   81,    0,  101,   55,
   56,    0,    0,    0,   82,   57,    0,    0,    0,   82,
   58,   59,   82,    0,    0,   82,    0,   77,   77,   77,
    0,    0,    0,   80,    0,    0,   77,   81,   77,    0,
   82,   82,   82,   82,    0,    0,    0,    0,    0,    0,
   77,   77,   77,   77,    0,   77,   77,   77,   77,    0,
    0,    0,   74,   74,   74,    0,    0,    0,   81,    0,
    0,   74,    0,   74,   82,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,   74,   74,   74,   74,    0,
   74,   74,   74,   74,    0,    0,    0,   78,   78,   78,
    0,    0,   90,   94,   95,   82,   78,    0,   78,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
   78,   78,   78,   78,    0,   78,   78,   78,   78,    0,
    0,    0,   79,   79,   79,    0,    0,    0,    0,   89,
    0,   79,    0,   79,    0,    0,    0,   89,    0,    0,
   89,    0,    0,    0,    0,   79,   79,   79,   79,    0,
   79,   79,   79,   79,    0,   89,    0,   80,   80,   80,
    0,    0,   90,   94,   95,   86,   80,    0,   80,    0,
   86,    0,    0,   86,    0,    0,   86,    0,    0,    0,
   80,   80,   80,   80,    0,   80,   80,   80,   80,   89,
    0,   86,   81,   81,   81,    0,    0,    0,    0,    0,
    0,   81,    0,   81,    0,    0,    0,    0,    0,    0,
    0,    0,   46,    0,   46,   81,   81,   81,   81,   46,
   81,   81,   81,   81,    0,   86,    0,    0,    0,   82,
   82,   82,    0,   46,    0,    0,   83,   46,   82,    0,
   82,   83,    0,    0,   83,    0,    0,   83,    0,    0,
    0,    0,   82,   82,   82,   82,   86,   82,   82,   82,
   82,    0,   83,   83,   83,   83,    0,    0,    0,   85,
    0,    0,    0,    0,   85,    0,    0,   85,    0,   84,
   85,    0,    0,    0,   84,    0,    0,   84,    0,    0,
   84,    0,    0,    0,    0,   85,   83,   85,    0,    0,
   46,    0,    0,    0,   87,   84,    0,   84,    0,   87,
    0,    0,   87,    0,   88,   87,    0,    0,    0,    0,
    0,    0,   88,    0,    0,   88,    0,   83,    0,   85,
   87,    0,    0,    0,    0,    0,    0,    0,    0,   84,
   88,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
   85,    0,    0,   89,   87,   89,    0,    0,    0,    0,
   84,    0,    0,    0,   88,    0,    0,   89,   89,   89,
   89,    0,   89,   89,   89,   89,    0,    0,    0,    0,
    0,    0,    0,    0,    0,   87,    0,    0,    0,   86,
    0,   86,    0,    0,    0,   88,    0,    0,    0,    0,
    0,    0,    0,   86,   86,   86,   86,    0,   86,   86,
   86,   86,  100,   89,    0,    0,    0,   98,   96,    0,
   97,    0,   99,    0,    0,    0,    0,   46,   46,   46,
    0,   46,    0,   46,    0,   92,   91,   93,    0,    0,
    0,    0,    0,   46,   46,    0,    0,    0,    0,   46,
    0,   83,   83,   83,   46,   46,    0,    0,    0,    0,
   83,    0,   83,    0,    0,    0,    0,    0,    0,  101,
    0,    0,    0,    0,   83,   83,   83,   83,    0,   83,
   83,   83,   83,    0,   85,    0,    0,    0,    0,    0,
    0,    0,    0,   85,   84,   85,    0,    0,    0,   88,
    0,    0,    0,   84,    0,   84,    0,   85,   85,   85,
   85,    0,   85,   85,   85,   85,    0,   84,   84,   84,
   84,    0,   84,   84,   84,   84,    0,    0,   87,    0,
   87,    0,    0,    0,    0,    0,    0,    0,   88,    0,
   88,    0,   87,   87,   87,   87,    0,   87,   87,   87,
   87,    0,   88,   88,   88,   88,    0,   88,   88,   88,
   88,  100,   89,    0,    0,    0,   98,   96,    0,   97,
    0,   99,  100,   89,    0,    0,    0,   98,   96,    0,
   97,    0,   99,    0,   92,   91,   93,    0,    0,    0,
    0,    0,    0,    0,    0,   92,   91,   93,    0,    0,
    0,  100,   89,    0,    0,    0,   98,   96,    0,   97,
    0,   99,    0,    0,    0,    0,    0,    0,  101,    0,
    0,    0,    0,    0,   92,   91,   93,    0,    0,  101,
    0,    0,    0,   90,   94,   95,    0,  100,   89,    0,
    0,    0,   98,   96,    0,   97,    0,   99,   88,    0,
    0,    0,    0,    0,    0,    0,    0,    0,  101,   88,
   92,   91,   93,  151,  103,    0,    0,    0,  100,   89,
    0,    0,    0,   98,   96,   68,   97,    0,   99,   68,
   68,    0,    0,    0,   68,   68,    0,   68,   88,   68,
  102,   92,   91,   93,  101,    0,    0,    0,    0,    0,
    0,   68,   68,   68,   68,  100,   89,    0,    0,  111,
   98,   96,  100,   97,    0,   99,    0,   98,   96,    0,
   97,    0,   99,    0,   88,  101,    0,    0,   92,   91,
   93,    0,    0,  100,   89,   92,   68,   93,   98,   96,
    0,   97,    0,   99,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,   88,   92,   91,   93,    0,
    0,    0,  101,    0,    0,    0,   68,    0,    0,  101,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,   90,   94,   95,    0,    0,    0,    0,  136,
  101,    0,   88,   90,   94,   95,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,  100,   89,    0,
    0,  143,   98,   96,    0,   97,    0,   99,    0,    0,
   88,  116,   90,   94,   95,    0,    0,    0,    0,  139,
   92,   91,   93,    0,    0,    0,    0,    0,  100,   89,
    0,    0,    0,   98,   96,  115,   97,    0,   99,    0,
    0,    0,    0,    0,    0,    0,    0,    0,   90,   94,
   95,   92,   91,   93,  101,    0,    0,   76,   77,    0,
   78,    0,   82,   83,   84,    0,    0,    0,    0,    0,
    0,  152,    0,    0,    0,    0,    0,    0,    0,   90,
   94,   95,    0,    0,   88,  101,  113,  114,    0,    0,
   68,   68,   68,  117,  118,  119,  120,  121,  122,  123,
  124,  125,  126,  127,  128,  129,  130,  131,  132,    0,
    0,    0,    0,    0,    0,   88,   90,   94,   95,    0,
    0,    0,    0,  138,   94,   95,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,  141,    0,   90,   94,   95,    0,    0,    0,
  147,    0,  149,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,   90,   94,
   95,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,   90,
   94,   95,
};
static const YYINT yycheck[] = {                         33,
   35,   35,   40,   37,   38,   59,   59,   41,   42,   43,
   44,   45,   39,   47,   31,  276,  277,   41,   35,   32,
   44,   41,   49,  269,   44,   59,   60,   61,   62,  115,
   59,   37,  274,   59,   59,   33,   42,  263,  264,   37,
   38,   47,  267,   41,   42,   43,   44,   45,   41,   47,
   59,   44,   65,   91,   67,   72,   59,   59,  144,   93,
   94,   59,   60,   61,   62,  151,  152,  270,  271,  272,
  273,   33,   85,  288,  289,   37,   38,  282,  283,   41,
   42,   43,   44,   45,  266,   47,  268,  267,   94,  265,
  124,  271,  272,  273,  274,   93,   94,   59,   60,   61,
   62,   59,  270,  271,  272,  273,  257,   33,  275,  276,
  277,   37,   38,  288,  289,   41,   42,   43,   44,   45,
  133,   47,  271,  272,  273,  269,  124,  271,  272,  273,
  274,   93,   94,   59,   60,   61,   62,  265,  267,   38,
  269,   40,  267,   33,   91,   59,   45,   37,   38,  288,
  289,   41,   42,   43,   44,   45,   44,   47,  271,  272,
  273,  274,  124,  263,   63,   59,  265,   93,   94,   59,
   60,   61,   62,  271,  272,  273,   93,  257,   91,   33,
   44,  284,   94,   37,   38,  289,    2,   41,   42,   43,
   44,   45,  284,   47,   37,   15,   69,   60,  124,   42,
   43,    4,   45,   93,   47,   59,   60,   61,   62,  263,
  264,   13,   -1,  267,  267,  269,  269,   -1,   -1,   -1,
   -1,   -1,  257,  257,  258,  259,  260,  126,   -1,  282,
  283,  284,   -1,  267,  124,  269,  289,   -1,  267,   93,
  269,  267,  267,  269,  269,   -1,   -1,  281,  282,  283,
  284,   94,  286,  287,  288,  289,  282,  283,  284,   -1,
  258,  259,  260,  289,  267,  267,  269,  269,   -1,  267,
  124,  269,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
  282,  283,  284,  281,  282,  283,  284,  289,  286,  287,
  288,  289,   -1,   -1,   -1,   -1,  258,  259,  260,  257,
   -1,   -1,   -1,   -1,   -1,  267,   -1,  269,   -1,  267,
   -1,  269,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  281,
  282,  283,  284,   -1,  286,  287,  288,  289,   -1,   -1,
  288,  289,  258,  259,  260,   -1,   -1,   -1,   -1,   -1,
   -1,  267,   -1,  269,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,  281,  282,  283,  284,   -1,
  286,  287,  288,  289,  263,  264,  265,   -1,  258,  259,
  260,   -1,   -1,   -1,   -1,   -1,   -1,  267,   38,  269,
   40,   -1,   -1,   -1,   -1,   45,   -1,   -1,   -1,   -1,
   -1,  281,  282,  283,  284,   -1,  286,  287,  288,  289,
   -1,   -1,   -1,   63,  258,  259,  260,   -1,   -1,   -1,
   -1,   -1,   33,  267,   -1,  269,   37,   38,   -1,   -1,
   41,   42,   43,   44,   45,   -1,   47,  281,  282,  283,
  284,   -1,  286,  287,  288,  289,   -1,   -1,   59,   60,
   61,   62,   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,
   -1,   37,   38,   -1,   -1,   41,   42,   43,   44,   45,
   -1,   47,   -1,   -1,   -1,   -1,  126,   -1,   -1,   -1,
   -1,   -1,   93,   59,   60,   61,   62,   -1,   -1,   -1,
   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,   -1,
   41,   37,   43,   44,   45,   -1,   42,   43,   -1,   45,
   -1,   47,   -1,  124,   -1,   -1,   -1,   93,   59,   60,
   61,   62,   -1,   -1,   60,   61,   62,   33,   -1,   -1,
   -1,   -1,   38,   -1,   -1,   41,   -1,   43,   44,   45,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  124,   -1,
   -1,   -1,   93,   59,   60,   61,   62,   -1,   94,   -1,
   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,   -1,
   41,   37,   38,   44,   -1,   -1,   42,   43,   -1,   45,
   -1,   47,   -1,  124,   -1,   -1,   -1,   93,   59,   60,
   61,   62,   -1,   -1,   60,   61,   62,   33,   -1,   -1,
   -1,   -1,   38,   -1,   -1,   41,   -1,   -1,   44,   -1,
   -1,   -1,   -1,  263,  264,  265,   -1,   -1,  124,   -1,
   -1,   -1,   93,   59,   60,   61,   62,   -1,   94,  279,
  280,   -1,   -1,   -1,   33,  285,   -1,   -1,   -1,   38,
  290,  291,   41,   -1,   -1,   44,   -1,  258,  259,  260,
   -1,   -1,   -1,  124,   -1,   -1,  267,   93,  269,   -1,
   59,   60,   61,   62,   -1,   -1,   -1,   -1,   -1,   -1,
  281,  282,  283,  284,   -1,  286,  287,  288,  289,   -1,
   -1,   -1,  258,  259,  260,   -1,   -1,   -1,  124,   -1,
   -1,  267,   -1,  269,   93,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,  281,  282,  283,  284,   -1,
  286,  287,  288,  289,   -1,   -1,   -1,  258,  259,  260,
   -1,   -1,  258,  259,  260,  124,  267,   -1,  269,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
  281,  282,  283,  284,   -1,  286,  287,  288,  289,   -1,
   -1,   -1,  258,  259,  260,   -1,   -1,   -1,   -1,   33,
   -1,  267,   -1,  269,   -1,   -1,   -1,   41,   -1,   -1,
   44,   -1,   -1,   -1,   -1,  281,  282,  283,  284,   -1,
  286,  287,  288,  289,   -1,   59,   -1,  258,  259,  260,
   -1,   -1,  258,  259,  260,   33,  267,   -1,  269,   -1,
   38,   -1,   -1,   41,   -1,   -1,   44,   -1,   -1,   -1,
  281,  282,  283,  284,   -1,  286,  287,  288,  289,   93,
   -1,   59,  258,  259,  260,   -1,   -1,   -1,   -1,   -1,
   -1,  267,   -1,  269,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   38,   -1,   40,  281,  282,  283,  284,   45,
  286,  287,  288,  289,   -1,   93,   -1,   -1,   -1,  258,
  259,  260,   -1,   59,   -1,   -1,   33,   63,  267,   -1,
  269,   38,   -1,   -1,   41,   -1,   -1,   44,   -1,   -1,
   -1,   -1,  281,  282,  283,  284,  124,  286,  287,  288,
  289,   -1,   59,   60,   61,   62,   -1,   -1,   -1,   33,
   -1,   -1,   -1,   -1,   38,   -1,   -1,   41,   -1,   33,
   44,   -1,   -1,   -1,   38,   -1,   -1,   41,   -1,   -1,
   44,   -1,   -1,   -1,   -1,   59,   93,   61,   -1,   -1,
  126,   -1,   -1,   -1,   33,   59,   -1,   61,   -1,   38,
   -1,   -1,   41,   -1,   33,   44,   -1,   -1,   -1,   -1,
   -1,   -1,   41,   -1,   -1,   44,   -1,  124,   -1,   93,
   59,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   93,
   59,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
  124,   -1,   -1,  267,   93,  269,   -1,   -1,   -1,   -1,
  124,   -1,   -1,   -1,   93,   -1,   -1,  281,  282,  283,
  284,   -1,  286,  287,  288,  289,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,  124,   -1,   -1,   -1,  267,
   -1,  269,   -1,   -1,   -1,  124,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,  281,  282,  283,  284,   -1,  286,  287,
  288,  289,   37,   38,   -1,   -1,   -1,   42,   43,   -1,
   45,   -1,   47,   -1,   -1,   -1,   -1,  263,  264,  265,
   -1,  267,   -1,  269,   -1,   60,   61,   62,   -1,   -1,
   -1,   -1,   -1,  279,  280,   -1,   -1,   -1,   -1,  285,
   -1,  258,  259,  260,  290,  291,   -1,   -1,   -1,   -1,
  267,   -1,  269,   -1,   -1,   -1,   -1,   -1,   -1,   94,
   -1,   -1,   -1,   -1,  281,  282,  283,  284,   -1,  286,
  287,  288,  289,   -1,  258,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,  267,  258,  269,   -1,   -1,   -1,  124,
   -1,   -1,   -1,  267,   -1,  269,   -1,  281,  282,  283,
  284,   -1,  286,  287,  288,  289,   -1,  281,  282,  283,
  284,   -1,  286,  287,  288,  289,   -1,   -1,  267,   -1,
  269,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  267,   -1,
  269,   -1,  281,  282,  283,  284,   -1,  286,  287,  288,
  289,   -1,  281,  282,  283,  284,   -1,  286,  287,  288,
  289,   37,   38,   -1,   -1,   -1,   42,   43,   -1,   45,
   -1,   47,   37,   38,   -1,   -1,   -1,   42,   43,   -1,
   45,   -1,   47,   -1,   60,   61,   62,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   60,   61,   62,   -1,   -1,
   -1,   37,   38,   -1,   -1,   -1,   42,   43,   -1,   45,
   -1,   47,   -1,   -1,   -1,   -1,   -1,   -1,   94,   -1,
   -1,   -1,   -1,   -1,   60,   61,   62,   -1,   -1,   94,
   -1,   -1,   -1,  258,  259,  260,   -1,   37,   38,   -1,
   -1,   -1,   42,   43,   -1,   45,   -1,   47,  124,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   94,  124,
   60,   61,   62,  288,   33,   -1,   -1,   -1,   37,   38,
   -1,   -1,   -1,   42,   43,   33,   45,   -1,   47,   37,
   38,   -1,   -1,   -1,   42,   43,   -1,   45,  124,   47,
   59,   60,   61,   62,   94,   -1,   -1,   -1,   -1,   -1,
   -1,   59,   60,   61,   62,   37,   38,   -1,   -1,   41,
   42,   43,   37,   45,   -1,   47,   -1,   42,   43,   -1,
   45,   -1,   47,   -1,  124,   94,   -1,   -1,   60,   61,
   62,   -1,   -1,   37,   38,   60,   94,   62,   42,   43,
   -1,   45,   -1,   47,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,  124,   60,   61,   62,   -1,
   -1,   -1,   94,   -1,   -1,   -1,  124,   -1,   -1,   94,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,  258,  259,  260,   -1,   -1,   -1,   -1,   93,
   94,   -1,  124,  258,  259,  260,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   37,   38,   -1,
   -1,  287,   42,   43,   -1,   45,   -1,   47,   -1,   -1,
  124,  286,  258,  259,  260,   -1,   -1,   -1,   -1,   59,
   60,   61,   62,   -1,   -1,   -1,   -1,   -1,   37,   38,
   -1,   -1,   -1,   42,   43,  281,   45,   -1,   47,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  258,  259,
  260,   60,   61,   62,   94,   -1,   -1,   50,   51,   -1,
   53,   -1,   55,   56,   57,   -1,   -1,   -1,   -1,   -1,
   -1,  281,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  258,
  259,  260,   -1,   -1,  124,   94,   79,   80,   -1,   -1,
  258,  259,  260,   86,   87,   88,   89,   90,   91,   92,
   93,   94,   95,   96,   97,   98,   99,  100,  101,   -1,
   -1,   -1,   -1,   -1,   -1,  124,  258,  259,  260,   -1,
   -1,   -1,   -1,  116,  259,  260,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,  135,   -1,  258,  259,  260,   -1,   -1,   -1,
  143,   -1,  145,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  258,  259,
  260,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  258,
  259,  260,
};
#define YYFINAL 3
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 314
#define YYUNDFTOKEN 350
#define YYTRANSLATE(a) ((a) > YYMAXTOKEN ? YYUNDFTOKEN : (a))
#if YYDEBUG
static const char *const yyname[] = {

"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
"'!'",0,"'#'",0,"'%'","'&'",0,"'('","')'","'*'","'+'","','","'-'",0,"'/'",0,0,0,
0,0,0,0,0,0,0,0,"';'","'<'","'='","'>'","'?'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,"'['",0,"']'","'^'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,"'|'",0,"'~'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"DEF","NE","LE","GE",
"POINTER","UMINUS","NUM","STR","ID","PROGRAM","END","MODULE","START","VOID",
"NUMBER","STRING","ARRAY","CONST","FUNCTION","FORWARD","PUBLIC","RECUR",
"RETURN","IF","THEN","ELSE","ELIF","FI","FOR","UNTIL","STEP","DO","DONE",
"REPEAT","STOP","NIL","DECLS","FHEAD","PROPS","PRIV","TYPE","FBODY","VAR",
"DECLITS","BODY","LITS","INDEX","FUNC","DECVARS","INSTRS","IFBLOCK","FORHEAD",
"FORCHECK","ARRAYID","ARGS","CALL","PRIO","ACCESS",0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"illegal-symbol",
};
static const char *const yyrule[] = {
"$accept : file",
"$$1 :",
"$$2 :",
"file : PROGRAM edecs START $$1 body END $$2",
"file : MODULE edecs END",
"edecs :",
"edecs : decs",
"decs : dec",
"decs : decs ';' dec",
"$$3 :",
"$$4 :",
"dec : FUNCTION equali ftype ID $$3 evars action $$4",
"dec : equali econst var declits",
"equali :",
"equali : quali",
"quali : PUBLIC",
"quali : FORWARD",
"evars :",
"evars : vars",
"vars : var",
"vars : vars ';' var",
"var : type ID",
"var : type ID '[' NUM ']'",
"ftype : type",
"ftype : VOID",
"type : NUMBER",
"type : STRING",
"type : ARRAY",
"action : DONE",
"action : DO body",
"econst :",
"econst : CONST",
"declits :",
"declits : DEF lit lits",
"lits : litsspace",
"lits : ',' litscomma",
"litscomma : lit",
"litscomma : litscomma ',' lit",
"litsspace :",
"litsspace : litsspace lit",
"lit : NUM",
"lit : STR",
"body : bvar einstrs",
"bvar :",
"bvar : bvar var ';'",
"einstrs : instraux rets",
"instraux :",
"instraux : instraux instr",
"instr : IF expr THEN einstrs elif else FI",
"instr : FOR expr UNTIL expr STEP expr DO einstrs DONE",
"instr : expr ';'",
"instr : expr '!'",
"instr : leftv '#' expr ';'",
"rets :",
"rets : REPEAT",
"rets : STOP",
"rets : RETURN eexpr",
"elif :",
"elif : elif ELIF expr THEN einstrs",
"else :",
"else : ELSE einstrs",
"eexpr :",
"eexpr : expr",
"leftv : ID",
"leftv : ID '[' expr ']'",
"args : expr",
"args : args ',' expr",
"expr : lit litsspace",
"expr : leftv",
"expr : ID '(' args ')'",
"expr : '(' expr ')'",
"expr : '?'",
"expr : '&' leftv",
"expr : '-' expr",
"expr : expr '^' expr",
"expr : expr '*' expr",
"expr : expr '/' expr",
"expr : expr '%' expr",
"expr : expr '+' expr",
"expr : expr '-' expr",
"expr : expr '<' expr",
"expr : expr '>' expr",
"expr : expr LE expr",
"expr : expr GE expr",
"expr : expr '=' expr",
"expr : expr NE expr",
"expr : '~' expr",
"expr : expr '&' expr",
"expr : expr '|' expr",
"expr : leftv DEF expr",

};
#endif

int      yydebug;
int      yynerrs;

int      yyerrflag;
int      yychar;
YYSTYPE  yyval;
YYSTYPE  yylval;

/* define the initial stack-sizes */
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH  YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 10000
#define YYMAXDEPTH  10000
#endif
#endif

#define YYINITSTACKSIZE 200

typedef struct {
    unsigned stacksize;
    YYINT    *s_base;
    YYINT    *s_mark;
    YYINT    *s_last;
    YYSTYPE  *l_base;
    YYSTYPE  *l_mark;
} YYSTACKDATA;
/* variables for the parser stack */
static YYSTACKDATA yystack;
#line 248 "gram.y"
char **yynames =
#if YYDEBUG > 0
    (char**)yyname;
#else
    0;
#endif

void entity(char *name, int ret_type, void* args, int vf, int typ, int qual, int cons, int rec) {
    int tempType = IDfind(name, (void**)IDtest);

    if (rec == 1 && tempType != -1 && !EQUALQUALI(MASKQUALI(tempType), FORWARD))
        yyerror("Can't redefine a non-forward type entity.");

    if (rec == 1) {
        if (tempType == -1) IDnew(MASK(1, typ, qual, 0, 1), name, 0);
        else IDreplace(MASK(1, typ, qual, 0, 1), name, 0);
        return;
    }
    if (ret_type == -1 && !EQUALQUALI(qual, FORWARD) && (vf == 1 || vf == 0 && cons == 1))
        yyerror("Unable to define uninitialized non-forward entity.");

    if (ret_type != -1 && EQUALQUALI(qual, FORWARD)) yyerror("Can't initialize forward entity.");

    if (tempType == -1 && vf == 0) IDnew(MASK(0, typ, qual, cons, 0), name, args);

    if (EQUALQUALI(MASKQUALI(tempType), FORWARD) || MASKREC(tempType)) {
        IDreplace(MASK(vf, typ, qual, cons, 0), name, args);
    }

    if (EQUALQUALI(typ, ARRAY) && ret_type != -1 &&  *((long*) args) <= 0) yyerror("Array initialized without dimension.");

    if (ret_type != -1 && !EQUALTYPE(typ, ret_type) && !(EQUALTYPE(typ, ARRAY) && EQUALTYPE(ret_type, NUMBER)))
        yyerror("Entity type not equal to return/assignment type.");
}

void checkAssign(char* name, int t1, int t2, long place) {
    int mask = IDfind(name, 0);
    if (MASKENTITY(mask)) yyerror("Can't assign a value to a function call.");
    if (MASKCONST(mask)) yyerror("Can't assign values to constant.");
    if (!EQUALTYPE(t1, t2) && place != 0) yyerror("Assignment with incompatible types.");
}
#line 783 "y.tab.c"

#if YYDEBUG
#include <stdio.h>		/* needed for printf */
#endif

#include <stdlib.h>	/* needed for malloc, etc */
#include <string.h>	/* needed for memset */

/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack(YYSTACKDATA *data)
{
    int i;
    unsigned newsize;
    YYINT *newss;
    YYSTYPE *newvs;

    if ((newsize = data->stacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return YYENOMEM;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;

    i = (int) (data->s_mark - data->s_base);
    newss = (YYINT *)realloc(data->s_base, newsize * sizeof(*newss));
    if (newss == 0)
        return YYENOMEM;

    data->s_base = newss;
    data->s_mark = newss + i;

    newvs = (YYSTYPE *)realloc(data->l_base, newsize * sizeof(*newvs));
    if (newvs == 0)
        return YYENOMEM;

    data->l_base = newvs;
    data->l_mark = newvs + i;

    data->stacksize = newsize;
    data->s_last = data->s_base + newsize - 1;
    return 0;
}

#if YYPURE || defined(YY_NO_LEAKS)
static void yyfreestack(YYSTACKDATA *data)
{
    free(data->s_base);
    free(data->l_base);
    memset(data, 0, sizeof(*data));
}
#else
#define yyfreestack(data) /* nothing */
#endif

#define YYABORT  goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR  goto yyerrlab

int
YYPARSE_DECL()
{
    int yym, yyn, yystate;
#if YYDEBUG
    const char *yys;

    if ((yys = getenv("YYDEBUG")) != 0)
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = YYEMPTY;
    yystate = 0;

#if YYPURE
    memset(&yystack, 0, sizeof(yystack));
#endif

    if (yystack.s_base == NULL && yygrowstack(&yystack) == YYENOMEM) goto yyoverflow;
    yystack.s_mark = yystack.s_base;
    yystack.l_mark = yystack.l_base;
    yystate = 0;
    *yystack.s_mark = 0;

yyloop:
    if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
        {
            goto yyoverflow;
        }
        yystate = yytable[yyn];
        *++yystack.s_mark = yytable[yyn];
        *++yystack.l_mark = yylval;
        yychar = YYEMPTY;
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;

    YYERROR_CALL("syntax error");

    goto yyerrlab;

yyerrlab:
    ++yynerrs;

yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yystack.s_mark]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yystack.s_mark, yytable[yyn]);
#endif
                if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
                {
                    goto yyoverflow;
                }
                yystate = yytable[yyn];
                *++yystack.s_mark = yytable[yyn];
                *++yystack.l_mark = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yystack.s_mark);
#endif
                if (yystack.s_mark <= yystack.s_base) goto yyabort;
                --yystack.s_mark;
                --yystack.l_mark;
            }
        }
    }
    else
    {
        if (yychar == YYEOF) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = YYEMPTY;
        goto yyloop;
    }

yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    if (yym)
        yyval = yystack.l_mark[1-yym];
    else
        memset(&yyval, 0, sizeof yyval);
    switch (yyn)
    {
case 1:
#line 62 "gram.y"
	{ IDpush(); }
break;
case 2:
#line 62 "gram.y"
	{ IDpop(); }
break;
case 3:
#line 62 "gram.y"
	{ printNode(binNode(PROGRAM, yystack.l_mark[-5].n, yystack.l_mark[-2].n), 0, (char**) yynames); }
break;
case 4:
#line 63 "gram.y"
	{ printNode(uniNode(MODULE, yystack.l_mark[-1].n), 0, (char**) yynames); }
break;
case 5:
#line 65 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 6:
#line 66 "gram.y"
	{ yyval.n = yystack.l_mark[0].n ; }
break;
case 7:
#line 68 "gram.y"
	{ yyval.n = binNode(DECLS, nilNode(NIL), yystack.l_mark[0].n); }
break;
case 8:
#line 69 "gram.y"
	{ yyval.n = binNode(DECLS, yystack.l_mark[-2].n, yystack.l_mark[0].n); }
break;
case 9:
#line 71 "gram.y"
	{ entity(yystack.l_mark[0].s, -1, 0, 1, yystack.l_mark[-1].i, yystack.l_mark[-2].i, 0, 1); IDpush(); }
break;
case 10:
#line 71 "gram.y"
	{ IDpop(); }
break;
case 11:
#line 72 "gram.y"
	{
                    yyval.n = binNode(FUNCTION,
                  	              binNode(FHEAD, intNode(yystack.l_mark[-6].i, yystack.l_mark[-5].i), strNode(FUNC, yystack.l_mark[-4].s)),
                  	              binNode(FBODY, yystack.l_mark[-2].n, yystack.l_mark[-1].n));
                    entity(yystack.l_mark[-4].s, yystack.l_mark[-1].n->info, yystack.l_mark[-2].n, 1, yystack.l_mark[-5].i, yystack.l_mark[-6].i, 0, 0);
                }
break;
case 12:
#line 79 "gram.y"
	{
                    yyval.n = binNode(VAR,
                    				binNode(PROPS, intNode(PRIV, yystack.l_mark[-3].i), intNode(CONST, yystack.l_mark[-2].i)),
                    				binNode(DECLITS, yystack.l_mark[-1].n, yystack.l_mark[0].n));
                    entity(yystack.l_mark[-1].n->user, yystack.l_mark[0].n->info, &(yystack.l_mark[-1].n->place), 0, yystack.l_mark[-1].n->info, yystack.l_mark[-3].i, yystack.l_mark[-2].i, 0);
                }
break;
case 13:
#line 86 "gram.y"
	{ yyval.i = FUNCTION; }
break;
case 14:
#line 87 "gram.y"
	{ yyval.i = yystack.l_mark[0].i; }
break;
case 15:
#line 89 "gram.y"
	{ yyval.i = PUBLIC; }
break;
case 16:
#line 90 "gram.y"
	{ yyval.i = FORWARD; }
break;
case 17:
#line 92 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 18:
#line 93 "gram.y"
	{ yyval.n = yystack.l_mark[0].n; }
break;
case 19:
#line 95 "gram.y"
	{ yyval.n = binNode(DECVARS, nilNode(NIL), yystack.l_mark[0].n); IDnew(MASK(0, yystack.l_mark[0].n->info, 0, 0, 0), yystack.l_mark[0].n->user, 0); }
break;
case 20:
#line 96 "gram.y"
	{ yyval.n = binNode(DECVARS, yystack.l_mark[-2].n, yystack.l_mark[0].n); IDnew(MASK(0, yystack.l_mark[0].n->info, 0, 0, 0), yystack.l_mark[0].n->user, 0); }
break;
case 21:
#line 98 "gram.y"
	{ yyval.n = strNode(CODETYPE(yystack.l_mark[-1].i), yystack.l_mark[0].s);
                                                              yyval.n->user = yystack.l_mark[0].s;
                                                              yyval.n->info = yystack.l_mark[-1].i; }
break;
case 22:
#line 102 "gram.y"
	{
                    if (!EQUALTYPE(yystack.l_mark[-4].i, ARRAY))
                        yyerror("Non-array type variables can't be scaled.");
				    yyval.n = binNode(ARRAY,
                                    strNode(ID, yystack.l_mark[-3].s),
                                    intNode(INDEX, yystack.l_mark[-1].i));
                    yyval.n->user = yystack.l_mark[-3].s;
                    yyval.n->info = ARRAY;
                    yyval.n->place = yystack.l_mark[-1].i;
                 }
break;
case 23:
#line 113 "gram.y"
	{ yyval.i = yystack.l_mark[0].i; }
break;
case 24:
#line 114 "gram.y"
	{ yyval.i = VOID; }
break;
case 25:
#line 116 "gram.y"
	{ yyval.i = NUMBER; }
break;
case 26:
#line 117 "gram.y"
	{ yyval.i = STRING; }
break;
case 27:
#line 118 "gram.y"
	{ yyval.i = ARRAY; }
break;
case 28:
#line 120 "gram.y"
	{ yyval.n = uniNode(BODY, nilNode(NIL)); }
break;
case 29:
#line 121 "gram.y"
	{ yyval.n = uniNode(BODY, yystack.l_mark[0].n); yyval.n->info = yystack.l_mark[0].n->info; }
break;
case 30:
#line 123 "gram.y"
	{ yyval.i = 0; }
break;
case 31:
#line 124 "gram.y"
	{ yyval.i = 1; }
break;
case 32:
#line 126 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 33:
#line 127 "gram.y"
	{ yyval.n = binNode(LITS, yystack.l_mark[-1].n, yystack.l_mark[0].n);
     												          if (yystack.l_mark[0].n->info == -1) yyval.n->info = yystack.l_mark[-1].n->info;
                                                              else yyval.n->info = yystack.l_mark[0].n->info; }
break;
case 34:
#line 131 "gram.y"
	{ yyval.n = yystack.l_mark[0].n; yyval.n->info = yystack.l_mark[0].n->info; }
break;
case 35:
#line 132 "gram.y"
	{ yyval.n = yystack.l_mark[0].n; yyval.n->info = ARRAY; }
break;
case 36:
#line 134 "gram.y"
	{ yyval.n = binNode(LITS, nilNode(NIL), yystack.l_mark[0].n); }
break;
case 37:
#line 135 "gram.y"
	{ yyval.n = binNode(LITS, yystack.l_mark[-2].n, yystack.l_mark[0].n); }
break;
case 38:
#line 137 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 39:
#line 138 "gram.y"
	{ yyval.n = binNode(LITS, yystack.l_mark[-1].n, yystack.l_mark[0].n); yyval.n->info = STRING; }
break;
case 40:
#line 140 "gram.y"
	{ yyval.n = intNode(NUM, yystack.l_mark[0].i); yyval.n->info = NUMBER; if (!yystack.l_mark[0].i) yyval.n->place = 0; }
break;
case 41:
#line 141 "gram.y"
	{ yyval.n = strNode(STR, yystack.l_mark[0].s); yyval.n->info = STRING; }
break;
case 42:
#line 143 "gram.y"
	{ yyval.n = binNode(BODY, yystack.l_mark[-1].n, yystack.l_mark[0].n); yyval.n->info = yystack.l_mark[0].n->info; }
break;
case 43:
#line 145 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 44:
#line 146 "gram.y"
	{ yyval.n = binNode(DECVARS, yystack.l_mark[-2].n, yystack.l_mark[-1].n); IDnew(MASK(0, yystack.l_mark[-1].n->info, 0, 0, 0), yystack.l_mark[-1].n->user, 0); }
break;
case 45:
#line 148 "gram.y"
	{ yyval.n = binNode(INSTRS, yystack.l_mark[-1].n, yystack.l_mark[0].n); yyval.n->info = yystack.l_mark[0].n->info; }
break;
case 46:
#line 150 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 47:
#line 151 "gram.y"
	{ yyval.n = binNode(INSTRS, yystack.l_mark[-1].n, yystack.l_mark[0].n); }
break;
case 48:
#line 153 "gram.y"
	{ yyval.n = binNode(IFBLOCK, binNode(IF, yystack.l_mark[-5].n, yystack.l_mark[-3].n), binNode(IFBLOCK, yystack.l_mark[-2].n, yystack.l_mark[-1].n)); if (EQUALTYPE(yystack.l_mark[-5].n->info, VOID)) yyerror("if condition empty (void).");}
break;
case 49:
#line 154 "gram.y"
	{ yyval.n = binNode(FOR, binNode(FORHEAD, yystack.l_mark[-7].n, binNode(FORCHECK, yystack.l_mark[-5].n, yystack.l_mark[-3].n)), yystack.l_mark[-1].n); if (!EQUALTYPE(yystack.l_mark[-5].n->info, NUMBER)) yyerror("'until' expression must result in a number."); }
break;
case 50:
#line 155 "gram.y"
	{ yyval.n = uniNode(';', yystack.l_mark[-1].n); }
break;
case 51:
#line 156 "gram.y"
	{ yyval.n = uniNode('!', yystack.l_mark[-1].n); }
break;
case 52:
#line 157 "gram.y"
	{ yyval.n = binNode('#', yystack.l_mark[-3].n, yystack.l_mark[-1].n);
                                                              int mask = IDfind(yystack.l_mark[-3].n->user, 0);
                                                              if(EQUALTYPE(yystack.l_mark[-3].n->info, NUMBER) || !EQUALTYPE(yystack.l_mark[-1].n->info, NUMBER) || MASKCONST(mask))
                                                                yyerror("Allocating a number variable or non-number len.");
                                                            }
break;
case 53:
#line 163 "gram.y"
	{ yyval.n = nilNode(NIL); yyval.n->info = 0; }
break;
case 54:
#line 164 "gram.y"
	{ yyval.n = nilNode(REPEAT); }
break;
case 55:
#line 165 "gram.y"
	{ yyval.n = nilNode(STOP); }
break;
case 56:
#line 166 "gram.y"
	{ yyval.n = uniNode(RETURN, yystack.l_mark[0].n); yyval.n->info = yystack.l_mark[0].n->info; }
break;
case 57:
#line 168 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 58:
#line 169 "gram.y"
	{ yyval.n = binNode(IFBLOCK, yystack.l_mark[-4].n, binNode(ELIF, yystack.l_mark[-2].n, yystack.l_mark[0].n)); if (EQUALTYPE(yystack.l_mark[-2].n->info, VOID)) yyerror("elif condition empty (void).");  }
break;
case 59:
#line 171 "gram.y"
	{ yyval.n = nilNode(NIL); }
break;
case 60:
#line 172 "gram.y"
	{ yyval.n = uniNode(ELSE, yystack.l_mark[0].n); }
break;
case 61:
#line 174 "gram.y"
	{ yyval.n = nilNode(NIL); yyval.n->info = 0;}
break;
case 62:
#line 175 "gram.y"
	{ yyval.n = yystack.l_mark[0].n; }
break;
case 63:
#line 177 "gram.y"
	{ yyval.n = strNode(ID, yystack.l_mark[0].s); yyval.n->info = MASKTYPE(IDfind(yystack.l_mark[0].s, 0)); yyval.n->user = yystack.l_mark[0].s; }
break;
case 64:
#line 178 "gram.y"
	{ yyval.n = binNode(ACCESS, strNode(ID, yystack.l_mark[-3].s), yystack.l_mark[-1].n);
                                                              if (EQUALTYPE(MASKTYPE(IDfind(yystack.l_mark[-3].s, 0)), NUMBER)) yyerror("Can't index number type variable.");
                                                              if(!EQUALTYPE(yystack.l_mark[-1].n->info, NUMBER)) yyerror("Index not a number.");
                                                              yyval.n->info = NUMBER;
                                                              yyval.n->user = yystack.l_mark[-3].s; }
break;
case 65:
#line 184 "gram.y"
	{ yyval.n = yystack.l_mark[0].n; }
break;
case 66:
#line 185 "gram.y"
	{ yyval.n = binNode(ARGS, yystack.l_mark[-2].n, yystack.l_mark[0].n); }
break;
case 67:
#line 187 "gram.y"
	{ yyval.n = binNode(LITS, yystack.l_mark[-1].n, yystack.l_mark[0].n); if (yystack.l_mark[0].n->info == -1) { yyval.n->info = yystack.l_mark[-1].n->info; yyval.n->place = yystack.l_mark[-1].n->place; } else yyval.n->info = yystack.l_mark[0].n->info; }
break;
case 68:
#line 188 "gram.y"
	{ yyval.n = yystack.l_mark[0].n; }
break;
case 69:
#line 189 "gram.y"
	{ yyval.n = binNode(CALL, strNode(ID, yystack.l_mark[-3].s), yystack.l_mark[-1].n); int mask = IDfind(yystack.l_mark[-3].s, 0); if(!MASKENTITY(mask)) yyerror("Not a function to call."); yyval.n->info = MASKTYPE(mask); }
break;
case 70:
#line 190 "gram.y"
	{ yyval.n = uniNode(PRIO, yystack.l_mark[-1].n); yyval.n->info = yystack.l_mark[-1].n->info; }
break;
case 71:
#line 191 "gram.y"
	{ yyval.n = nilNode('?');  yyval.n->info = NUMBER; }
break;
case 72:
#line 192 "gram.y"
	{ yyval.n = uniNode(POINTER, yystack.l_mark[0].n);
                                              if(!EQUALTYPE(yystack.l_mark[0].n->info, NUMBER)) yyerror("Can only get addresses of numbers.");
                                              yyval.n->info = ARRAY; }
break;
case 73:
#line 195 "gram.y"
	{ yyval.n = uniNode(UMINUS, yystack.l_mark[0].n);
                                              if (!EQUALTYPE(yystack.l_mark[0].n->info, NUMBER)) yyerror("Can only negate numbers.");
                                              yyval.n->info = NUMBER; }
break;
case 74:
#line 198 "gram.y"
	{ yyval.n = binNode('^', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER)) yyerror("'^' only supports numbers.");
                                              yyval.n->info = NUMBER; }
break;
case 75:
#line 201 "gram.y"
	{ yyval.n = binNode('*', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER)) yyerror("'*' only supports numbers.");
                                              yyval.n->info = NUMBER; }
break;
case 76:
#line 204 "gram.y"
	{ yyval.n = binNode('/', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER)) yyerror("'/' only supports numbers.");
                                              yyval.n->info = NUMBER; }
break;
case 77:
#line 207 "gram.y"
	{ yyval.n = binNode('%', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER)) yyerror("'%' only supports numbers.");
                                              yyval.n->info = NUMBER; }
break;
case 78:
#line 210 "gram.y"
	{ yyval.n = binNode('+', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (ONETYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING) || BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, ARRAY))
                                                yyerror("'+' only supports numbers and one array.");
                                              yyval.n->info = ONETYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, ARRAY) ? ARRAY : NUMBER; }
break;
case 79:
#line 214 "gram.y"
	{ yyval.n = binNode('-', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (ONETYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING)) yyerror("'-' doesn't support strings.");
                                              yyval.n->info = (ONETYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, ARRAY) && !BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, ARRAY)) ? ARRAY : NUMBER; }
break;
case 80:
#line 217 "gram.y"
	{ yyval.n = binNode('<', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER) && !BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING))
                                                yyerror("'<' only supports two numbers or two strings."); yyval.n->info = NUMBER; }
break;
case 81:
#line 220 "gram.y"
	{ yyval.n = binNode('>', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER) && !BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING))
                                                yyerror("'>' only supports two numbers or two strings."); yyval.n->info = NUMBER; }
break;
case 82:
#line 223 "gram.y"
	{ yyval.n = binNode(LE, yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER) && !BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING))
                                                yyerror("'<=' only supports two numbers or two strings."); yyval.n->info = NUMBER; }
break;
case 83:
#line 226 "gram.y"
	{ yyval.n = binNode(GE, yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER) && !BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING))
                                                yyerror("'>=' only supports two numbers or two strings."); yyval.n->info = NUMBER; }
break;
case 84:
#line 229 "gram.y"
	{ yyval.n = binNode('=', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER) && !BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING))
                                                yyerror("'=' only supports two numbers or two strings."); yyval.n->info = NUMBER; }
break;
case 85:
#line 232 "gram.y"
	{ yyval.n = binNode(NE, yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER) && !BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, STRING))
                                                yyerror("'~=' only supports two numbers or two strings."); yyval.n->info = NUMBER; }
break;
case 86:
#line 235 "gram.y"
	{ yyval.n = uniNode('~', yystack.l_mark[0].n);
                                              if (!EQUALTYPE(yystack.l_mark[0].n->info, NUMBER)) yyerror("'~' only supports one number.");
                                              yyval.n->info = NUMBER; }
break;
case 87:
#line 238 "gram.y"
	{ yyval.n = binNode('&', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER)) yyerror("'&' only supports numbers.");
                                              yyval.n->info = NUMBER; }
break;
case 88:
#line 241 "gram.y"
	{ yyval.n = binNode('|', yystack.l_mark[-2].n, yystack.l_mark[0].n);
                                              if (!BOTHTYPE(yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, NUMBER)) yyerror("'|' only supports numbers.");
                                              yyval.n->info = NUMBER; }
break;
case 89:
#line 244 "gram.y"
	{ yyval.n = binNode(DEF, yystack.l_mark[-2].n, yystack.l_mark[0].n); checkAssign(yystack.l_mark[-2].n->user, yystack.l_mark[-2].n->info, yystack.l_mark[0].n->info, yystack.l_mark[0].n->place); yyval.n->info = yystack.l_mark[-2].n->info; }
break;
#line 1407 "y.tab.c"
    }
    yystack.s_mark -= yym;
    yystate = *yystack.s_mark;
    yystack.l_mark -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yystack.s_mark = YYFINAL;
        *++yystack.l_mark = yyval;
        if (yychar < 0)
        {
            if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
            if (yydebug)
            {
                yys = yyname[YYTRANSLATE(yychar)];
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == YYEOF) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yystack.s_mark, yystate);
#endif
    if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
    {
        goto yyoverflow;
    }
    *++yystack.s_mark = (YYINT) yystate;
    *++yystack.l_mark = yyval;
    goto yyloop;

yyoverflow:
    YYERROR_CALL("yacc stack overflow");

yyabort:
    yyfreestack(&yystack);
    return (1);

yyaccept:
    yyfreestack(&yystack);
    return (0);
}
