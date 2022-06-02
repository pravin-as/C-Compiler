/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_SYNTAX_TAB_H_INCLUDED
# define YY_YY_SYNTAX_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    Defination = 258,
    Delimiter = 259,
    Function_Invocator = 260,
    Function_Invocker = 261,
    Primitive_Data_Type = 262,
    Primitive_Data_Type_s = 263,
    Derived_data_type = 264,
    Keyword = 265,
    Operator = 266,
    simple_statement = 267,
    control_flow = 268,
    Fpri = 269,
    user_defined_function = 270,
    Header_Files = 271,
    Single_line_comment = 272,
    Multi_line_comment = 273,
    Identifier = 274,
    Data_Type_Constant_Fraction = 275,
    Data_Type_Constant_Negative_Fraction = 276,
    Data_Type_Constant_Integer = 277,
    Data_Type_Constant_Negative_Integer = 278,
    Data_Type_Constant_String = 279,
    Special_character = 280,
    Semi_colon = 281,
    While_ = 282,
    System_defined_function = 283,
    colon = 284,
    Equal_to_Operator = 285,
    Opening = 286,
    CLosing = 287,
    Comma = 288,
    if_ = 289,
    Opening_curly_bracket = 290,
    CLosing_curly_brackett = 291,
    else_ = 292,
    for_ = 293,
    Data_Type_NSArray = 294,
    Data_Type_Char_s = 295,
    Data_Type_NSObject = 296,
    control_flow_special = 297,
    Special_ADDITion_on_Function = 298,
    keyword_Void = 299,
    CompartorOperator = 300,
    BinaryOperator = 301,
    Interface = 302,
    Property = 303,
    Implementation = 304,
    End = 305,
    Delimiter_for_arr_1 = 306,
    Delimiter_for_arr_2 = 307,
    AND = 308,
    OR = 309
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SYNTAX_TAB_H_INCLUDED  */
