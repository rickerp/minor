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
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union { int i; char *s; Node *n; } YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
