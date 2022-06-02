#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h> //for using some of the InBuilt Function of strings
#include "SymbolTable.h"
 
 // Now in this file we will finally generate or extend the function in the SymbolTable.h
// to edit the misc.h wala part 
void NEW_SYMBOL_TABLE(struct SymbolTable **ST ){

   for(int i=0; i< ST_SIZE_UPPER_BOUND; ++i){ // WE ARE CREATING AN ARRAY OF STRUCT SYMBOLTABLE AND EVERY STRUCT IS POINTING TO NULL CURRENTLY
      ST [i] = NULL;
   }
}
// definition of prototype defined in symboltable.h
void ST_PRINT_DATA(struct SymbolTable **ST , const char *symbol_tx){
   
   printf("%s \n" , symbol_tx);
  
   printf("Symbol   , Scope_Num , Type   , Array Dim  , y666666666666666666666666666666666666666666Line Number");
   

   for(int i=0; i< ST_SIZE_UPPER_BOUND; ++i){
      for(struct SymbolTable *temp_var = ST [i]; temp_var != NULL; temp_var = temp_var->NEXT_VAR){
         printf( temp_var->symbol_t, temp_var->SCOPE_ID, temp_var->Type, temp_var->ARRAY_SIZE, temp_var->LINE_NUMBER);
      }
   }

    
}
struct SymbolTable *New_Node_for_Symbol(const char* symbol_t, const char *Type, const int SCOPE_ID,  const char *ARRAY_SIZE, const int LINE_NUMBER);
struct SymbolTable * Insert_In_Symbol_Table(struct SymbolTable **ST , const char* symbol_t, const int SCOPE_ID, const char *Type, const char *ARRAY_SIZE, const int LINE_NUMBER){
   // if(LOOK_UP_ST(ST , symbol_t))
   //    return;

   int val_hash = HASHER(symbol_t);

   struct SymbolTable *temp_node = New_Node_for_Symbol(symbol_t, Type, SCOPE_ID, ARRAY_SIZE, LINE_NUMBER);

   struct SymbolTable *temp_var = ST [val_hash];
   while(temp_var != NULL && temp_var->NEXT_VAR != NULL){
      temp_var = temp_var->NEXT_VAR;
   }
   // Add as first item
   if(temp_var == NULL){
      ST [val_hash] = temp_node;
   }
   else{
      temp_var->NEXT_VAR= temp_node;
   }
}

int HASHER(const char *symbol_t){

   return ((int)symbol_t[0]) % ST_SIZE_UPPER_BOUND;
}


struct SymbolTable *New_Node_for_Symbol(const char* symbol_t, const char *Type, const int SCOPE_ID,  const char *ARRAY_SIZE, const int LINE_NUMBER){

   struct SymbolTable *temp_node = malloc(sizeof(struct SymbolTable));
   temp_node->symbol_t = malloc(sizeof(char) * (strlen(symbol_t) +1));
   temp_node->Type = malloc(sizeof(char) * (strlen(Type) +1));
   temp_node->ARRAY_SIZE = malloc(sizeof(char) * (strlen(ARRAY_SIZE) +1));

   strcpy(temp_node->symbol_t, symbol_t);
   strcpy(temp_node->Type, Type);
   strcpy(temp_node->ARRAY_SIZE, ARRAY_SIZE);
   // temp_node->symbol_t = (char*)symbol_t;
   // temp_node->Type = (char*)Type;
   temp_node->SCOPE_ID = SCOPE_ID;
   temp_node->LINE_NUMBER = LINE_NUMBER;
   temp_node->NEXT_VAR = NULL;
   
 

   return temp_node;
}


struct SymbolTable * LOOK_UP_ST(struct SymbolTable **ST , const char* symbol_t){

   int val_hash = HASHER(symbol_t);
   for(struct SymbolTable *temp_var = ST [val_hash]; temp_var != NULL; temp_var = temp_var->NEXT_VAR){
      // Symbol found in table
      if(!strcmp(temp_var->symbol_t, symbol_t)){
         return temp_var;
      }
   }



   // Symbol not found in table
   return NULL;
}

void FUNCTION(struct SymbolTable **ST ){

   for(int x=0; x< ST_SIZE_UPPER_BOUND; ++x){
      	free(ST [x]);
   }
}


