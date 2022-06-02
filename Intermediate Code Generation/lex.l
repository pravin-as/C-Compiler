strcpy(yylval.char_ptr, yytext); 
%%
;             {  
                    trace("Semi_colon");  
                    return Semi_colon ;  
              }
              
"("           { 
                     printf("1 %s\n", yytext);  
                     trace("Opening") ; 
                     return Opening;  
              }
              
"return"      {         printf("2 %s\n", yytext); 
                        trace("control_flow_special") ; 
                        return control_flow_special; 
              } 
              
")"           { 
                 printf("3  %s\n", yytext); 
                 trace("CLosing") ;
                 return CLosing;
              } 
                 
"{"           { 
                printf("4  %s\n", yytext); 
                trace("Opening_curly_bracket");  
                return Opening_curly_bracket; 
              }
              

"}"           {  
                 printf("5 %s\n", yytext); 
                 trace("CLosing_curly_brackett") ;
                 return CLosing_curly_brackett; 
              }   
","           { 
                 printf("6 %s\n", yytext);  
                 trace("Comma"); 
                 return Comma;
              }

['][a-zA-Z0-9_][']    {  
                       printf("7  %s\n", yytext);   
                       trace("Primitive_Data_Type"); 
                       return Primitive_Data_Type;}
"/*"([^"\\\n]|\\.|\\\n)*"*/"   {   printf("8\n");  
                                   trace("Multi_line_comment");
                                   return Multi_line_comment;
                               }
^[-][ ]                        {   printf("9  %s\n", yytext);  
                                   trace("Function_Invocator"); 
                                   return Function_Invocator; 
                               }
"#import"                      {   
                                   printf("10  %s\n", yytext); 
                                   trace("Header_Files");
                                   return  Header_Files; 
                               } 
"#define"                      {    
                                       printf("11  %s\n", yytext);  
                                       trace("Defination") ; 
                                       return  Defination;
                                }

[''|.|_]                        {       yylval=atoi(yytext); 
                                        printf("12\n");
                                        trace("Delimiter");
                                        return Delimiter ; }  

:                               { 
                                        printf("14 %s\n", yytext);
                                        trace("colon"); 
                                        return colon; }

[\t]                             printf("15 %s\n", yytext);    return 0 ; 
[ \n]                           {    
                                 yylineno = yylineno + 1; 
                                } 

"#"|"$"|"%"                     {  
                                 yylval=atoi(yytext); 
                                 printf("16 %s\n", yytext);  
                                 trace("Special_character");
                                 return Special_character ;}

"["                             {  yylval=atoi(yytext);printf("17 %s\n", yytext);
                                   trace("Delimiter_for_arr_1");
                                   return Delimiter_for_arr_1 ;
                                 }

"]"                             {  yylval=atoi(yytext);printf("16 %s\n", yytext); 
                                   trace("Delimiter_for_arr_2"); 
                                   return Delimiter_for_arr_2 ;}
"="                              {  yylval=atoi(yytext);printf("18 %s\n", yytext); 
                                    trace("Equal_to_Operator");
                                    return Equal_to_Operator ;}


"+"                              {     yylval=atoi(yytext); printf("19 %s\n", yytext); 
                                       trace("ADD_Operator");
                                       return  ADD_Operator ;}
"-"                              {     yylval=atoi(yytext); printf("20 %s\n", yytext); 
                                       trace("SUB_Operator");
                                       return  SUB_Operator ;}
"*"                              {     yylval=atoi(yytext); printf("21 %s\n", yytext); 
                                       trace("MUL_Operator");
                                       return  MUL_Operator ;}
"/"                               {    yylval=atoi(yytext); printf("22 %s\n", yytext); 
                                       trace("DIV_Operator");
                                       return  DIV_Operator ;}

"and"                             {  yylval=atoi(yytext);printf("23 %s\n", yytext);  trace("and");    
				       return     AND_BinaryOperator ;}
"or"                              {  yylval=atoi(yytext);printf("24 %s\n", yytext);  trace("or");   
				       return   OR_BinaryOperator ;}
"not"                             {  yylval=atoi(yytext);printf("25 %s\n", yytext);  trace("not"); 
				       return  	Not_BinaryOperator ;}
"nand"                   	 {  yylval=atoi(yytext);printf("26 %s\n", yytext);  trace("and");   
				       return  NAND _BinaryOperator ;}
"xor"                   	 {  yylval=atoi(yytext);printf("27 %s\n", yytext);  trace("xor"); 
                    		       return  XOR_BinaryOperator ;}
"nor"			         {  yylval=atoi(yytext);printf("28 %s\n", yytext);  trace("nor");  
                                        return  NOR_BinaryOperator ;}
"xnor"				 {  yylval=atoi(yytext);printf("29 %s\n", yytext);  trace("xnor");   
				       return  XNOR_BinaryOperator ;}
"^="  				 {  yylval=atoi(yytext);printf("30 %s\n", yytext);  trace("xor_assign");     
				       return  XOR_ASSIGN_BinaryOperator ;}
"|"  				 {  yylval=atoi(yytext);printf("31 %s\n", yytext);  trace("bitwise_or");     					       return  Bitwise_or_BinaryOperator ;}
"<<" 				 {  yylval=atoi(yytext);printf("32 %s\n", yytext);  trace("left_shift");     					       return  Left_shift_BinaryOperator ;}
">>" 				 {  yylval=atoi(yytext);printf("33 %s\n", yytext);  trace("right_shift");     					       return  Right_shift_BinaryOperator ;}
"&"  				 {  yylval=atoi(yytext);printf("34 %s\n", yytext);  trace("Bitwise_and");     					       return  And_BinaryOperator ;}
"~"  				 {  yylval=atoi(yytext);printf("35 %s\n", yytext);  trace("negation");    				       return  negation_BinaryOperator ;}

"<="  				 {  yylval=atoi(yytext);  printf("36 %s\n", yytext);   trace("less"); 
				       return  	less_than_equal_to_CompartorOperator ;}
">="  				{  yylval=atoi(yytext);  printf("37 %s\n", yytext);   return  greater_than_equal_to_CompartorOperator ;}
"++" 				{  yylval=atoi(yytext);  printf("38 %s\n", yytext);   return  CompartorOperator ;}
"!="  				{  yylval=atoi(yytext);  printf("39 %s\n", yytext);   return  CompartorOperator ;}
"==" 				{  yylval=atoi(yytext);  printf("40 %s\n", yytext);   return  CompartorOperator ;}
"<" 				{  yylval=atoi(yytext);  printf("41 %s\n", yytext);   return  CompartorOperator ;}
">"  				{  yylval=atoi(yytext);  printf("42 %s\n", yytext);   return  CompartorOperator ;}


[\s] ;
("true")|("false")|("characrterIndex")|("stringWithFormat")|("isEqualToString")|("BOOL")|("_Packed")|("NSMutableString")|("stringWithCapacity")|("appendFormat")|("atIndex")|("NSSLog")|("self")|("super")|("init")|("getInfo")|("alloc")|("uppercaseString")|("auto")|("enum")|("register")|("typedef")|("case")|("extern")|("static")|("protocol")|("interface")|("property")|("nonatomic;")|("retain")|("unsafe_retained")|("readwrite")|("readonly")|("goto")|("sizeof")|("const")|("@autoreleasepool") {  yylval=atoi(yytext);        printf("22 %s\n", yytext);           return Keyword ; }

("int")|("NSinteger")|("NSNumber")|("float")  {

  printf("23 %s\n", yytext);          return Primitive_Data_Type; }

("@interface")  {printf("%s \n" , yytext); return Interface; }
("@property")   {printf("%s \n" , yytext); return Property; } 
("@implementation")   {printf("%s \n" , yytext); return Implementation; }
("@end")  { printf("%s \n" , yytext ); return End;  }   
("CGfloat") {

 printf("24 %s\n", yytext);    return Primitive_Data_Type ;
  } 
  
("union")|"struct" {printf("25 %s\n", yytext);  return Derived_data_type ; }  


"double"  {

  printf("26 %s\n", yytext);   return Primitive_Data_Type;
  }

"NSArray" {printf("27 %s\n", yytext);   return Data_Type_NSArray; }

("NSString")|("string")|("using")|("namespace") {printf("28 %s\n", yytext);   return Primitive_Data_Type_s ;}

("char") {printf("29 %s\n", yytext);  return Data_Type_Char_s; }

("NSObject")  { printf("30 %s\n", yytext);  return Data_Type_NSObject ; }

("break")|("continue") {printf("31 %s\n", yytext);  return control_flow;} 


("if")|"case"  {printf("32 %s\n", yytext);  return if_;}
("while") {printf("33 %s\n", yytext);  return While_ ; }

("else") {printf("34 %s\n", yytext);  return else_;}

"for" {printf("35 %s\n", yytext);  return for_;}

("switch")|("switch"\()|("goto")|("for")|("EOF")  {printf("36 %s\n", yytext);  return control_flow;}

("sizeof")|("long")|("short")|("typedef")|("unsigned")|("static") {printf("37 %s\n", yytext);  return Keyword ;} 
("NSlog")|("min")|("scanf")  printf("38 %s\n", yytext);  {return System_defined_function;}
"void"    {printf("39 %s\n", yytext);  return keyword_Void ; }



[a-zA-Z_][a-zA-Z0-9_]+"(" {printf("40 %s\n", yytext);  return user_defined_function; }  

"<<<"[0-9]+", "[0-9]+">>>" { printf("41 %s\n", yytext);  return Special_ADDITion_on_Function; }

[a-zA-Z_][a-zA-Z0-9_]* {printf(" 42 %s\n" , yytext);  return Identifier ;}

[0-9]*"."[0-9]+ {   yylval=atoi(yytext);  printf("43 %s\n", yytext);   return Data_Type_Constant_Fraction ;}

[-][0-9]*"."[0-9]+ { yylval=atoi(yytext); printf("44 %s\n", yytext);     return Data_Type_Constant_Negative_Fraction ;}




[0-9]+ { yylval=atoi(yytext);  printf("45 %s\n", yytext);    return Data_Type_Constant_Integer ;}

"-"[0-9]+ {  yylval=atoi(yytext); printf("46 %s\n", yytext);     return Data_Type_Constant_Negative_Integer ;}

["]([^"\\\n]|\\.|\\\n)*["] { yylval=atoi(yytext);  printf("47 %s\n", yytext);    return Data_Type_Constant_String;}
"//".*" "*    {  yylval=atoi(yytext);  printf("48 %s\n", yytext);    return Single_line_comment ;}




%%

 





