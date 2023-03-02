%{
#include <stdio.h>
%}

%token INT_TYPE
%token FLOAT_TYPE
%token STRING_TYPE
%token BOOLEAN_TYPE
%token CHAR_TYPE
%token URL
%token SENSOR
%token SENSOR_INSTANCE
%token BOOLEAN
%token STRING
%token INT
%token FLOAT
%token CHAR
%token WHILE
%token FOR
%token RETURN
%token BAMCOUT
%token BAMUOUT
%token BAMCIN
%token BAMSEL
%token BAMUIN
%token BAMTIN
%token BAMSIN
%token BAMCONST
%token BAMCALL
%token FUNCT
%token CONNECTION
%token SWITCH
%token TIMER
%token IF
%token ELSE
%token IDENTIFIER
%token ARROW_OP
%token UNDER_SCORE
%token LP
%token RP
%token LB
%token RB
%token LSB
%token RSB
%token COMMA
%token COLON
%token SC
%token PLUS
%token MUL
%token DIV
%token MOD
%token MINUS
%token LT
%token LEQ
%token GT
%token GEQ
%token EE
%token NEQ
%token ARROW_OP
%token ASSIGN_OP
%token AND_OP
%token OR_OP
%token NOT_OP
%token INCREMENT
%token DECREMENT
%token AT
%token COMMENT
%token DOLLAR_SIGN
%start start_stmt

%%

// 1.1Program
//Rule of Start
start_stmt: stmt_list { if ( isDone) { printf("\rInput program is valid.\n"); } }
stmt_list: stmt SC | stmt_list stmt SC 

// 1.2 Statements
stmt: if_stmt
    | while_loop
    | for_loop
    | id_decleration
    | const_id_decleration
    | assign_stmt
    | increment_stmt
    | decrement_stmt
    | return_stmt
    | io
    | function_stmt
    | COMMENT
    | con_sw_stmt 
    | error 
    | FOR error RB 
    | WHILE error RB 
    | IF error RB 

  //  | error RB SC  {yyerrok;}
   // | error SC {yyerrok;}
// 1.3 Loops
while_loop: WHILE LP cond_expr RP LB stmt_list RB
for_loop: FOR LP id_decleration SC cond_expr SC assign_stmt RP LB stmt_list RB
        | FOR LP id_decleration SC cond_expr SC increment_stmt RP LB stmt_list RB
        | FOR LP id_decleration SC cond_expr SC decrement_stmt RP LB stmt_list RB 

// 1.4 Types
primitive_type: INT_TYPE
              | FLOAT_TYPE
              | STRING_TYPE
              | BOOLEAN_TYPE
              | CHAR_TYPE



// 1.5 Expressions
expression: arith_expr | cond_expr | STRING | CHAR

increment_stmt: IDENTIFIER INCREMENT

decrement_stmt: IDENTIFIER DECREMENT

arith_expr: arith_expr PLUS term
          | arith_expr MINUS term
          | term

term: term MUL factor
    | term DIV factor
    | term MOD factor
    | factor

factor: LP arith_expr RP
      | IDENTIFIER
      | INT
      | FLOAT

cond_expr: cond_expr OR_OP cond_expr_and
         | cond_expr_and

cond_expr_and: cond_expr_and AND_OP cond_expr_element
         | cond_expr_element

cond_expr_element: LP cond_expr RP
                 | relational_expr
                 | func_call
                 | BOOLEAN
                 | NOT_OP cond_expr_element
// TODO

relational_expr: relational_expr_element relational_op relational_expr_element

relational_expr_element: INT
                        | FLOAT
                        | IDENTIFIER
                        | func_call
                        | BOOLEAN
                        
// TODO

// 1.6 Operands
relational_op: LT
             | LEQ
             | GT
             | GEQ
             | EE
             | NEQ



//1.7 our lex directly return INDETIFIER so we do not need to define indetifier here

// 1.8 Declaration and Assignment
id_decleration: primitive_type IDENTIFIER ASSIGN_OP expression

const_id_decleration: BAMCONST primitive_type IDENTIFIER ASSIGN_OP expression

assign_stmt: IDENTIFIER ASSIGN_OP expression

// TODO url sensor_select


// 1.9 Connection, Sensor and Switches
connection_stmt: CONNECTION ARROW_OP URL
        

con_sw_stmt:	connection_stmt
				| switch_stmt
                | sensor_select
                
sensor_select: 	BAMSEL LP SENSOR_INSTANCE RP

switch_stmt: 	SWITCH ASSIGN_OP BOOLEAN



// 1.10 Input Output
io: input_stmt | output_stmt

input_stmt: 	  	connection_input
					| timer_input
					| sensor_input
                    | url_input
                    
connection_input:	BAMCIN LP IDENTIFIER COMMA CONNECTION RP

timer_input:		BAMTIN LP IDENTIFIER COMMA TIMER RP

sensor_input:		BAMSIN LP IDENTIFIER COMMA SENSOR RP



output_stmt:        connection_output
					| url_output

connection_output:  BAMCOUT LP INT COMMA CONNECTION RP


url_input:			BAMUIN LP IDENTIFIER COMMA URL RP

url_output:         BAMUOUT LP INT COMMA URL RP



//           | BAMCOUT LP func_call COMMA CONNECTION RP
// TODO delete bodies


// 1.11 Comments
// we directly get COMMENT

// 1.12 If Statements
if_stmt: IF LP cond_expr RP LB stmt_list RB
       | IF LP cond_expr RP LB stmt_list RB ELSE LB stmt_list RB

// 1.13 Function Declaration and Calls

function_stmt: func_dec | func_call

func_dec: FUNCT IDENTIFIER LP parameter_list RP LB stmt_list RB
        | FUNCT IDENTIFIER LP RP LB stmt_list RB

parameter_list: parameter_list COMMA IDENTIFIER
              | IDENTIFIER

func_call: BAMCALL IDENTIFIER LP parameter_list RP

return_stmt: RETURN expression

// 1.14 Symbols and Alphanumerics
// we do not need them since our lex don't give us this data, we handle this usage in lex


%%
#include "lex.yy.c"
int lineno = 1;
int isDone = 1;
int yyerror(char *s) { printf("Syntax error on line %d !\n", lineno); isDone =0; }
int main(){
    return yyparse();
}

