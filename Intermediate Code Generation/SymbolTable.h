#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#ifndef Symbol_Table
#define Symbol_Table

 


// Defining the strucure of the Symbol Table
struct SymbolTable {

  char *Type;
  char *symbol_t; 
  char *ARRAY_SIZE; 
  int SCOPE_ID;
  int LINE_NUMBER ; 
  // struct SymbolTable* left; // For binary tree based symbol table 
  struct SymbolTable *NEXT_VAR;
};

int ST_SIZE_UPPER_BOUND = 11;  // PREDEFING THE UPPER BOUND FOR THE SYMBOL TABLE  
 
// Predefning the function in the header files for future use


// for printing symbol table
void ST_PRINT_DATA(struct SymbolTable **symbol_table, const char *table_name);

// init function for intialization
void NEW_SYMBOL_TABLE (struct SymbolTable **symbol_table);
// function for generating the hashes
int HASHER(const char *symbol_t);


//  function for insertion
 
struct SymbolTable * Insert_In_Symbol_Table (struct SymbolTable **symbol_table, const char* symbol_t, const int scope_num, const char *Type, const char *ARRAY_SIZE, const int LINE_NUMBER );


// function is for look ups

struct SymbolTable *LOOK_UP_ST(struct SymbolTable **symbol_table, const char* symbol_t);


// funtion to free each pointer of the symbol table
void FUNCTION(struct SymbolTable **symbol_table);


#endif
