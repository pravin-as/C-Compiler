Implementation: 

1. Identifiers : 
   identifiers are all the variables used in the program, our lexical analyser detects the identifier if it is not a keyword ,constants or any of the    datatype for this detection we 
   have used the regular expression [a-zA-Z_][a-zA-Z0-9_]* this is standard way to declare the identifiers.
     
2. Data types: 
   we have directly passed the name of each data type in the auxillary function.
   and it is above the identifier so it will be matched by the dfa first giving the correct token.

3. Constants: Integer, float, string, and character literals , these are covered seperately inside the auxillary fuction.
 
4. Operators: All the arithmetic operators are covered in the single line in the auxillary fuction with the regex "+"|"-"|"*"|"/",
	       while logical operators are covered under regex "and"|"or"|"not"|"nand"|"xor"|"nor"|"xnor"|"^"|"|"|"<<"|">>"|"&"|"!"|"~" 
5. Statements:
   all the control flow and simple statement are covered, this is achieved by placing all the keywords used under statement under single regex, lexer return    the token for this statement as the control flow statement.    
6. Programmer defined functions/procedures: Definition and invocation are covered sperately under the line 27 and line 93, since in objective c function are    invoked using "- " in the begining so 
   we have written regex for the same to detect if it is at start of the line.
   
7. Comments : the regex we used for the muktiline comment is:  "/*"([^"\\\n]|\\.|\\\n)*"*/" 
              the regex for the single line comment : "//".*" "* 

8. Keywords : All the defined keywords are grouped under regex in line 49 of lex.l

9. Delimiters: All delimiters are covered individually.




------------------------------------------------------------------------------------------------------------------------------------------------------------


Steps to execute the program :-

1) Open terminal and go to the directory where you have this folder.

2) In terminal type $flex lex.l.
This will generate one .c file named as lex.yy.c

3) After this compile using gcc lex.yy.c 

4) Now run the program by &./a.out



------------------------------------------------------------------------------------------------------------------------------------------------------------



Example input/output of the function: 

input code : 
/* function returning the max between two numbers */
- (int) max:(int) num1 secondNumber:(int) num2 {
   
   /* local variable declaration */
   int result;
 
   if (num1 > num2) {
      result = num1;
   } else {
      result = num2;
   }
 
   return result; 

}

output of the lexical analyser: 


this is multi line Comments: /* function returning the max between two numbers */ 

this is function invocation: -  
(Data Type Integer: int 
) Identifier: max
:(Data Type Integer: int 
) Identifier: num1
 Identifier: secondNumber
:(Data Type Integer: int 
) Identifier: num2
 Delimiter: {

   
   this is multi line Comments: /* local variable declaration */ 

   Data Type Integer: int 
 Identifier: result
Delimiter: ;

 
   Keyword (Statements): if
 (Identifier: num1
 Relational Operator: >
 Identifier: num2
) Delimiter: {

      Identifier: result
 This is Assignment Operator: =
 Identifier: num1
Delimiter: ;

   Delimiter: }
 Keyword (Statements): else
 Delimiter: {

      Identifier: result
 This is Assignment Operator: =
 Identifier: num2
Delimiter: ;

   Delimiter: }

 
   Keyword (Statements): return
 Identifier: result
Delimiter: ;
Delimiter: }
               
