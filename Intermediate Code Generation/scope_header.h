#ifndef scope
#define scope
#include "SymbolTable.h"


struct SCOPE
{
    long long int SCOPE_ID;

    struct SCOPE *PREV_SCOPE_ID;
    // struct SCOPE *previous_scope;
};


struct SCOPE *NEW_SCOPE();

// Create Global Scope
struct SCOPE *INITIALIZE_SCOPE();

struct SCOPE *new_next_scope(struct SCOPE *curr_scope);

struct SCOPE *GOTO_PREV_SCOPE(struct SCOPE *curr_scope);

struct SCOPE * CHECK_SCOPE(symbol_node_t **symbol_table, char *symbol, struct SCOPE *curr_scope);

bool IS_IN_CURRENT_SCOPE(symbol_node_t **symbol_table, char *symbol, struct SCOPE *curr_scope);

#endif
