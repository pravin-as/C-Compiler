
#ifndef Stack
#define Stack

#define extra_needed 100
#define  var_size  100  
#define MAX_HEIGHT_OF_STACK   100  
#define var  "#REG"  
typedef struct s_n  s_n; 
typedef struct s  s; 
typedef struct extra_node  extra_node;
typedef struct c_stack  c_stack ;  
struct s_n {
    long long int vm; // -1 if it isn't a temporary variable
    char symb_t[var_size];
};

struct s {
    long long int top;
    long long int height;
    s_n arr_nodes[MAX_HEIGHT_OF_STACK];
};

struct extra_node {
    char code[var_size];
    struct extra_node *next;
};

struct c_stack {
    long long int top;
    extra_node *arr_nodes[extra_needed];
};

s *initialize_s();
void f_s(s *st);
s_n pop ( s *st );
void st_p (s *st, extra_node *buf);
void st_psh (s *st, const char *symb_t);

c_stack *gt_th_st();
extra_node *child_n(c_stack *st);
void cd_t_print (c_stack *st);

#endif
