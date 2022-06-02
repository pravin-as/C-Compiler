#include<stdio.h>
#include<stdbool.h>
#include<stdlib.h>
#include<string.h>  // for using some of the inbuilt function for the string comparision

#include "SymbolTable.h"
#define scope

 

// Structure for the scope of the given in the analyser
struct SCOPE
{
    long long int SCOPE_ID;
    struct SCOPE *PREV_SCOPE_ID;
};

struct SCOPE *NEW_SCOPE();

// for defining the fucnction in the Global scope
struct SCOPE *INITIALIZE_SCOPE();
bool IS_IN_CURRENT_SCOPE(struct SymbolTable **symbol_table, char *symbol_t, struct SCOPE *curr_scope);

// to store the count of the scope in the table
long long int count_of_scope = 0;
struct SCOPE *NEW_SCOPE()
{   
    // creating new struct via dynamic memory allocation  
    struct SCOPE *node = (struct SCOPE *)malloc(sizeof(struct SCOPE));
    node->SCOPE_ID = count_of_scope++;
    node->PREV_SCOPE_ID = NULL;

    return node;
}

// Initializes global scope
struct SCOPE *INITIALIZE_SCOPE()
{
    return NEW_SCOPE();
}

//IS THE SYMBOL BELONGS TO THE CURRENT SCOPE
bool IS_IN_WITHIN_SCOPE(struct SCOPE *curr_scope, long long int scope_key)
{
    struct SCOPE *node = curr_scope;
    while (node != NULL)
    {
        if (node->SCOPE_ID == scope_key)
        {
            return true;
        }
        node = node->PREV_SCOPE_ID;
    }
    return false;
}

// GETTING THE SCOPE OF THE PREVIOUS SCOPE FOR FINDING THE SCOPE OF THE SYMBOL
struct SCOPE *GOTO_PREV_SCOPE(struct SCOPE *curr_scope)
{
    struct SCOPE *PREVIOUS_NODE = curr_scope->PREV_SCOPE_ID;
    free(curr_scope);

    return PREVIOUS_NODE;
}

// creating a new scope
struct SCOPE *new_next_scope(struct SCOPE *curr_scope)
{
    struct SCOPE *node = NEW_SCOPE();
    node->PREV_SCOPE_ID = curr_scope;

    return node;
}

//checking if a scope number is present in the current scope
bool IS_IN_CURRENT_SCOPE(struct SymbolTable **symbol_tab, char *symbol, struct SCOPE *curr_scope){
    long long int val_hash = HASHER(symbol);

    for (struct SymbolTable *curr = symbol_tab[val_hash]; curr != NULL; curr = curr->NEXT_VAR)
    {
        if (!strcmp(curr->symbol_t, symbol))
        {
            if (curr_scope->SCOPE_ID == curr->SCOPE_ID)
            {   
                return true;
            
            }
        }
    }
    return false;
}

struct SCOPE *CHECK_SCOPE(struct SymbolTable **symbol_tab, char *symbol, struct SCOPE *curr_scope)
{
    long long int val_hash = HASHER(symbol);
    for (struct SymbolTable *curr = symbol_tab[val_hash]; curr != NULL; curr = curr->NEXT_VAR)
    {
        if (!strcmp(curr->symbol_t, symbol))
        {
            if (IS_IN_WITHIN_SCOPE(curr_scope, curr->SCOPE_ID))
            {
                return curr;
            }
        }
    }
    return NULL;
}


