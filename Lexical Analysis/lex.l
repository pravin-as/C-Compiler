%{




int total_Delimiters = 0;
int total_identifiers = 0 ;
int total_keyword =0 ;
int total_integer = 0 ;
int total_string = 0 ;
int total_statement = 0 ;
int total_headerfiles = 0;
int total_fraction = 0 ;
int total_special_character = 0;
int total_operators = 0 ;
int total_function = 0 ;
%}





%%

['][a-zA-Z0-9_][']    { printf("this is Character: %s \n",yytext);}
"/*"([^"\\\n]|\\.|\\\n)*"*/"   { printf("this is multi line Comments: %s \n",yytext);}
^[-][ ]  {printf("this is function invocation: %s \n",yytext);}
#.* {total_headerfiles++; printf("Directive Header Files: %s\n",yytext);}

[''|,|;|{|}|.|_] {total_Delimiters++; printf("Delimiter: %s\n",yytext);}

[[]] {total_Delimiters++; printf("Delimiter: %s\n",yytext);}

"#"|"$"|"%" {total_special_character++; printf("Special Character: %s\n",yytext);}

"["|"]" {total_Delimiters++; printf("Delimiter: %s\n",yytext);}


"="  {total_operators++; printf("This is Assignment Operator: %s\n",yytext);}


"+"|"-"|"*"|"/"  {total_operators++; printf("Arithmatic Operator: %s\n",yytext);}

"and"|"or"|"not"|"nand"|"xor"|"nor"|"xnor"|"^"|"|"|"<<"|">>"|"&"|"!"|"~"  {total_operators++; printf("Logical Operators: %s\n",yytext);}

"<="|">="|"++"|"!="|"=="|"<"|">"  {total_operators++; printf("Relational Operator: %s\n",yytext);}


("true")|("false")|("characrterIndex")|("stringWithFormat")|("isEqualToString")|("BOOL")|("_Packed")|("NSMutableString")|("stringWithCapacity")|("appendFormat")|("atIndex")|("NSSLog")|("@interface")|("@property")|("@implementation")|("self")|("super")|("@end")|("init")|("getInfo")|("alloc")|("uppercaseString")|("Nslog")|("auto")|("enum")|("register")|("typedef")|("case")|("extern")|("void")|("static")|("protocol")|("interface")|("property")|("nonatomic;")|("retain")|("unsafe_retained")|("readwrite")|("readonly")|("goto")|("sizeof")|("const")|("@autoreleasepool") {total_keyword++; printf("keyword  : %s \n", yytext) ;  }

("int")|("NSinteger")|("NSNumber") {

  total_keyword++;
  printf("Data Type Integer: %s \n", yytext);

 }

("float")
   {
     total_keyword++;    printf("Data Type Float: %s \n",     yytext);
   }

("CGfloat") {

    total_keyword++;
    printf("Data Type CGFLOAT: %s \n",     yytext);
  } 
  
("union") {printf("This derived Data type : %s \n" , yytext); }  


"Double"  {

   total_keyword++;
    printf("Data Type Double : %s \n",     yytext);
  }

"NSArray" { total_keyword++; printf("Data type Array : %s \n" ,yytext); }

("NSString")|("string") { total_keyword++;  printf("Datatype String  %s \n", yytext); }

("char") { total_keyword++; printf("Data Type Character : %s \n", yytext); }

("NSObject")  { total_keyword++; printf("Object : %s \n" ,yytext); }




("if")|("if"\()|("else")|("case")|("while")|("while"\()|("do")|("break")|("return")|("continue")|("return")|("EOF")|("switch")|("switch"\()|("goto") {total_keyword++; printf("Keyword (Statements): %s\n",yytext);}

("sizeof")|("long")|("short")|("typedef")|("unsigned")|("void")|("static") {total_keyword++;  printf("Keyword:%s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]*\( {total_function++; printf("Function: %s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {total_identifiers++; printf("Identifier: %s\n",yytext);}

[0-9]*"."[0-9]+ {total_fraction++;printf("Fraction(Double) : %s\n", yytext);}

[-][0-9]*"."[0-9]+ {total_fraction++;printf("Negative Fraction : %s\n", yytext);}




[0-9]+ {total_integer++; printf("Integer: %s\n",yytext);}

"-"[0-9]+ {total_integer++; printf("Negative Integer: %s\n",yytext);}

["]([^"\\\n]|\\.|\\\n)*["] {total_string++; printf("String:%s \n",yytext);}
"//".*" "*    { printf("this is single line Commments: %s \n",yytext);}




%%

int yywrap()
{
        return 1;
}


int main(void)
{

       /*\most of teh coder is directly taken from the class teachings\*/
       printf("Enter String \n");
        
       yylex();
       /* printf("\nvowel=%d and Consonent=%d \n",vowel,cons); */
printf("total_identifiers: %d \n", total_identifiers);
printf("total_keywords: %d \n", total_keyword);
printf("total_strings: %d \n", total_integer);
printf("total_statements: %d \n", total_statement);
printf("total_headerfiles: %d \n", total_headerfiles);
printf("total_fractions : %d \n", total_fraction);
printf("total_specialcharacters: %d \n", total_special_character);
printf("total_operators: %d \n", total_operators);
printf("total_functions: %d \n", total_function);

        return 0;
}





