#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<string.h>
#include<fcntl.h>

void error(char *msg, int errorCode) {

  perror("Error: ");
  perror(msg);
  exit(errorCode);
}

enum {END, ID, BREAK, CHAR, DOUBLE, ELSE, FOR, IF, INT, RETURN, STRUCT, VOID, WHILE, CT_INT, CT_REAL, CT_CHAR, CT_STRING, COMMA, SEMICOLON, LPAR, RPAR, LBRACKET, RBRACKET, LACC, RACC,
      ADD, SUB, MUL, DIV, DOT, AND, OR, NOT, ASSIGN, EQUAL, NOTEQ, LESS, LESSEQ, GREATER, GREATEREQ };

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

struct _Token *firstToken = NULL;
struct _Token *lastToken = NULL;

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
int t3(char character) {

  if(character == 'a' || character == 'b' || character == 'f' || character == 'n' || character == 'r' || character == 't' ||
     character == 'v' || character == 39 || character == '?' || character == 34 || character == '\0')
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

int addNextToken(char *inputBuffer, int limit, int *line) {

  int position = 0;
  int state = 0;
  char character;
  int length = 0;
  int start = 0;
  struct _Token *newToken = NULL;
  char errorBuffer[100];
  char *constantNumber = NULL;
  
  while(position < limit) {

    character = inputBuffer[position];
    switch(state) {

    case 0:
      if(character == '\n' || character == '\r' || character == '\t' || character == ' ') {
	if(character == '\n')
	  *line += 1;
	position++;
      }
      else if(character >= 49 && character <= 57) {
	start = position; //inceputul unui CT_INT sau CT_REAL
	position++;
	state = 1;
      }
      else if((character >= 97 && character <= 122) || (character >= 65 && character <= 90) || character == '_') {
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
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
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
      else
	state = 51;
      break;

    case 2:
      if(character == '8' || character == '9') {
	position++;
	state = 6;
      }
      else if(character == 'x') {
	position++;
	state = 3;
      }
      else
	state = 5;
      break;

    case 3:
      if((character >= 48 && character <= 57) || (character >= 97 && character <= 102) || (character >= 65 && character <= 70)) {
	position++;
	state = 4;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 4:
      if((character >= 48 && character <= 57) || (character >= 97 && character <= 102) || (character >= 65 && character <= 70)) {
	position++;
	state = 4;
      }
      else
	state = 51;
      break;
    case 5:
      if(character >= 48 && character <= 55)
	position++;
      else if(character == '8' || character == '9') {
	position++;
	state = 6;
      }
      else
	state = 51;
      break;
    case 6:
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
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
    case 7:
      if(character == 43 || character == 45) {
	position++;
	state = 8;
      }
      else if(character >= 48 && character <= 57) {
	position++;
	state = 9;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 8:
      if(character >= 48 && character <= 57) {
	position++;
	state = 9;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 9:
      if(character >= 48 && character <= 57)
	position++;
      else
	state = 67;
      break;
    case 10:
      if(character >= 48 && character <= 57) {
	position++;
	state = 11;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 11:
      if(character >= 48 && character <= 57)
	position++;
      else if(character == 'e' || character == 'E') {
	position++;
	state = 7;
      }
      else
	state = 67;
      break;
    case 12:
      if((character >= 97 && character <= 122) || (character >= 65 && character <= 90) || (character >= 48 && character <= 57) || character == 95)
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
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 14:
      if(character == 'a' || character == 'b' || character == 'f' || character == 'n' || character == 'r' || character == 't' ||
	 character == 'v' || character == 39 || character == '?' || character == 34 || character == '\0') {
	position++;
	state = 15;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 15:
      if(character == 39) {
	position++;
	state = 41;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 16:
      if(character == 39) {
	position++;
	state = 41;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
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
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
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
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 19:
      if(t3(character)) {
	position++;
	state = 20;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
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
      break;
    case 21:
      if(character == 38) {
	position++;
	state = 56;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
	error(errorBuffer, 8);
      }
      break;
    case 22:
      if(character == 124) {
	position++;
	state = 57;
      }
      else {
	sprintf(errorBuffer, "Invalid character: %c at line %d\n", character, *line);
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
    case 28:
      if(character != '\n' && character != '\r' && character != '\0')
	position++;
      else
	state = 0;
      break;
    case 29:
      if(character == '*') {
	position++;
	state = 30;
      }
      else
	position++;
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
    case 40://///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      length = position - start;
            
    }
  }
  return -1; //provizoriu
}

void parseCode(char *inputBuffer, int limit) {

  int totalCount = 0;
  int addedToken;
  int line = 0;
  
  while(totalCount < limit) {

    addedToken = addNextToken(inputBuffer + totalCount, limit - totalCount, &line);
    if(addedToken == -1)
      error("Something went wrong. File may be larger than program limit.\n", 6);
    totalCount += addedToken;
  }
  
}

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

  char x[4];
  char *y = argv[1] + 2;
  strncpy(x, y, 4);
  x[4] = '\0';
  printf("%s\n", x);
  
  return 0;
}
