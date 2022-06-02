In this Assignment all the codes are constructed using online references and class slides , and we have used the lex file from the previous Assignment . 

The syntax analyser cover almost everything of Objective C from general statement to complex class. 
The codes in the lex and yacc file intentionally outputs a lot of statement to track the flow of the program.
The code shows warning on execution but those can be ignored since we have tested it on many programs it works fine.

Steps to excute the code:
	1) Move in to the working directory where the program is stored. 
	2) Execute the command "bison -d syntax.y".
	3) Execute the command "flex lexer_project.l". 
	4) After executing these commands syntax.tab.c , syntax.tab.h and lex.yy.c will be generated. 
	5) compile the syntax.tab.c file with gcc compiler using the command "gcc syntax.tab.c -ll".
	6) Executable file a.out will be generated and execute it with giving the test file as the input with command
	   "./a.out test". To run with error free input file run command "./a.out test" ond to run with syntax error input file
	   run command "./a.out test2".


Note::the part for taking program through files is taken from our batchmates. 


The output on running the syntax analyser on perfect code :

*********************************************************************************************************************************************************************************************

	->PERFECT code:
		
			@implementation XYZ ;
			@interface Idk : NSObject
			{ 
			 
			@property NSString *tishang;
			 
			 
			 

			}

			- (int) max:(int) num1 secondNumber:(int) num2 {

			   // array declaration of data type double.
			   double one [ 10 ] ;
			   
			   // array declaration of data type int.
			   int two [ 10 ] ;
			   
			   // array declaration of data type string.
			   string three [ 10 ] ; 

			   // string delaration.   
			   string four =  "string is defined" ; 
			   
			   // for loop.
			   for (  int i = 0 ;  i < n ; i =  i + 1     ) { 
					NSlog ( "This is in for loop" ) ; 
					NSlog (" Multiple statements ") ;
			      }
			   
			   // Nested for loop.
			   for (  int i = 0 ;  i < n ; i =  i + 1     ) { 
				    for (  int j = 0 ;  j < n ; j =  j + 1     ) { 
				       for (  int k = 0 ;  k < n ; k =  k + 1     ) { 
				       NSlog ( "Nested for loop" ) ; 
			    }
			    }   
			    }
			    
			    // while loop
			    while (a < b && a < 100 ) 
			   {  
			     NSlog ( "In the while loop" ) ; 
			     a = a + 1;
			       
			   }
			   
			   
			   // Nested while loop
			   while (a < b && a < 100 ) 
			   {  
			     while (a < b && a < 100 ) 
			   {  
			     NSlog ( "In the while loop" ) ; 
			     a = a + 1;
			       
			   }
			       
			   }
			   
			   
			   
			   /* variable declaration */
			   int result;
			   
			   
			  // conditional if
			  if ((num1 * 3 + num1) > num2)   
			    {
			      result = num1;
			   } else {
			      result = num2;
			   } 
			   
			 
			   return result; 
			}
			
			
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	-> OUTPUT:
			@implementation 
			 42 XYZ
			13 ;
			Declaration 
			@interface 
			 42 Idk
			14 :
			30 NSObject
			4  {
			@property 
			28 NSString
			19 *
			 42 tishang
			13 ;
			identifier from the AssignmentAssignment Semi_colon : Declaration 5 }
			over here at the line where we have Compound statement
			Start_Symbol Declaration
			9  - 
			1 (
			23 int
			3  )
			Opening Primitive_Data_Type CLosing: Identifier
			 42 max
			14 :
			1 (
			23 int
			3  )
			Opening Primitive_Data_Type CLosing: Identifier
			 42 num1
			 42 secondNumber
			14 :
			1 (
			23 int
			3  )
			Opening Primitive_Data_Type CLosing: Identifier
			 42 num2
			4  {
			48 // array declaration of data type double.
			26 double
			Type Primitive_Data_Type : Identifier
			 42 one
			17 [
			45 10
			16 ]
			13 ;
			Type Assignment Semi_colon! : Declaration
			48 // array declaration of data type int.
			23 int
			Type Primitive_Data_Type : Identifier
			 42 two
			17 [
			45 10
			16 ]
			13 ;
			Type Assignment Semi_colon! : Declaration
			48 // array declaration of data type string.
			28 string
			 42 three
			Type Primitive_Data_Type_s : Identifier
			17 [
			45 10
			16 ]
			13 ;
			Type Assignment Semi_colon! : Declaration
			48 // string delaration.   
			28 string
			 42 four
			Type Primitive_Data_Type_s : Identifier
			18 =
			47 "string is defined"
			13 ;
			Type Assignment Semi_colon! : Declaration
			48 // for loop.
			35 for
			1 (
			23 int
			Type Primitive_Data_Type : Identifier
			 42 i
			18 =
			45 0
			13 ;
			 42 i
			21 <
			identifier from the AssignmentAssignment: Expression 
			 42 n
			13 ;
			identifier from the AssignmentAssignment: Expression 
			Expression Comparator: Expression 
			 42 i
			18 =
			 42 i
			19 +
			45 1
			3  )
			Assignment: Expression 
			4  {
			38 NSlog
			1 (
			47 "This is in for loop"
			3  )
			Assignment: Expression 
			13 ;
			38 NSlog
			1 (
			47 " Multiple statements "
			3  )
			Assignment: Expression 
			13 ;
			5 }
			over here at the line where we have Compound statement
			Compound Statement : Declaration 48 // Nested for loop.
			35 for
			1 (
			23 int
			Type Primitive_Data_Type : Identifier
			 42 i
			18 =
			45 0
			13 ;
			 42 i
			21 <
			identifier from the AssignmentAssignment: Expression 
			 42 n
			13 ;
			identifier from the AssignmentAssignment: Expression 
			Expression Comparator: Expression 
			 42 i
			18 =
			 42 i
			19 +
			45 1
			3  )
			Assignment: Expression 
			4  {
			35 for
			1 (
			23 int
			Type Primitive_Data_Type : Identifier
			 42 j
			18 =
			45 0
			13 ;
			 42 j
			21 <
			identifier from the AssignmentAssignment: Expression 
			 42 n
			13 ;
			identifier from the AssignmentAssignment: Expression 
			Expression Comparator: Expression 
			 42 j
			18 =
			 42 j
			19 +
			45 1
			3  )
			Assignment: Expression 
			4  {
			35 for
			1 (
			23 int
			Type Primitive_Data_Type : Identifier
			 42 k
			18 =
			45 0
			13 ;
			 42 k
			21 <
			identifier from the AssignmentAssignment: Expression 
			 42 n
			13 ;
			identifier from the AssignmentAssignment: Expression 
			Expression Comparator: Expression 
			 42 k
			18 =
			 42 k
			19 +
			45 1
			3  )
			Assignment: Expression 
			4  {
			38 NSlog
			1 (
			47 "Nested for loop"
			3  )
			Assignment: Expression 
			13 ;
			5 }
			over here at the line where we have Compound statement
			Compound Statement : Declaration 5 }
			over here at the line where we have Compound statement
			Compound Statement : Declaration 5 }
			over here at the line where we have Compound statement
			Compound Statement : Declaration 48 // while loop
			33 while
			1 (
			 42 a
			21 <
			identifier from the AssignmentAssignment: Expression 
			 42 b
			20 &
			identifier from the AssignmentAssignment: Expression 
			20 &
			 42 a
			21 <
			identifier from the AssignmentAssignment: Expression 
			45 100
			3  )
			Assignment: Expression 
			Expression Comparator: Expression 
			Expression Binary Operator: ExpressionExpression Binary Operator: ExpressionExpression Comparator: Expression 
			4  {
			38 NSlog
			1 (
			47 "In the while loop"
			3  )
			Assignment: Expression 
			13 ;
			 42 a
			18 =
			 42 a
			19 +
			45 1
			13 ;
			Assignment Semi_colon : Declaration 5 }
			over here at the line where we have Compound statement
			Compound Statement : Declaration 48 // Nested while loop
			33 while
			1 (
			 42 a
			21 <
			identifier from the AssignmentAssignment: Expression 
			 42 b
			20 &
			identifier from the AssignmentAssignment: Expression 
			20 &
			 42 a
			21 <
			identifier from the AssignmentAssignment: Expression 
			45 100
			3  )
			Assignment: Expression 
			Expression Comparator: Expression 
			Expression Binary Operator: ExpressionExpression Binary Operator: ExpressionExpression Comparator: Expression 
			4  {
			33 while
			1 (
			 42 a
			21 <
			identifier from the AssignmentAssignment: Expression 
			 42 b
			20 &
			identifier from the AssignmentAssignment: Expression 
			20 &
			 42 a
			21 <
			identifier from the AssignmentAssignment: Expression 
			45 100
			3  )
			Assignment: Expression 
			Expression Comparator: Expression 
			Expression Binary Operator: ExpressionExpression Binary Operator: ExpressionExpression Comparator: Expression 
			4  {
			38 NSlog
			1 (
			47 "In the while loop"
			3  )
			Assignment: Expression 
			13 ;
			 42 a
			18 =
			 42 a
			19 +
			45 1
			13 ;
			Assignment Semi_colon : Declaration 5 }
			over here at the line where we have Compound statement
			Compound Statement : Declaration 5 }
			over here at the line where we have Compound statement
			Compound Statement : Declaration 8
			23 int
			Type Primitive_Data_Type : Identifier
			 42 result
			13 ;
			identifier from the AssignmentType Assignment Semi_colon! : Declaration
			48 // conditional if
			32 if
			1 (
			1 (
			 42 num1
			19 *
			45 3
			19 +
			 42 num1
			3  )
			identifier from the AssignmentAssignment: Expression 
			21 >
			 42 num2
			3  )
			identifier from the AssignmentAssignment: Expression 
			Expression Comparator: Expression 
			4  {
			 42 result
			18 =
			 42 num1
			13 ;
			identifier from the AssignmentAssignment Semi_colon : Declaration 5 }
			over here at the line where we have Compound statement
			34 else
			4  {
			 42 result
			18 =
			 42 num2
			13 ;
			identifier from the AssignmentAssignment Semi_colon : Declaration 5 }
			over here at the line where we have Compound statement
			2 return
			 42 result
			13 ;
			5 }
			over here at the line where we have Compound statement
			Here we are at the Funct Type in the identifierstart Funct
			the Start_Symbol line is error free !!!
			No syntax error found! :)

*********************************************************************************************************************************************************************************************
	
	The output on running the syntax analyser on code containing some error :
	-> code with error : It is the same running code we have just removed semi colon to make the syntax wrong.
			@implementation XYZ ;
			@interface Idk : NSObject
			{ 
			 
			@property NSString *tishang;
			 
			 
			 

			}

			- (int) max:(int) num1 secondNumber:(int) num2 {

			   // array declaration of data type double.
			   double one [ 10 ] ;
			   
			   // array declaration of data type int.
			   int two [ 10 ] ;
			   
			   // array declaration of data type string.
			   string three [ 10 ] ; 

			   // string delaration.   WE HAVE REMOVED SEMI - COLON FROM THIS LINE TO MAKE THE SYNTAX OF THIS CODE WRONG.
			   string four =  "string is defined" 
			   
			   // for loop.
			   for (  int i = 0 ;  i < n ; i =  i + 1     ) { 
					NSlog ( "This is in for loop" ) ; 
					NSlog (" Multiple statements ") ;
			      }
			   
			   // Nested for loop.
			   for (  int i = 0 ;  i < n ; i =  i + 1     ) { 
				    for (  int j = 0 ;  j < n ; j =  j + 1     ) { 
				       for (  int k = 0 ;  k < n ; k =  k + 1     ) { 
				       NSlog ( "Nested for loop" ) ; 
			    }
			    }   
			    }
			    
			    // while loop
			    while (a < b && a < 100 ) 
			   {  
			     NSlog ( "In the while loop" ) ; 
			     a = a + 1;
			       
			   }
			   
			   
			   // Nested while loop
			   while (a < b && a < 100 ) 
			   {  
			     while (a < b && a < 100 ) 
			   {  
			     NSlog ( "In the while loop" ) ; 
			     a = a + 1;
			       
			   }
			       
			   }
			   
			   
			   
			   /* variable declaration */
			   int result;
			   
			   
			  // conditional if
			  if ((num1 * 3 + num1) > num2)   
			    {
			      result = num1;
			   } else {
			      result = num2;
			   } 
			   
			 
			   return result; 
			}
	
	
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	-> output
	
	
			@implementation 
			 42 XYZ
			13 ;
			Declaration 
			@interface 
			 42 Idk
			14 :
			30 NSObject
			4  {
			@property 
			28 NSString
			19 *
			 42 tishang
			13 ;
			identifier from the AssignmentAssignment Semi_colon : Declaration 5 }
			over here at the line where we have Compound statement
			Start_Symbol Declaration
			9  - 
			1 (
			23 int
			3  )
			Opening Primitive_Data_Type CLosing: Identifier
			 42 max
			14 :
			1 (
			23 int
			3  )
			Opening Primitive_Data_Type CLosing: Identifier
			 42 num1
			 42 secondNumber
			14 :
			1 (
			23 int
			3  )
			Opening Primitive_Data_Type CLosing: Identifier
			 42 num2
			4  {
			48 // array declaration of data type double.
			26 double
			Type Primitive_Data_Type : Identifier
			 42 one
			17 [
			45 10
			16 ]
			13 ;
			Type Assignment Semi_colon! : Declaration
			48 // array declaration of data type int.
			23 int
			Type Primitive_Data_Type : Identifier
			 42 two
			17 [
			45 10
			16 ]
			13 ;
			Type Assignment Semi_colon! : Declaration
			48 // array declaration of data type string.
			28 string
			 42 three
			Type Primitive_Data_Type_s : Identifier
			17 [
			45 10
			16 ]
			13 ;
			Type Assignment Semi_colon! : Declaration
			48 // string delaration.   
			28 string
			 42 four
			Type Primitive_Data_Type_s : Identifier
			18 =
			47 "string is defined"
			48 // for loop.
			100 : syntax error // for loop.

			The code has syntax error! (:

**********************************************************************************************************************************************************************************************
	
	
	
	
	
	
	
	
	
