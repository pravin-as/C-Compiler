%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *fp;

%}

 
%token Defination 
%token Delimiter
%token Function_Invocator
%token Function_Invocker
%token Primitive_Data_Type
%token Primitive_Data_Type_s
%token Derived_data_type
%token Keyword
%token Operator
%token simple_statement
%token control_flow
%token Fpri
%token user_defined_function
%token Header_Files
%token Single_line_comment
%token Multi_line_comment
%token Identifier 
%token Data_Type_Constant_Fraction 
%token Data_Type_Constant_Negative_Fraction
%token Data_Type_Constant_Integer 
%token Data_Type_Constant_Negative_Integer   
%token Data_Type_Constant_String  
%token Special_character
%token Semi_colon
%token While_
%token System_defined_function
%token colon
%token Equal_to_Operator
%token Opening 
%token  CLosing
%token Comma
%token if_
%token Opening_curly_bracket
%token  CLosing_curly_brackett
%token else_
%token for_
%token Data_Type_NSArray
%token Data_Type_Char_s 
%token Data_Type_NSObject
%token control_flow_special
%token Special_ADDITion_on_Function
%token keyword_Void
%token CompartorOperator
%token BinaryOperator
%token Interface
%token Property
%token Implementation
%token End
%token Delimiter_for_arr_1
%token Delimiter_for_arr_2
%left '+'
%left '*' '/' '%'




%left AND OR
%left '<' '>' Operator    
%%
Here_We_Start : Start_Symbol {  printf("the Start_Symbol line is error free !!!") ; } 
Start_Symbol:  Start_Symbol Funct  {  printf("Start_Symbol Funct\n") ; } 
    | Start_Symbol Declaration  {  printf("Start_Symbol Declaration\n") ; }
    | Start_Symbol HeaderFile  {  printf("Start_Symbol HeaderFile\n") ; }
    | HeaderFile {  printf("HeaderFile\n") ; }
    | Funct   {  printf("Funct\n") ; }
    | Declaration  {  printf("Declaration \n") ; }
     ;




Declaration: Type Assignment Semi_colon  {  printf("Type Assignment Semi_colon! : Declaration\n") ; }
    |Assignment Semi_colon {printf("Assignment Semi_colon : Declaration "); }    
    | FunctCall  Semi_colon  {  printf("FunctCall  Semi_colon : Declaration") ; }
    | ArrayUsage  Semi_colon  {  printf("ArrayUsage  Semi_colon : Declaration ") ; }
    | Type ArrayUsage  Semi_colon   {  printf("Type ArrayUsage  Semi_colon : Declaration ") ; }
    | DDTstmnt  Semi_colon   {  printf("Semi_colon : Declaration  ") ; }
    | CompoundStmt  { printf("Compound Statement : Declaration ") ; }
    | Interfaceimp
    ;

HeaderFile: Header_Files CompartorOperator Identifier CompartorOperator
;


Assignment: Identifier Equal_to_Operator Assignment
    | Identifier Equal_to_Operator FunctCall
    | Identifier Delimiter_for_arr_1 Assignment Delimiter_for_arr_2
    | Identifier Equal_to_Operator ArrayUsage
    | ArrayUsage Equal_to_Operator Assignment
    | Identifier Comma Assignment
    | Identifier Operator Assignment
    |  Data_Type_Constant_String Operator Assignment 
    |  Primitive_Data_Type_s Operator Assignment
    |Primitive_Data_Type_s Comma Assignment
    |Data_Type_Constant_String Comma  Assignment
    | Data_Type_Constant_Fraction Comma Assignment |  Data_Type_Constant_Negative_Fraction  Comma Assignment | Data_Type_Constant_Integer Comma Assignment | Data_Type_Constant_Negative_Integer Comma Assignment
    | Data_Type_Constant_Fraction Operator Assignment |  Data_Type_Constant_Negative_Fraction Operator Assignment | Data_Type_Constant_Integer Operator Assignment | Data_Type_Constant_Negative_Integer Operator Assignment 
    |  Primitive_Data_Type_s
    |  Data_Type_Constant_String
    
    | '\'' Assignment '\''
    | Opening Assignment CLosing
    | Operator Opening Assignment CLosing
    
    | '-' Identifier
    |   Data_Type_Constant_Fraction |  Data_Type_Constant_Negative_Fraction | Data_Type_Constant_Integer | Data_Type_Constant_Negative_Integer
    |   Identifier {printf("identifier from the Assignment"); }
    ;


FunctCall : Identifier Opening CLosing
    | Identifier Opening Assignment CLosing
    | Identifier Special_ADDITion_on_Function  Opening CLosing
    | Identifier  Special_ADDITion_on_Function Opening Assignment CLosing
    ;


ArrayUsage : Delimiter_for_arr_1 Assignment Delimiter_for_arr_2
    ;


Funct: Function_Invocator Type Identifier colon   ArgListOpt   CompoundStmt  {printf("Here we are at the Funct Type in the identifier"); }
    | Function_Invocator Type Identifier Opening  ArgListOpt CLosing CompoundStmt
    ;

ArgListOpt: ArgList 
    | theArgList
    |
    ; 
theArgList :  Type Identifier Identifier colon theArgList |   Type Identifier   | Type Identifier Identifier theArgList   ;  

ArgList:  ArgList Comma Arg
    | Arg
    ;
Arg:    Type Identifier 
    ;
CompoundStmt:   Opening_curly_bracket StmtList CLosing_curly_brackett  { printf("over here at the line where we have Compound statement\n"); }  
    ;
StmtList:   StmtList Stmt
    |
    ;
Stmt: WhileStmt
    | Declaration
    | ForStmt
    | Multi_line_comment
    | Single_line_comment
    | IfStmt
    | PrintFunc
    | ArrayUsage Semi_colon
    | Property Declaration
    | Implementation Identifier Semi_colon
    | control_flow Semi_colon
    | control_flow_special Semi_colon
    | control_flow_special Identifier Semi_colon
    | control_flow_special Data_Type_Constant_Fraction Semi_colon |  control_flow_special Data_Type_Constant_Negative_Fraction Semi_colon| control_flow_special  Data_Type_Constant_Integer Semi_colon | control_flow_special Data_Type_Constant_Negative_Integer Semi_colon
    
    ;


Type:   Primitive_Data_Type  { printf("Type Primitive_Data_Type : Identifier\n"); }  
    |   Primitive_Data_Type_s   { printf("Type Primitive_Data_Type_s : Identifier\n"); }  
    |   keyword_Void   { printf("Type Keyword_Void: Identifier\n"); }  
    |   Opening Primitive_Data_Type CLosing  { printf("Opening Primitive_Data_Type CLosing: Identifier\n"); }  
    |   Opening Primitive_Data_Type_s CLosing  { printf("Opening Primitive_Data_Type_s CLosing: Identifier\n"); }  
    ;



DDTstmnt: Derived_data_type Identifier Opening_curly_bracket StmtList CLosing_curly_brackett
    ;


/* IfStmt Block */
IfStmt : if_ Opening Expr CLosing
        CompoundStmt 
        | if_ Opening Expr CLosing
        CompoundStmt  Elsa
    ;

Elsa : 
     else_     CompoundStmt
     | else_ IfStmt;


ForStmt: for_ Opening Expr Semi_colon Expr Semi_colon  Expr CLosing Stmt
       | for_ Opening Expr Semi_colon Expr Semi_colon Expr CLosing CompoundStmt
       | for_ Opening Expr CLosing Stmt
       | for_ Opening Expr CLosing CompoundStmt
    ;



WhileStmt: While_ Opening Expr CLosing Stmt
    | While_ Opening Expr CLosing CompoundStmt
    ;


 
    ;


PrintFunc : System_defined_function Opening Expr CLosing Semi_colon
    ;

/*Expression Block*/
Expr:
    | Expr Operator Expr { printf("Expression operation: Expression\n ");}
    | Expr CompartorOperator Expr { printf("Expression Comparator: Expression \n");} 
    | Expr BinaryOperator Expr  {printf("Expression Binary Operator: Expression");   }
    | Assignment { printf("Assignment: Expression \n");}
    | ArrayUsage 
    | Type Assignment
    
   
    ; 

Interfaceimp :  Interface Identifier colon Keyword CompoundStmt 
                | Interface Identifier colon Keyword StmtList End
                | Interface Identifier colon Data_Type_NSObject CompoundStmt   
                 | Interface Identifier colon Data_Type_NSObject StmtList End 
                | Implementation Identifier Semi_colon
                                        
%%
#include"lex.yy.c"
#include<ctype.h>
int count=0;

int main(int argc, char *argv[])
{
    yyin = fopen(argv[1], "r");

   if(!yyparse())
        printf("\nNo syntax error found! :)\n");
    else
        printf("\nThe code has syntax error! (:\n");

    fclose(yyin);
    return 0;
}

yyerror(char *s) {
    printf("%d : %s %s\n", yylineno, s, yytext );
}
