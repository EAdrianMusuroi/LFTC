#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<string.h>
#include<fcntl.h>
#include<ctype.h>

//STRUCTURES & ENUMS

enum {END, ID, BREAK, CHAR, DOUBLE, ELSE, FOR, IF, INT, RETURN, STRUCT, VOID, WHILE, CT_INT, CT_REAL,
      CT_CHAR, CT_STRING, COMMA, SEMICOLON, LPAR, RPAR, LBRACKET, RBRACKET, LACC, RACC, ADD, SUB, MUL,
      DIV, DOT, AND, OR, NOT, ASSIGN, EQUAL, NOTEQ, LESS, LESSEQ, GREATER, GREATEREQ };

enum {TB_INT, TB_DOUBLE, TB_CHAR, TB_STRUCT, TB_VOID };
enum {CLS_VAR, CLS_FUNC, CLS_EXTFUNC, CLS_STRUCT };
enum {MEM_GLOBAL, MEM_ARG, MEM_LOCAL};

struct _Token {

  int code;
  int line;
  union {
    char *text;
    double realNumber;
    char character;
    long int integerNumber;
  };
  struct _Token *nextToken;
};

struct _Symbol;
typedef struct _Symbol Symbol;
typedef struct {

  Symbol **begin;
  Symbol **end;
  Symbol **after;
} Symbols;

typedef struct {

  int typebase;
  Symbol *s;
  int nElements;
} Type;

typedef struct _Symbol {

  const char *name;
  int cls;
  int mem;
  Type type;
  int depth;
  union {
    Symbols args;
    Symbols members;
  };
} Symbol;

//FUNCTION PROTOTYPES

void error(char*, int);
void parseCode(char*, int);
int addNextToken(char*, int, int*);
void addToken(struct _Token*);
void printTokens();
int t0(char);
int t1(char);
int t2(char);
int t3(char);
int t4(char);
int t5(char);
int t6(char);
int t7(int);
char* codeToStringForTypes(int);
char* codeToStringForKeywords(int);
char* codeToStringForDelimiters(int);
char* codeToStringForOperators(int);
int unit(void);
int declStruct(void);
int declVar(void);
int typeBase(void);
int arrayDecl(void);
int typeName(void);
int declFunc(void);
int funcArg(void);
int stm(void);
int stmCompound(void);
int expr(void);
int exprAssign(void);
int exprOr(void);
int exprAnd(void);
int exprEq(void);
int exprRel(void);
int exprAdd(void);
int exprMul(void);
int exprCast(void);
int exprUnary(void);
int exprPostfix(void);
int exprPrimary(void);
int consume(int);
void syntacticErrorForTypes(int);
void syntacticErrorForKeywords(int);
void syntacticErrorForDelimiters(int);
void syntacticErrorForOperators(int);
void syntacticErrorForOthers(char*);
void syntacticAnalysis(void);

//GLOBAL VARIABLES

struct _Token *firstToken = NULL;
struct _Token *lastToken = NULL;
struct _Token *currentToken = NULL; //pentru analizatorul sintactic
struct _Token *consumedToken = NULL; //memorarea tokenului pentru valoare
int syntacticAnalysisLogFile;
Symbols symbols;
int crtDepth = 0;
Symbol *crtFunc = NULL;
Symbol *crtStruct = NULL;



void initSymbols(Symbols *symbols) {

  symbols->begin = NULL;
  symbols->end = NULL;
  symbols->after = NULL;
}

Symbol *addSymbol(Symbols *symbols, const char *name, int cls) {

  Symbol *s;

  if(symbols->end == symbols->after) {

    int count = symbols->after - symbols->begin;
    int n = count * 2;

    if(n == 0)
      n = 1;

    symbols->begin = (Symbol**)realloc(symbols->begin, n * sizeof(Symbol*));
    if(symbols->begin == NULL)
      error("Not enough memory.\n", 28);
    symbols->end = symbols->begin + count;
    symbols->after = symbols->begin + n;
  }

  s = (Symbol*)malloc(sizeof(Symbol));

  *symbols->end++ = s;
  s->name = name;
  s->cls = cls;
  s->depth = crtDepth;

  return s;
}

Symbol *findSymbol(Symbols *symbols, const char *name) {

  Symbol **p;

  for(p = symbols->begin; p != symbols->end; p++)
    if(strcmp((*p)->name, name) == 0)
      return (*p);

  return NULL;
}

int consume(int code) {

  if(currentToken->code == code) {
    consumedToken = currentToken;
    currentToken = currentToken->nextToken;

    return 1;
  }
  
  return 0;
}

void syntacticErrorForTypes(int code) {

  char *expected = codeToStringForTypes(code);
  char errorMsg[50];
  
  if(expected == NULL) {
    perror("No error message to show.\n");
    exit(16);
  }
  else {
    sprintf(errorMsg, "ERROR: At line %d -> Expected token of type: %s\n", currentToken->line, expected);
    perror(errorMsg);
    free(expected);
    exit(15);
  }
}

void syntacticErrorForKeywords(int code) {

  char *expected = codeToStringForKeywords(code);
  char errorMsg[50];
  
  if(expected == NULL) {
    perror("No error message to show.\n");
    exit(16);
  }
  else {
    sprintf(errorMsg, "ERROR: At line %d -> Expected keyword: %s\n", currentToken->line, expected);
    perror(errorMsg);
    free(expected);
    exit(15);
  }
}

void syntacticErrorForDelimiters(int code) {

  char *expected = codeToStringForDelimiters(code);
  char errorMsg[50];
  
  if(expected == NULL) {
    perror("No error message to show.\n");
    exit(16);
  }
  else {
    sprintf(errorMsg, "ERROR: At line %d -> Expected delimiter: %s\n", currentToken->line, expected);
    perror(errorMsg);
    free(expected);
    exit(15);
  }
}

void syntacticErrorForOperators(int code) {

  char *expected = codeToStringForOperators(code);
  char errorMsg[50];
  
  if(expected == NULL) {
    perror("No error message to show.\n");
    exit(16);
  }
  else {
    sprintf(errorMsg, "ERROR: At line %d -> Expected operator: %s\n", currentToken->line, expected);
    perror(errorMsg);
    free(expected);
    exit(15);
  }
}

void syntacticErrorForOthers(char *name) {

  char errorMsg[50];

  sprintf(errorMsg, "ERROR: At line %d -> Expected %s\n", currentToken->line, name);
  perror(errorMsg);
  exit(15);
}

int unit() {

  char s[] = "In function unit()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  while(1) {
    if(!declStruct() && !declFunc() && !declVar())
      break;
  }

  if(!consume(END))
    syntacticErrorForTypes(END);

  return 1;
}

int declStruct() {

  char s[] = "In function declStruct()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(consume(STRUCT)) {
    if(!consume(ID))
      syntacticErrorForTypes(ID);
    if(!consume(LACC)) {
      char s3[] = "declStruct() function failed...";
      char nl3 = '\n';
      write(syntacticAnalysisLogFile, s3, strlen(s3));
      write(syntacticAnalysisLogFile, &nl3, 1);

      currentToken = startToken;
      
      return 0;
    }
    
    while(1) {
      if(!declVar())
	break;
    }
    
    if(!consume(RACC))
      syntacticErrorForDelimiters(RACC);
    if(!consume(SEMICOLON))
      syntacticErrorForDelimiters(SEMICOLON);

    char s1[] = "declStruct() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
    
    return 1;
  }

  currentToken = startToken;

  char s2[] = "declStruct() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int declVar() {

  char s[] = "In function declVar()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(typeBase()) {
    if(!consume(ID))
      syntacticErrorForTypes(ID);

    arrayDecl();

    while(1) {
      if(consume(COMMA)) {
	  if(!consume(ID))
	    syntacticErrorForTypes(ID);
	  arrayDecl();
	}
      else
	break;
    }
    
    if(!consume(SEMICOLON))
      syntacticErrorForDelimiters(SEMICOLON);

    char s1[] = "declVar() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);

    return 1;
  }

  currentToken = startToken;

  char s2[] = "declVar() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int typeBase() {

  char s[] = "In function typeBase()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(consume(INT)) {
    char s5[] = "typeBase() function succeded with INT...";
    char nl5 = '\n';
    write(syntacticAnalysisLogFile, s5, strlen(s5));
    write(syntacticAnalysisLogFile, &nl5, 1);

    return 1;
  }

  if(consume(DOUBLE)) {
    char s4[] = "typeBase() function succeded with DOUBLE...";
    char nl4 = '\n';
    write(syntacticAnalysisLogFile, s4, strlen(s4));
    write(syntacticAnalysisLogFile, &nl4, 1);

    return 1;
  }

  if(consume(CHAR)) {
    char s0[] = "typeBase() function succeded with CHAR...";
    char nl0 = '\n';
    write(syntacticAnalysisLogFile, s0, strlen(s0));
    write(syntacticAnalysisLogFile, &nl0, 1);

    return 1;
  }
  
  if(consume(STRUCT)) {
    if(!consume(ID))
      syntacticErrorForTypes(ID);
     
    char s1[] = "typeBase() function succeded with STRUCT ID...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);

    return 1;
  }

  currentToken = startToken;

  char s2[] = "typeBase() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int arrayDecl() {

  char s[] = "In function arrayDecl()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(consume(LBRACKET)) {

    expr();
    if(!consume(RBRACKET))
      syntacticErrorForDelimiters(RBRACKET);

    char s1[] = "arrayDecl() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
    
    return 1;
    
  }

  currentToken = startToken;

  char s2[] = "arrayDecl() funcition failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int typeName() {

  char s[] = "In function typeName()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(typeBase()) {

    arrayDecl();

    char s1[] = "typeName() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "typeName() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int declFunc() {

  char s[] = "In function declFunc()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  int mulFlag = 0;
  
  if(typeBase()) {
    if(consume(MUL))
      mulFlag = 1;

    if(!consume(ID))
      syntacticErrorForTypes(ID);
    
    if(!consume(LPAR)) {
      if(mulFlag)
	syntacticErrorForDelimiters(LPAR);
      else {
	currentToken = startToken;
	char s1[] = "declFunc() function failed...";
	char nl1 = '\n';
	write(syntacticAnalysisLogFile, s1, strlen(s1));
	write(syntacticAnalysisLogFile, &nl1, 1);

	return 0;
      }
    }
    
    if(funcArg()) {
      while(1) {
	if(consume(COMMA)) {
	  if(!funcArg())
	    syntacticErrorForOthers("funcArg");
	}
	else
	  break;
      }
    }
    
    if(!consume(RPAR))
      syntacticErrorForDelimiters(RPAR);

    if(!stmCompound())
      syntacticErrorForOthers("stmCompound");

    char s2[] = "declFunc() function succeded...";
    char nl2 = '\n';
    write(syntacticAnalysisLogFile, s2, strlen(s2));
    write(syntacticAnalysisLogFile, &nl2, 1);
  
    return 1;
  }

  currentToken = startToken;
  
  if(consume(VOID)) {
    if(!consume(ID))
      syntacticErrorForTypes(ID);
    
    if(!consume(LPAR))
      syntacticErrorForDelimiters(LPAR);
    
    if(funcArg()) {
      while(1) {
	if(consume(COMMA)) {
	  if(!funcArg())
	    syntacticErrorForOthers("funcArg");
	}
	else
	  break;
      }
    }
    
    if(!consume(RPAR))
      syntacticErrorForDelimiters(RPAR);

    if(!stmCompound())
      syntacticErrorForOthers("stmCompound");

    char s3[] = "declFunc() function succeded...";
    char nl3 = '\n';
    write(syntacticAnalysisLogFile, s3, strlen(s3));
    write(syntacticAnalysisLogFile, &nl3, 1);

    return 1;
  }

  currentToken = startToken;

  char s4[] = "declFunc() function failed...";
  char nl4 = '\n';
  write(syntacticAnalysisLogFile, s4, strlen(s4));
  write(syntacticAnalysisLogFile, &nl4, 1);
  
  return 0;
}

int funcArg() {

  char s[] = "In function funcArg()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  
  if(typeBase()) {
    if(!consume(ID))
      syntacticErrorForTypes(ID);
    
    arrayDecl();

    char s1[] = "funcArg() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "funcArg() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int stm() {

  char s[] = "In function stm()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  struct _Token *startToken = currentToken;
  
  
  if(stmCompound()) {
    char s1[] = "stm() function succeded with stmCompound()...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;
  
  if(consume(IF)) {
      if(!consume(LPAR))
	syntacticErrorForDelimiters(LPAR);
      if(!expr())
	syntacticErrorForOthers("expr");
      if(!consume(RPAR))
	syntacticErrorForDelimiters(RPAR);
      if(!stm())
	syntacticErrorForOthers("stm");
      if(consume(ELSE)) {
	if(!stm())
	  syntacticErrorForOthers("stm");
      }

      char s2[] = "stm() function succeded with IF branch...";
      char nl2 = '\n';
      write(syntacticAnalysisLogFile, s2, strlen(s2));
      write(syntacticAnalysisLogFile, &nl2, 1);
  
      return 1;
  }

  currentToken = startToken;
  
  if(consume(WHILE)) {
    if(!consume(LPAR))
      syntacticErrorForDelimiters(LPAR);
    if(!expr())
      syntacticErrorForOthers("expr");
    if(!consume(RPAR))
      syntacticErrorForDelimiters(RPAR);
    if(!stm())
      syntacticErrorForOthers("stm");

    char s3[] = "stm() function succeded with WHILE branch...";
    char nl3 = '\n';
    write(syntacticAnalysisLogFile, s3, strlen(s3));
    write(syntacticAnalysisLogFile, &nl3, 1);
  
    return 1;
  }

  currentToken = startToken;
  
  if(consume(FOR)) {
    if(!consume(LPAR))
      syntacticErrorForDelimiters(LPAR);
    expr();
    if(!consume(SEMICOLON))
      syntacticErrorForDelimiters(SEMICOLON);
    expr();
    if(!consume(SEMICOLON))
      syntacticErrorForDelimiters(SEMICOLON);
    expr();
    if(!consume(RPAR))
      syntacticErrorForDelimiters(RPAR);
    if(!stm())
      syntacticErrorForOthers("stm");

    char s4[] = "stm() function succeded with FOR branch...";
    char nl4 = '\n';
    write(syntacticAnalysisLogFile, s4, strlen(s4));
    write(syntacticAnalysisLogFile, &nl4, 1);

    return 1;
  }

  currentToken = startToken;
  
  if(consume(BREAK)) {
    if(!consume(SEMICOLON))
      syntacticErrorForDelimiters(SEMICOLON);

    char s5[] = "stm() function succeded with BREAK branch...";
    char nl5 = '\n';
    write(syntacticAnalysisLogFile, s5, strlen(s5));
    write(syntacticAnalysisLogFile, &nl5, 1);
  
    return 1;
  }

  currentToken = startToken;
  
  if(consume(RETURN)) {
    expr();
    if(!consume(SEMICOLON))
      syntacticErrorForDelimiters(SEMICOLON);

    char s6[] = "stm() function succeded with RETURN branch...";
    char nl6 = '\n';
    write(syntacticAnalysisLogFile, s6, strlen(s6));
    write(syntacticAnalysisLogFile, &nl6, 1);
  
    return 1;
  }

  currentToken = startToken;

  if(expr()) {
    if(!consume(SEMICOLON))
      syntacticErrorForDelimiters(SEMICOLON);

    char s7[] = "stm() function succeded with expr() branch...";
    char nl7 = '\n';
    write(syntacticAnalysisLogFile, s7, strlen(s7));
    write(syntacticAnalysisLogFile, &nl7, 1);
  
    return 1;
  }

  currentToken = startToken;

  if(consume(SEMICOLON)) {
    char s8[] = "stm() function succeded with SEMICOLON...";
    char nl8 = '\n';
    write(syntacticAnalysisLogFile, s8, strlen(s8));
    write(syntacticAnalysisLogFile, &nl8, 1);

    return 1;
  }
  
  currentToken = startToken;

  char s9[] = "stm() function failed...";
  char nl9 = '\n';
  write(syntacticAnalysisLogFile, s9, strlen(s9));
  write(syntacticAnalysisLogFile, &nl9, 1);
  
  return 0;
}

int stmCompound() {

  char s[] = "In function stmCompound()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(consume(LACC)) {
    while(1) {
      if(!declVar() && !stm())
	break;
    }
    if(!consume(RACC))
       syntacticErrorForDelimiters(RACC);

    char s1[] = "stmCompound() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "stmCompond() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int expr() {

  char s[] = "In function expr()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprAssign()) {
    char s1[] = "expr() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }
  
  currentToken = startToken;

  char s2[] = "expr() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int exprAssign() {

  char s[] = "In function exprAssign()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprUnary()) {
    if(consume(ASSIGN)) {
      if(!exprAssign())
	syntacticErrorForOthers("exprAssign");

      char s1[] = "exprAssign() function succeded with exprUnary branch...";
      char nl1 = '\n';
      write(syntacticAnalysisLogFile, s1, strlen(s1));
      write(syntacticAnalysisLogFile, &nl1, 1);
          
      return 1;
    }
  }

  currentToken = startToken;
  
  if(exprOr()) {
    char s2[] = "exprAssign() function succeded with exprOr branch...";
    char nl2 = '\n';
    write(syntacticAnalysisLogFile, s2, strlen(s2));
    write(syntacticAnalysisLogFile, &nl2, 1);
  
    return 1;
  }
  currentToken = startToken;

  char s3[] = "exprAssign() function failed...";
  char nl3 = '\n';
  write(syntacticAnalysisLogFile, s3, strlen(s3));
  write(syntacticAnalysisLogFile, &nl3, 1);
  
  return 0;
}

int exprOr1() {

  if(consume(OR)) {
    if(!exprAnd())
      syntacticErrorForOthers("exprAnd");
    if(!exprOr1())
      syntacticErrorForOthers("exprOr1");
  }
  
  return 1;
}

int exprOr() {

  char s[] = "In function exprOr()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprAnd()) {
    if(!exprOr1())
      syntacticErrorForOthers("exprOr1");

    char s1[] = "exprOr() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "exprOr() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}


int exprAnd1() {

  if(consume(AND)) {
    if(!exprEq())
      syntacticErrorForOthers("exprEq");
    if(!exprAnd1())
      syntacticErrorForOthers("exprAnd1");
  }

  return 1;
}

int exprAnd() {

  char s[] = "In function exprAnd()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprEq()) {
    if(!exprAnd1())
      syntacticErrorForOthers("exprAnd1");

    char s1[] = "exprAnd() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "exprAnd() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int exprEq1() {

  if(consume(EQUAL) || consume(NOTEQ)) {

    if(!exprRel())
      syntacticErrorForOthers("exprRel");
    if(!exprEq1())
      syntacticErrorForOthers("exprEq1");
  }
  
  return 1;
}

int exprEq() {

  char s[] = "In function exprEq()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprRel()) {
    if(!exprEq1())
      syntacticErrorForOthers("exprEq1");

    char s1[] = "exprEq() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);

    return 1;
  }

  currentToken = startToken;

  char s2[] = "exprEq() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int exprRel1() {

  if(consume(LESS) || consume(LESSEQ) || consume(GREATER) || consume(GREATEREQ)) {

    if(!exprAdd())
      syntacticErrorForOthers("exprAdd");
    if(!exprRel1())
      syntacticErrorForOthers("exprRel1");
  }
  
  return 1;
}

int exprRel() {

  char s[] = "In function exprRel()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprAdd()) {
    if(!exprRel1())
      syntacticErrorForOthers("exprRel1");

    char s1[] = "exprRel() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "exprRel() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int exprAdd1() {

  if(consume(ADD) || consume(SUB)) {
    if(!exprMul())
      syntacticErrorForOthers("exprMul");
    if(!exprAdd1())
      syntacticErrorForOthers("exprAdd1");
  }
  
  return 1;
}

int exprAdd() {

  char s[] = "In function exprAdd()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprMul()) {
    if(!exprAdd1())
      syntacticErrorForOthers("exprAdd1");

    char s1[] = "exprAdd() function succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "exprAdd() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int exprMul1() {

  if(consume(MUL) || consume(DIV)) {
    if(!exprCast())
      syntacticErrorForOthers("exprCast");
    if(!exprMul1())
      syntacticErrorForOthers("exprMul");
  }

  return 1;
}
    
int exprMul() {

  char s[] = "In function exprMul()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprCast()) {
    if(!exprMul1())
      syntacticErrorForOthers("exprMul1");
    
    return 1;
  }

  currentToken = startToken;

  char s1[] = "exprMul() function failed...";
  char nl1 = '\n';
  write(syntacticAnalysisLogFile, s1, strlen(s1));
  write(syntacticAnalysisLogFile, &nl1, 1);
  
  return 0;
}

int exprCast() {

  char s[] = "In function exprCast()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(consume(LPAR)) {
    if(typeName()) {
      if(!consume(RPAR))
	syntacticErrorForDelimiters(RPAR);
      if(!exprCast())
	syntacticErrorForOthers("exprCast");

      char s0[] = "exprCast() function succeded with LPAR branch...";
      char nl0 = '\n';
      write(syntacticAnalysisLogFile, s0, strlen(s0));
      write(syntacticAnalysisLogFile, &nl0, 1);
      
      return 1;
    }
  }

  currentToken = startToken;
  
  if(exprUnary()) {
    char s1[] = "exprCast() function succeded with exprUnary() branch...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }
  
  currentToken = startToken;

  char s2[] = "exprCast() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

int exprUnary() {

  char s[] = "In function exprUnary()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;

  if(consume(SUB) || consume(NOT)) {
    if(!exprUnary())
      syntacticErrorForOthers("exprUnary");

    char s0[] = "exprUnary() function succeded with first branch...";
    char nl0 = '\n';
    write(syntacticAnalysisLogFile, s0, strlen(s0));
    write(syntacticAnalysisLogFile, &nl0, 1);

    return 1;
  }

  currentToken = startToken;

  if(exprPostfix()) {
    char s1[] = "exprUnary() function succeded with exprPostfix() branch...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
    
    return 1;
  }
  currentToken = startToken;

  char s2[] = "exprUnary() function failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}

//A -> A a1 | A a2 | b
//A -> b A1
//A1 -> a1 A1 | a2 A1 | e
int exprPostfix1() {

  if(consume(LBRACKET)) {
    if(!expr())
      syntacticErrorForOthers("expr");
    if(!consume(RBRACKET))
      syntacticErrorForDelimiters(LBRACKET); //////AICI AM RAMAS
    if(!exprPostfix1())
      syntacticErrorForOthers("exprPostfix1");
    
    return 1;
  }
  
  if(consume(DOT)) {
    if(!consume(ID))
      syntacticErrorForTypes(ID);
    if(!exprPostfix1())
      syntacticErrorForOthers("exprPostfix1");
    
    return 1;
  }
  
  return 1;
}

int exprPostfix() {

  char s[] = "In function exprPostfix()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;
  
  if(exprPrimary()) {
    if(!exprPostfix1())
      syntacticErrorForOthers("exprPostfix1");

    char s1[] = "exprPostfix() succeded...";
    char nl1 = '\n';
    write(syntacticAnalysisLogFile, s1, strlen(s1));
    write(syntacticAnalysisLogFile, &nl1, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s2[] = "exprPostfix() failed...";
  char nl2 = '\n';
  write(syntacticAnalysisLogFile, s2, strlen(s2));
  write(syntacticAnalysisLogFile, &nl2, 1);
  
  return 0;
}
  
int exprPrimary() {

  char s[] = "In function exprPrimary()...";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);
  
  struct _Token *startToken = currentToken;

  if(consume(ID)) {
    if(!consume(LPAR)) {
      char s1[] = "exprPrimary() succeded with ID...";
      char nl1 = '\n';
      write(syntacticAnalysisLogFile, s1, strlen(s1));
      write(syntacticAnalysisLogFile, &nl1, 1);
  
      return 1;
    }
    else { //Exista LPAR
      if(expr()) {
	while(1) {
	  if(!consume(COMMA))
	    break;
	  else if(!expr())
	    syntacticErrorForOthers("expr");
	}
      }
      if(!consume(RPAR))
	syntacticErrorForDelimiters(RPAR);
    }

    char s2[] = "exprPrimary() function succeded with ID branch...";
    char nl2 = '\n';
    write(syntacticAnalysisLogFile, s2, strlen(s2));
    write(syntacticAnalysisLogFile, &nl2, 1);
  
    return 1;
  }
  
  if(consume(CT_INT)) {
    char s3[] = "exprPrimary() function succeded with CT_INT...";
    char nl3 = '\n';
    write(syntacticAnalysisLogFile, s3, strlen(s3));
    write(syntacticAnalysisLogFile, &nl3, 1);
  
    return 1;
  }
  if(consume(CT_REAL)) {
    char s4[] = "exprPrimary() function succeded with CT_REAL...";
    char nl4 = '\n';
    write(syntacticAnalysisLogFile, s4, strlen(s4));
    write(syntacticAnalysisLogFile, &nl4, 1);
  
    return 1;
  }
  if(consume(CT_CHAR)) {
    char s5[] = "exprPrimary() function succeded with CT_CHAR...";
    char nl5 = '\n';
    write(syntacticAnalysisLogFile, s5, strlen(s5));
    write(syntacticAnalysisLogFile, &nl5, 1);

    return 1;
  }
  if(consume(CT_STRING)) {
    char s6[] = "exprPrimary() function succeded with CT_STRING...";
    char nl6 = '\n';
    write(syntacticAnalysisLogFile, s6, strlen(s6));
    write(syntacticAnalysisLogFile, &nl6, 1);
  
    return 1;
  }
  if(consume(LPAR)) {
    if(!expr())
      syntacticErrorForOthers("expr");
    if(!consume(RPAR))
      syntacticErrorForDelimiters(RPAR);

    char s7[] = "exprPrimary() function succeded with LPAR branch...";
    char nl7 = '\n';
    write(syntacticAnalysisLogFile, s7, strlen(s7));
    write(syntacticAnalysisLogFile, &nl7, 1);
  
    return 1;
  }

  currentToken = startToken;

  char s8[] = "exprPrimary() function failed...";
  char nl8 = '\n';
  write(syntacticAnalysisLogFile, s8, strlen(s8));
  write(syntacticAnalysisLogFile, &nl8, 1);
  
  return 0;
}

void syntacticAnalysis() {

  syntacticAnalysisLogFile = open("SyntacticLog", O_WRONLY | O_CREAT | O_TRUNC, S_IRWXU);
  if(syntacticAnalysisLogFile == -1)
    error("Error opening SyntacticLog file.\n", 16);

  char s[] = "Starting syntactic analysis.";
  char nl = '\n';
  write(syntacticAnalysisLogFile, s, strlen(s));
  write(syntacticAnalysisLogFile, &nl, 1);

  currentToken = firstToken;
  if(unit())
    printf("Syntactic analysis succeded.\n");
  else
    printf("Incorrect.");

  close(syntacticAnalysisLogFile);
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv) {

  if(argc < 2)
    error("Too few arguments. Expected input file.\n", 1);

  struct stat inputTest;
  if(stat(argv[1], &inputTest) != 0)
    error("Error calling stat function in input file.\n", 2);
  if(!S_ISREG(inputTest.st_mode))
    error("First argument must be a regular file.\n", 3);

  int input;
  input = open(argv[1], O_RDONLY);
  if(input == -1)
    error("Error opening input file.\n", 4);

  char inputBuffer[4097];
  int readBytes;

  readBytes = read(input, &inputBuffer, 4096);
  if(readBytes == -1)
    error("Error reading from input file.\n", 5);  
  printf("%d bytes read from input file.\n\n\n", readBytes);
  
  inputBuffer[readBytes] = '\0';

  parseCode(inputBuffer, readBytes);
  //printTokens();
  syntacticAnalysis();

  return 0;
}


int t0(char c) {

  if(c == '\n' || c == '\r' || c == '\t' || c == ' ')
    return 1;
  return 0;
}
int t1(char c) {

  if(c == '8' || c == '9')
    return 1;
  return 0;
}
int t2(char c) {

  if(isalpha(c) || c == '_')
    return 1;
  return 0;
}
int t3(char c) {

  if(c == 'a' || c == 'b' || c == 'f' || c == 'n' || c == 'r' || c == 't' ||
     c == 'v' || c == 39 || c == '?' || c == 34 || c == '0' || c == '\\')
    return 1;
  return 0;
}
int t4(char c) {

  if((c >= 97 && c <= 102) || (c >= 65 && c <= 70))
    return 1;
  return 0;
}
int t5(char c) {
  if(c >= 48 && c <= 55)
    return 1;
  return 0;
}
int t6(char c) {
  if(c >= '1' && c <= '9')
    return 1;
  return 0;
}
int t7(int state) {

  if(state >= 40 && state <= 67)
    return 1;
  return 0;
  
}

void error(char *msg, int errorCode) {

  perror("Error: ");
  perror(msg);
  exit(errorCode);
}

char* codeToStringForTypes(int code) {

  char *s;
  s = (char*)malloc(10);

  switch(code) {

  case 0:
    strcpy(s, "END");
    break;
  case 1:
    strcpy(s, "ID");
    break;
  case 13:
    strcpy(s, "CT_INT");
    break;
  case 14:
    strcpy(s, "CT_REAL");
    break;
  case 15:
    strcpy(s, "CT_CHAR");
    break;
  case 16:
    strcpy(s, "CT_STRING");
    break;
  default:
    free(s);
    return NULL;
  }

  return s;
}

char* codeToStringForKeywords(int code) {

   char *s;
   s = (char*)malloc(10);
   
   switch(code) {
    case 2:
      strcpy(s, "break");
      break;
    case 3:
      strcpy(s, "char");
      break;
    case 4:
      strcpy(s, "double");
      break;
    case 5:
      strcpy(s, "else");
      break;
    case 6:
      strcpy(s, "for");
      break;
    case 7:
      strcpy(s, "if");
      break;
    case 8:
      strcpy(s, "int");
      break;
    case 9:
      strcpy(s, "return");
      break;
    case 10:
      strcpy(s, "struct");
      break;
    case 11:
      strcpy(s, "void");
      break;
    case 12:
      strcpy(s, "while");
      break;
   default:
     free(s);
     return NULL;
    }

   return s;
 }

char* codeToStringForDelimiters(int code) {

  char *s;
  s = (char*)malloc(10);

  switch(code) {

  case 17:
    strcpy(s, ",");
    break;
  case 18:
    strcpy(s, ";");
    break;
  case 19:
    strcpy(s, "(");
    break;
  case 20:
    strcpy(s, ")");
    break;
  case 21:
    strcpy(s, "[");
    break;
  case 22:
    strcpy(s, "]");
    break;
  case 23:
    strcpy(s, "{");
    break;
  case 24:
    strcpy(s, "}");
    break;
  default:
    free(s);
    return NULL;
  }

  return s;
}

char* codeToStringForOperators(int code) {

  char *s;
  s = (char*)malloc(10);

  switch(code) {

  case 25:
    strcpy(s, "+");
    break;
  case 26:
    strcpy(s, "-");
    break;
  case 27:
    strcpy(s, "*");
    break;
  case 28:
    strcpy(s, "/");
    break;
  case 29:
    strcpy(s, ".");
    break;
  case 30:
    strcpy(s, "&&");
    break;
  case 31:
    strcpy(s, "||");
    break;
  case 32:
    strcpy(s, "!");
    break;
  case 33:
    strcpy(s, "=");
    break;
  case 34:
    strcpy(s, "==");
    break;
  case 35:
    strcpy(s, "!=");
    break;
  case 36:
    strcpy(s, "<");
    break;
  case 37:
    strcpy(s, "<=");
    break;
  case 38:
    strcpy(s, ">");
    break;
  case 39:
    strcpy(s, ">=");
    break;
  default:
    free(s);
    return NULL;
  }

  return s;
}

void printTokens() {

  struct _Token *token = firstToken;
  int line;

  if(firstToken)
    line = firstToken->line;
  
  while(token != NULL) {

    if(token->line > line) {
      printf("\n");
      line = token->line;
    }
    
    switch(token->code) {
    case 0:
      printf("END ");
      break;
    case 1:
      printf("ID: %s ", token->text);
      break;
    case 2:
      printf("BREAK ");
      break;
    case 3:
      printf("CHAR ");
      break;
    case 4:
      printf("DOUBLE ");
      break;
    case 5:
      printf("ELSE ");
      break;
    case 6:
      printf("FOR ");
      break;
    case 7:
      printf("IF ");
      break;
    case 8:
      printf("INT ");
      break;
    case 9:
      printf("RETURN ");
      break;
    case 10:
      printf("STRUCT ");
      break;
    case 11:
      printf("VOID ");
      break;
    case 12:
      printf("WHILE ");
      break;
    case 13:
      printf("CT_INT: %ld ", token->integerNumber);
      break;
    case 14:
      printf("CT_REAL: %f ", token->realNumber);
      break;
    case 15:
      printf("CT_CHAR: %c ", token->character);
      break;
    case 16:
      printf("CT_STRING: %s ", token->text);
      break;
    case 17:
      printf("COMMA ");
      break;
    case 18:
      printf("SEMICOLON ");
      break;
    case 19:
      printf("LPAR ");
      break;
    case 20:
      printf("RPAR ");
      break;
    case 21:
      printf("LBRACKET ");
      break;
    case 22:
      printf("RBRACKET ");
      break;
    case 23:
      printf("LACC ");
      break;
    case 24:
      printf("RACC ");
      break;
    case 25:
      printf("ADD ");
      break;
    case 26:
      printf("SUB ");
      break;
    case 27:
      printf("MUL ");
      break;
    case 28:
      printf("DIV ");
      break;
    case 29:
      printf("DOT ");
      break;
    case 30:
      printf("AND ");
      break;
    case 31:
      printf("OR ");
      break;
    case 32:
      printf("NOT ");
      break;
    case 33:
      printf("ASSIGN ");
      break;
    case 34:
      printf("EQUAL ");
      break;
    case 35:
      printf("NOTEQ ");
      break;
    case 36:
      printf("LESS ");
      break;
    case 37:
      printf("LESSEQ ");
      break;
    case 38:
      printf("GREATER ");
      break;
    case 39:
      printf("GREATEREQ ");
      break;
    }
    token = token->nextToken;
  }
  printf("\n");
}

void addToken(struct _Token *token) {

  if(firstToken == NULL) {
    firstToken = token;
    lastToken = token;
  }
  else {
    lastToken->nextToken = token;
    lastToken = token;
  }
  token->nextToken = NULL;
}

void parseCode(char *inputBuffer, int limit) {

  int totalCount = 0;
  int addedToken;
  int line = 0;
  struct _Token *newToken = NULL;
  
  while(totalCount < limit) {

    addedToken = addNextToken(inputBuffer + totalCount, limit - totalCount, &line);
    if(addedToken == -1)
      error("Something went wrong. File may be larger than program limit.\n", 6);
    totalCount += addedToken;
  }

  newToken = (struct _Token*)malloc(sizeof(struct _Token));
  newToken->code = END;
  newToken->line = line;
  addToken(newToken);
}

int addNextToken(char *inputBuffer, int limit, int *line) {

  struct _Token *newToken = NULL;
  int position = 0;
  int state = 0;
  int length = 0;
  int start = -1;
  int inComm = 0;
  int lastState;
  char character;
  char *temp = NULL;
  char errorBuffer[100];
  int i, j;
  
  while(position < limit || t7(state)) {

    character = inputBuffer[position];
    switch(state) {

    case 0:
      inComm = 0;
      
      if(t0(character)) {
	if(character == '\n')
	  *line += 1;
	position++;
      }
      else if(t6(character)) {
	start = position; //inceputul unui CT_INT sau CT_REAL
	position++;
	state = 1;
      }
      else if(t2(character)) {
	start = position; //inceputul unui ID
	position++;
	state = 12;
      }
      else if(character == 39) {
	start = position + 1; //inceputul unui CT_CHAR
	position++;
	state = 13;
      }
      else if(character == 44) {
        position++;
	state = 42;
      }
      else if(character == 59) {
	position++;
	state = 43;
      }
      else if(character == 40) {
	position++;
	state = 44;
      }
      else if(character == 41) {
	position++;
	state = 45;
      }
      else if(character == 91) {
	position++;
	state = 46;
      }
      else if(character == 93) {
        position++;
	state = 47;
      }
      else if(character == 123) {
        position++;
	state = 48;
      }
      else if(character == 125) {
        position++;
	state = 49;
      }
      else if(character == 43) {
	position++;
	state = 50;
      }
      else if(character == 34) {
	start = position + 1; //inceputul unui CT_STRING
	state = 17;
	position++;
      }
      else if(character == 48) {
	start = position;
	position++;
	state = 2;
      }
      else if(character == 45) {
	position++;
	state = 53;
      }
      else if(character == 42) {
	position++;
	state = 54;
      }
      else if(character == 46) {
	position++;
	state = 55;
      }
      else if(character == 38) {
	position++;
	state = 21;
      }
      else if(character == 124) {
	position++;
	state = 22;
      }
      else if(character == 33) {
	position++;
	state = 23;
      }
      else if(character == 61) {
	position++;
	state = 24;
      }
      else if(character == 60) {
	position++;
	state = 25;
      }
      else if(character == 62) {
	position++;
	state = 26;
      }
      else if(character == 47) {
	position++;
	state = 27;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 1:
      if(character >= 48 && character <= 57)
	position++;
      else if(character == 46) {
	position++;
	state = 10;
      }
      else if(character == 'e' || character == 'E') {
	position++;
	state = 7;
      }
      else {
	lastState = 1;
	state = 51;
      }
      break;

    case 2:
      if(character == '.') {
	position++;
	state = 10;
      }
      else if(character == '8' || character == '9') {
	position++;
	state = 6;
      }
      else if(character == 'x') {
	position++;
	state = 3;
      }
      else if(character >= '0' && character <= '7') {
	position++;
	state = 5;
      }
      else {
        state = 51;
      }
      break;

    case 3:
      if(t1(character) || t4(character) || t5(character)) {
	position++;
	state = 4;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 4:
      if(t1(character) || t4(character) || t5(character)) {
	position++;
	state = 4;
      }
      else {
	lastState = 4;
	state = 51;
      }
      break;
      
    case 5:
      if(t5(character))
	position++;
      else if(character == '8' || character == '9') {
	position++;
	state = 6;
      }
      else if(character == 46) {
	position++;
	state = 10;
      }
      else {
	lastState = 5;
	state = 51;
      }
      break;
      
    case 6:
      if(t1(character) || t5(character))
	position++;
      else if(character == 46) {
	position++;
	state = 10;
      }
      else if(character == 'e' || character == 'E') {
	position++;
	state = 7;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 7:
      if(character == 43 || character == 45) {
	position++;
	state = 8;
      }
      else if(t1(character) || t5(character)) {
	position++;
	state = 9;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 8:
      if(t1(character) || t5(character)) {
	position++;
	state = 9;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 9:
      if(t1(character) || t5(character))
	position++;
      else
	state = 67;
      break;
      
    case 10:
      if(t1(character) || t5(character)) {
	position++;
	state = 11;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 11:
      if(t1(character) || t5(character))
	position++;
      else if(character == 'e' || character == 'E') {
	position++;
	state = 7;
      }
      else
	state = 67;
      break;
      
    case 12:
      if(t1(character) || t5(character) || t2(character))
	position++;
      else
	state = 40;
      break;
      
    case 13:
      if(character == 92) {
	position++;
	state = 14;
      }
      else if(character != 92 && character != 39) {
	position++;
	state = 16;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 14:
      if(t3(character)) {
	position++;
	state = 15;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 15:
      if(character == 39) {
	position++;
	state = 41;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 16:
      if(character == 39) {
	position++;
	state = 41;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 17:
      if(character == 92) {
	position++;
	state = 19;
      }
      else if(character != 34 && character != 92) {
	position++;
	state = 18;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 18:
      if(character == 92) {
	position++;
	state = 19;
      }
      else if(character != 34 && character != 92)
	position++;
      else if(character == 34) {
	position++;
	state = 52;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 19:
      if(t3(character)) {
	position++;
	state = 20;
      }
      else {
        sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 20:
      if(character == 92) {
	position++;
	state = 19;
      }
      else if(character == 34) {
	position++;
	state = 52;
      }
      else {
	position++;
	state = 18;
      }
      break;

    case 21:
      if(character == 38) {
	position++;
	state = 56;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 22:
      if(character == 124) {
	position++;
	state = 57;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d in state %d\n", character, *line, state);
	error(errorBuffer, 8);
      }
      break;
      
    case 23:
      if(character == 61) {
	position++;
	state = 59;
      }
      else
	state = 58;
      break;
      
    case 24:
      if(character == 61) {
	position++;
	state = 61;
      }
      else
	state = 60;
      break;
      
    case 25:
      if(character == 61) {
	position++;
	state = 63;
      }
      else
	state = 62;
      break;
      
    case 26:
      if(character == 61) {
	position++;
	state = 65;
      }
      else
	state = 64;
      break;
      
    case 27:
      if(character == 47) {
	position++;
	state = 28;
      }
      else if(character == 42) {
	position++;
	state = 29;
      }
      else
	state = 66;
      break;
      
    case 28:
      inComm = 1;
      
      if(character != '\n' && character != '\r' && character != '\0')
	position++;
      else {
	if(character == '\n')
	  *line += 1;
	state = 0;
      }
      break;
      
    case 29:
      inComm = 1;
      
      if(character == '*') {
	position++;
	state = 30;
      }
      else {
	if(character == '\n')
	  *line += 1;
	position++;
      }
      break;
      
    case 30:
      if(character == '*')
	position++;
      else if(character == 47) {
	position++;
	state = 0;
      }
      else {
	position++;
	state = 29;
      }
      break;
      
    case 40:
      length = position - start;
      i = 0;

      if(strncmp(inputBuffer + start, "break", 5) == 0)
	i = 1; //BREAK
      else if(strncmp(inputBuffer + start, "char", 4) == 0)
	i = 2; //CHAR
      else if(strncmp(inputBuffer + start, "double", 6) == 0)
	i = 3; //DOUBLE
      else if(strncmp(inputBuffer + start, "else", 4) == 0)
	i = 4; //ELSE
      else if(strncmp(inputBuffer + start, "for", 3) == 0)
	i = 5; //FOR
      else if(strncmp(inputBuffer + start, "if", 2) == 0)
	i = 6; //IF
      else if(strncmp(inputBuffer + start, "int", 3) == 0)
	i = 7; //INT
      else if(strncmp(inputBuffer + start, "return", 6) == 0)
	i = 8; //RETURN
      else if(strncmp(inputBuffer + start, "struct", 6) == 0)
	i = 9; //STRUCT
      else if(strncmp(inputBuffer + start, "void", 4) == 0)
	i = 10; //VOID
      else if(strncmp(inputBuffer + start, "while", 5) == 0)
	i = 11; //WHILE
      
      newToken = (struct _Token*)malloc(sizeof(struct _Token));

      switch(i) {
      case 1:
	newToken->code = BREAK;
	break;
      case 2:
	newToken->code = CHAR;
	break;
      case 3:
	newToken->code = DOUBLE;
	break;
      case 4:
	newToken->code = ELSE;
	break;
      case 5:
	newToken->code = FOR;
	break;
      case 6:
	newToken->code = IF;
	break;
      case 7:
	newToken->code = INT;
	break;
      case 8:
	newToken->code = RETURN;
	break;
      case 9:
	newToken->code = STRUCT;
	break;
      case 10:
	newToken->code = VOID;
	break;
      case 11:
	newToken->code = WHILE;
	break;
      case 0:
	newToken->code = ID;
	newToken->text = (char*)malloc(length + 1);
	strncpy(newToken->text, (inputBuffer + start), length);
	newToken->text[length] = '\0';
	break;
      }
     
      newToken->line = *line;
      addToken(newToken);

      return position;
      
    case 41:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = CT_CHAR;
      newToken->line = *line;

      if(inputBuffer[start] != '\\')
	newToken->character = inputBuffer[start];
      else {
	switch(inputBuffer[start + 1]) {
	case 'a':
	  newToken->character = '\a';
	  break;
	case 'b':
	  newToken->character = '\b';
	  break;
	case 'f':
	  newToken->character = '\f';
	  break;
	case 'n':
	  newToken->character = '\n';
	  break;
	case 'r':
	  newToken->character = '\r';
	  break;
	case 't':
	  newToken->character = '\t';
	  break;
	case 'v':
	  newToken->character = '\v';
	  break;
	case '\'':
	  newToken->character = '\'';
	  break;
	case '?':
	  newToken->character = '\?';
	  break;
	case '"':
	  newToken->character = '\"';
	  break;
	case '\\':
	  newToken->character = '\\';
	  break;
	case '0':
	  newToken->character = '\0';
	  break;
	default:
	  sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	  error(errorBuffer, 8);
	}
      }
      addToken(newToken);
      
      return position;
      
    case 42:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = COMMA;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 43:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = SEMICOLON;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 44:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = LPAR;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 45:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = RPAR;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 46:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = LBRACKET;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 47:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = RBRACKET;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 48:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = LACC;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 49:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = RACC;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 50:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = ADD;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 51:
      length = position - start;
      temp = (char*)malloc(length + 1);
      strncpy(temp, inputBuffer + start, length);
      temp[length] = '\0';

      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = CT_INT;
      newToken->line = *line;
      if(lastState == 1)
	newToken->integerNumber = strtol(temp, NULL, 10);
      else if(lastState == 2)
	newToken->integerNumber = strtol(temp, NULL, 10);
      else if(lastState == 4)
	newToken->integerNumber = strtol(temp, NULL, 16);
      else
	newToken->integerNumber = strtol(temp, NULL, 8);

      addToken(newToken);
      free(temp);
      
      return position;
      
    case 52:
      length = position - start - 1;
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = CT_STRING;
      newToken->line = *line;
      newToken->text = (char*)malloc(length + 1);

      j = 0;
      i = 0;
      while(i < length) {
	if(inputBuffer[start + i] == '\\') {
	  switch(inputBuffer[start + i + 1]) {
	  case 'a':
	    newToken->text[j] = '\a';
	    break;
	  case 'b':
	    newToken->text[j] = '\b';
	    break;
	  case 'f':
	    newToken->text[j] = '\f';
	    break;
	  case 'n':
	    newToken->text[j] = '\n';
	    break;
	  case 'r':
	    newToken->text[j] = '\r';
	    break;
	  case 't':
	    newToken->text[j] = '\t';
	    break;
	  case 'v':
	    newToken->text[j] = '\v';
	    break;
	  case 39:
	    newToken->text[j] = '\'';
	    break;
	  case 63:
	    newToken->text[j] = '\?';
	    break;
	  case 34:
	    newToken->text[j] = '\"';
	    break;
	  case 92:
	    newToken->text[j] = '\\';
	    break;
	  case '0':
	    newToken->text[j] = '\0';
	    break;
	  }
	  i+=2;
	}
	else {
	  newToken->text[j] = inputBuffer[start + i];
	  i++;
	}
	j++;
      }
      newToken->text[j] = '\0';

      addToken(newToken);
      
      return position;
      
    case 53:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = SUB;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 54:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = MUL;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 55:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = DOT;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 56:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = AND;
      newToken->line = *line;

      addToken(newToken);
      return position;
      
    case 57:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = OR;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 58:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = NOT;
      newToken->line = *line;

      addToken(newToken);
      return position;
      
    case 59:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = NOTEQ;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 60:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = ASSIGN;
      newToken->line = *line;

      addToken(newToken);
      return position;
      
    case 61:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = EQUAL;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 62:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = LESS;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 63:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = LESSEQ;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 64:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = GREATER;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 65:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = GREATEREQ;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 66:
      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = DIV;
      newToken->line = *line;

      addToken(newToken);
      
      return position;
      
    case 67:
      length = position - start;
      temp = (char*)malloc(length + 1);
      strncpy(temp, inputBuffer + start, length);
      temp[length] = '\0';

      newToken = (struct _Token*)malloc(sizeof(struct _Token));
      newToken->code = CT_REAL;
      newToken->line = *line;
      newToken->realNumber = atof(temp);

      addToken(newToken);
      free(temp);
      
      return position;
    }
  }

  if(inComm || state == 0)
    return position;

  return -1;
}
