%{
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
%}
%union { int i; char *s; Node *n; }

%left       DEF '#'
%left       '|'
%left       '&'
%nonassoc   '~'
%left       NE '='
%left       '<' '>' LE GE
%left       '+' '-'
%left       '*' '/' '%'
%right 	    '^'
%nonassoc   POINTER UMINUS '?'
%nonassoc   '(' ')' '[' ']'

%token<i> NUM
%token<s> STR ID
%token PROGRAM END MODULE START
%token VOID NUMBER STRING ARRAY CONST
%token FUNCTION FORWARD PUBLIC RECUR RETURN
%token IF THEN ELSE ELIF FI
%token FOR UNTIL STEP DO DONE REPEAT STOP

%type<n> edecs decs dec evars vars var action declits lits litscomma litsspace lit
%type<n> body bvar einstrs instraux instr rets elif else eexpr leftv args expr
%type<i> equali quali ftype type econst
%token NIL DECLS FHEAD PROPS PRIV TYPE FBODY VAR DECLITS BODY LITS INDEX FUNC
%token DECVARS INSTRS IFBLOCK FORHEAD FORCHECK ARRAYID ARGS CALL PRIO ACCESS
%%

file 		: PROGRAM edecs START { IDpush(); } body END    { IDpop(); } { printNode(binNode(PROGRAM, $2, $5), 0, (char**) yynames); }
     		| MODULE edecs END							    { printNode(uniNode(MODULE, $2), 0, (char**) yynames); }
     		;
edecs 		: 											    { $$ = nilNode(NIL); }
       		| decs										    { $$ = $1 ; }
            ;
decs 		: dec                                           { $$ = binNode(DECLS, nilNode(NIL), $1); }
      		| decs ';' dec                                  { $$ = binNode(DECLS, $1, $3); }
            ;
dec 		: FUNCTION equali ftype ID { entity($4, -1, 0, 1, $3, $2, 0, 1); IDpush(); } evars action { IDpop(); }
                {
                    $$ = binNode(FUNCTION,
                  	              binNode(FHEAD, intNode($2, $3), strNode(FUNC, $4)),
                  	              binNode(FBODY, $6, $7));
                    entity($4, $7->info, $6, 1, $3, $2, 0, 0);
                }
     		| equali econst var declits
                {
                    $$ = binNode(VAR,
                    				binNode(PROPS, intNode(PRIV, $1), intNode(CONST, $2)),
                    				binNode(DECLITS, $3, $4));
                    entity($3->user, $4->info, &($3->place), 0, $3->info, $1, $2, 0);
                }
            ;
equali 		:                                               { $$ = FUNCTION; }
     	    | quali                                         { $$ = $1; }
            ;
quali 		: PUBLIC                                        { $$ = PUBLIC; }
            | FORWARD                                       { $$ = FORWARD; }
            ;
evars 		:                                               { $$ = nilNode(NIL); }
            | vars                                          { $$ = $1; }
            ;
vars 		: var                                           { $$ = binNode(DECVARS, nilNode(NIL), $1); IDnew(MASK(0, $1->info, 0, 0, 0), $1->user, 0); }
       		| vars ';' var                                  { $$ = binNode(DECVARS, $1, $3); IDnew(MASK(0, $3->info, 0, 0, 0), $3->user, 0); }
            ;
var 		: type ID                                       { $$ = strNode(CODETYPE($1), $2);
                                                              $$->user = $2;
                                                              $$->info = $1; }
      		| type ID '[' NUM ']'
                {
                    if (!EQUALTYPE($1, ARRAY))
                        yyerror("Non-array type variables can't be scaled.");
				    $$ = binNode(ARRAY,
                                    strNode(ID, $2),
                                    intNode(INDEX, $4));
                    $$->user = $2;
                    $$->info = ARRAY;
                    $$->place = $4;
                 }
            ;
ftype 		: type 											{ $$ = $1; }
            | VOID                                          { $$ = VOID; }
            ;
type 		: NUMBER                                        { $$ = NUMBER; }
       		| STRING                                        { $$ = STRING; }
            | ARRAY                                         { $$ = ARRAY; }
            ;
action 		: DONE                                          { $$ = uniNode(BODY, nilNode(NIL)); }
     	    | DO body                                       { $$ = uniNode(BODY, $2); $$->info = $2->info; }
            ;
econst 		:                                               { $$ = 0; }
     	    | CONST                                         { $$ = 1; }
            ;
declits 	:                                               { $$ = nilNode(NIL); }
     	    | DEF lit lits                                  { $$ = binNode(LITS, $2, $3);
     												          if ($3->info == -1) $$->info = $2->info;
                                                              else $$->info = $3->info; }
            ;
lits 		: litsspace                                     { $$ = $1; $$->info = $1->info; }
       		| ',' litscomma                                 { $$ = $2; $$->info = ARRAY; }
            ;
litscomma 	: lit                                           { $$ = binNode(LITS, nilNode(NIL), $1); }
       	    | litscomma ',' lit                             { $$ = binNode(LITS, $1, $3); }
            ;
litsspace 	:                                               { $$ = nilNode(NIL); }
      	    | litsspace lit                                 { $$ = binNode(LITS, $1, $2); $$->info = STRING; }
            ;
lit 		: NUM                                           { $$ = intNode(NUM, $1); $$->info = NUMBER; if (!$1) $$->place = 0; }
      		| STR                                           { $$ = strNode(STR, $1); $$->info = STRING; }
            ;
body 		: bvar einstrs                                  { $$ = binNode(BODY, $1, $2); $$->info = $2->info; }
       		;
bvar 		:                                               { $$ = nilNode(NIL); }
       		| bvar var ';'                                  { $$ = binNode(DECVARS, $1, $2); IDnew(MASK(0, $2->info, 0, 0, 0), $2->user, 0); }
            ;
einstrs 	: instraux rets                                 { $$ = binNode(INSTRS, $1, $2); $$->info = $2->info; }
     	    ;
instraux 	:                                               { $$ = nilNode(NIL); }
      	    | instraux instr                                { $$ = binNode(INSTRS, $1, $2); }
            ;
instr 		: IF expr THEN einstrs elif else FI             { $$ = binNode(IFBLOCK, binNode(IF, $2, $4), binNode(IFBLOCK, $5, $6)); if (EQUALTYPE($2->info, VOID)) yyerror("if condition empty (void).");}
      		| FOR expr UNTIL expr STEP expr DO einstrs DONE { $$ = binNode(FOR, binNode(FORHEAD, $2, binNode(FORCHECK, $4, $6)), $8); if (!EQUALTYPE($4->info, NUMBER)) yyerror("'until' expression must result in a number."); }
      		| expr ';'                                      { $$ = uniNode(';', $1); }
      		| expr '!'                                      { $$ = uniNode('!', $1); }
      		| leftv '#' expr ';' /* malloc */               { $$ = binNode('#', $1, $3);
                                                              int mask = IDfind($1->user, 0);
                                                              if(EQUALTYPE($1->info, NUMBER) || !EQUALTYPE($3->info, NUMBER) || MASKCONST(mask))
                                                                yyerror("Allocating a number variable or non-number len.");
                                                            }
      		;
rets 		:                                               { $$ = nilNode(NIL); $$->info = 0; }
       		| REPEAT                                        { $$ = nilNode(REPEAT); }
            | STOP                                          { $$ = nilNode(STOP); }
            | RETURN eexpr                                  { $$ = uniNode(RETURN, $2); $$->info = $2->info; }
            ;
elif 		:                                               { $$ = nilNode(NIL); }
       		| elif ELIF expr THEN einstrs                   { $$ = binNode(IFBLOCK, $1, binNode(ELIF, $3, $5)); if (EQUALTYPE($3->info, VOID)) yyerror("elif condition empty (void).");  }
            ;
else 		:                                               { $$ = nilNode(NIL); }
       		| ELSE einstrs                                  { $$ = uniNode(ELSE, $2); }
            ;
eexpr 		:                                               { $$ = nilNode(NIL); $$->info = 0;}
            | expr                                          { $$ = $1; }
            ;
leftv 		: ID                                            { $$ = strNode(ID, $1); $$->info = MASKTYPE(IDfind($1, 0)); $$->user = $1; }
            | ID '[' expr ']'                               { $$ = binNode(ACCESS, strNode(ID, $1), $3);
                                                              if (EQUALTYPE(MASKTYPE(IDfind($1, 0)), NUMBER)) yyerror("Can't index number type variable.");
                                                              if(!EQUALTYPE($3->info, NUMBER)) yyerror("Index not a number.");
                                                              $$->info = NUMBER;
                                                              $$->user = $1; }
            ;
args 		: expr                                          { $$ = $1; }
       		| args ',' expr                                 { $$ = binNode(ARGS, $1, $3); }
            ;
expr 		: lit litsspace            		{ $$ = binNode(LITS, $1, $2); if ($2->info == -1) { $$->info = $1->info; $$->place = $1->place; } else $$->info = $2->info; }
     		| leftv                    		{ $$ = $1; }
     		| ID '(' args ')'          		{ $$ = binNode(CALL, strNode(ID, $1), $3); int mask = IDfind($1, 0); if(!MASKENTITY(mask)) yyerror("Not a function to call."); $$->info = MASKTYPE(mask); }   /* ?????'' chamada de uma funcao previamente decladrada ou defenida */
     		| '(' expr ')'             		{ $$ = uniNode(PRIO, $2); $$->info = $2->info; } /* altera a prioridade dos operadores (?) */
     		| '?'                      		{ $$ = nilNode('?');  $$->info = NUMBER; } /* scanf */
     		| '&' leftv %prec POINTER  		{ $$ = uniNode(POINTER, $2);
                                              if(!EQUALTYPE($2->info, NUMBER)) yyerror("Can only get addresses of numbers.");
                                              $$->info = ARRAY; } /* ??? TO DO */
         	| '-' expr %prec UMINUS    		{ $$ = uniNode(UMINUS, $2);
                                              if (!EQUALTYPE($2->info, NUMBER)) yyerror("Can only negate numbers.");
                                              $$->info = NUMBER; }    /* no enunciado diz so valores inteiros (?) */
     		| expr '^' expr            		{ $$ = binNode('^', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER)) yyerror("'^' only supports numbers.");
                                              $$->info = NUMBER; }
     		| expr '*' expr            		{ $$ = binNode('*', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER)) yyerror("'*' only supports numbers.");
                                              $$->info = NUMBER; }
            | expr '/' expr            		{ $$ = binNode('/', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER)) yyerror("'/' only supports numbers.");
                                              $$->info = NUMBER; }
            | expr '%' expr            		{ $$ = binNode('%', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER)) yyerror("'%' only supports numbers.");
                                              $$->info = NUMBER; }
     		| expr '+' expr            		{ $$ = binNode('+', $1, $3);
                                              if (ONETYPE($1->info, $3->info, STRING) || BOTHTYPE($1->info, $3->info, ARRAY))
                                                yyerror("'+' only supports numbers and one array.");
                                              $$->info = ONETYPE($1->info, $3->info, ARRAY) ? ARRAY : NUMBER; }
     		| expr '-' expr            		{ $$ = binNode('-', $1, $3);
                                              if (ONETYPE($1->info, $3->info, STRING)) yyerror("'-' doesn't support strings.");
                                              $$->info = (ONETYPE($1->info, $3->info, ARRAY) && !BOTHTYPE($1->info, $3->info, ARRAY)) ? ARRAY : NUMBER; }
     		| expr '<' expr            		{ $$ = binNode('<', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER) && !BOTHTYPE($1->info, $3->info, STRING))
                                                yyerror("'<' only supports two numbers or two strings."); $$->info = NUMBER; }
     		| expr '>' expr            		{ $$ = binNode('>', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER) && !BOTHTYPE($1->info, $3->info, STRING))
                                                yyerror("'>' only supports two numbers or two strings."); $$->info = NUMBER; }
     		| expr LE expr             		{ $$ = binNode(LE, $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER) && !BOTHTYPE($1->info, $3->info, STRING))
                                                yyerror("'<=' only supports two numbers or two strings."); $$->info = NUMBER; }
     		| expr GE expr             		{ $$ = binNode(GE, $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER) && !BOTHTYPE($1->info, $3->info, STRING))
                                                yyerror("'>=' only supports two numbers or two strings."); $$->info = NUMBER; }
     		| expr '=' expr            		{ $$ = binNode('=', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER) && !BOTHTYPE($1->info, $3->info, STRING))
                                                yyerror("'=' only supports two numbers or two strings."); $$->info = NUMBER; }
     		| expr NE expr             		{ $$ = binNode(NE, $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER) && !BOTHTYPE($1->info, $3->info, STRING))
                                                yyerror("'~=' only supports two numbers or two strings."); $$->info = NUMBER; }
     		| '~' expr                 		{ $$ = uniNode('~', $2);
                                              if (!EQUALTYPE($2->info, NUMBER)) yyerror("'~' only supports one number.");
                                              $$->info = NUMBER; }
     		| expr '&' expr            		{ $$ = binNode('&', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER)) yyerror("'&' only supports numbers.");
                                              $$->info = NUMBER; }
     		| expr '|' expr            		{ $$ = binNode('|', $1, $3);
                                              if (!BOTHTYPE($1->info, $3->info, NUMBER)) yyerror("'|' only supports numbers.");
                                              $$->info = NUMBER; }
     		| leftv DEF expr           		{ $$ = binNode(DEF, $1, $3); checkAssign($1->user, $1->info, $3->info, $3->place); $$->info = $1->info; }    /* 0 pode ser atribuido a qq coisa, corresponde ao ponteiro nulo em cadeia e vetor */
     		;

%%
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
