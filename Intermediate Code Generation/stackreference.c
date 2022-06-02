#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdio.h>

#define Stack
#define extra_needed 100
#define  var_size  100  
#define MAX_HEIGHT_OF_STACK   100  
#define var  "#REG"  

typedef struct s_n s_n;
typedef struct s s;
typedef struct extra_node extra_node;
typedef struct c_stack c_stack;

// structure for node of the s
struct s_n {
    int vm;
    char  symb_t [extra_needed ];
};

// strcuture for s, contains the top element, count of elements, and the an array of all elements
struct s {
    int top;
    int height;
    s_n arr_nodes[MAX_HEIGHT_OF_STACK];
};

struct extra_node {
    char code[var_size];
    struct extra_node *next;
};

struct c_stack {
    int top;
    extra_node *arr_nodes[extra_needed];
};

s *initialize_s();
void f_s(s *st);
s_n pop(s *st);
void st_p(s *st, extra_node *buf);
void st_psh(s *st, const char *symb_t);

c_stack *gt_th_st();
extra_node *child_n(c_stack *st);
void cd_t_print(c_stack *st);

extern bool EXTRA_UP;

/* Initialize s */

s *initialize_s(){

    // allocating memory for s
    s *st = (s *)malloc(sizeof(s));

    // check if s is NULL or not
    if(st==NULL)
    exit(-1);

    st->top = -1;
    st->height = 0;
    return st;
}


// disallocate the memory given to the s
void f_s(s *st){
    free(st);
}


// pop the top element of the s
s_n pop(s *st) {

    if(st->top == -1){
        printf("Tried popping from Empty Stack\n");
        exit(-1);
    }

    if(st->arr_nodes[st->top].vm != -1)
        st->height--;
    return st->arr_nodes[st->top--];
}

// pushing an element stored in symb_t to the s
void st_psh(s *st, const char *symb_t){

    // check if the s has already reached its capacity
    if(st->top >= MAX_HEIGHT_OF_STACK){
        printf("stack has now overflown");
        exit(-1);
    }

    st->top++;
    strcpy(st->arr_nodes[st->top].symb_t, symb_t);
    st->arr_nodes[st->top].vm = 0;

    if(!strcmp(symb_t, var)){
        st->arr_nodes[st->top].vm = st->height;
        st->height++;
        char buff[var_size];
        sprintf(buff, "%d", st->arr_nodes[st->top].vm);
        strcat(st->arr_nodes[st->top].symb_t, buff);
    }
    else
        st->arr_nodes[st->top].vm = -1;
}
// PRINTING THE CONTENT OF  c_stack
void print_all(extra_node *node) {

    // base condition
    if(node == NULL)
        return;

    print_all(node->next);

    printf("%s", node->code);
}

void cd_t_print(c_stack *sta) {
    print_all(sta->arr_nodes[sta->top]);
}

// CREATING A NEW NODE FOR  c_stack
extra_node *child_n(c_stack *sta) {

    extra_node *temp = malloc(sizeof(extra_node));
    temp->next = sta->arr_nodes[sta->top];
    sta->arr_nodes[sta->top] = temp;
    strcpy(temp->code, "");
    return temp;
}
// PRINTING THE HEAD OF STACK
void st_p(s *sta, extra_node *buf){

    // check if s is empty
    if(sta->top == -1) {
        printf("Stack is Empty, nothing to print");
        exit(-1);
    }
    if(EXTRA_UP)
        strcat(buf->code, sta->arr_nodes[sta->top].symb_t);
    else
        printf("%s", sta->arr_nodes[sta->top].symb_t);
}

//STACK IS INTIALIZED IN WHICH EVERYTHING WILL BE STORED
c_stack *gt_th_st() {

   // allocating memory for s
    c_stack *sta = malloc(sizeof(c_stack));
    sta->top = 0;
    for(int i=0; i<extra_needed; i++)
        sta->arr_nodes[i] = NULL;
    return sta;
}


