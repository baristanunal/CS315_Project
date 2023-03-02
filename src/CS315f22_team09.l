%{
#include <stdio.h>
%}

LETTER [a-zA-Z]
DIGIT [0-9]
SIGNS  [+-]
ALPHANUMERIC ({DIGIT}|{LETTER})*
URL_SIGNS \-|\.|\_|\~|\:|\/
URL_CHAR ({ALPHANUMERIC}|{URL_SIGNS})*
UNDER_SCORE	 \_
DQT	 \"
SQT \'
NL \n
HASHTAG \#
DOLLAR_SIGN \$
IDENTIFIER {LETTER}({ALPHANUMERIC}|{UNDER_SCORE})*
INT	 {SIGNS}?{DIGIT}+
FLOAT {SIGNS}?{DIGIT}*\.{DIGIT}+
STRING {DQT}[^\"]*{DQT}
CHAR {SQT}[^\']{SQT}
BOOLEAN true|TRUE|false|FALSE
WHILE while
RETURN return
FOR for
BAMCOUT bamcout
BAMUOUT bamuout
BAMCIN bamcin
BAMSIN bamsin
BAMUIN bamuin
BAMTIN bamtin
BAMSEL bamsel
BAMCONST bamconst
BAMCALL bamcall
SWITCH SWITCH
CONNECTION  {AT}{ALPHANUMERIC}
SENSOR_INSTANCE {DOLLAR_SIGN}{INT}
SENSOR SENSOR 
TIMER TIMER
URL {HASHTAG}{URL_CHAR}
IF if
ELSE else
FUNCT funct
LP \(
RP \)
LB \{
RB \}
LSB	 \[
RSB \]
COMMA \,
COLON \:
SC \;
PLUS \+
MUL \*
DIV \/
MOD \%
MINUS \-
LT \<
LEQ	 \<=
GT \>
GEQ	\>=
EE \=\=
NEQ \!\=
ARROW_OP \-\>
ASSIGN_OP \=
AND_OP \&\&
OR_OP \|\|
NOT_OP \!
INCREMENT \+\+
DECREMENT \-\-
AT \@
COMMENT \/\/(.*)\/\/
%%
{NL} { extern int lineno; lineno++;}
int return INT_TYPE;
float return FLOAT_TYPE;
string return STRING_TYPE;
boolean return BOOLEAN_TYPE;
char return CHAR_TYPE;
{URL} return URL;
{SENSOR} return SENSOR;
{SENSOR_INSTANCE} return SENSOR_INSTANCE;
{BOOLEAN} return BOOLEAN;
{STRING} return STRING;
{INT} return INT;
{FLOAT} return FLOAT;
{CHAR} return CHAR;
{WHILE} return WHILE;
{FOR} return FOR;
{RETURN} return RETURN;
{BAMCOUT} return BAMCOUT;
{BAMCIN} return BAMCIN;
{BAMSEL} return BAMSEL;
{BAMTIN} return BAMTIN;
{BAMUIN} return BAMUIN;
{BAMSIN} return BAMSIN;
{BAMUOUT} return BAMUOUT;
{BAMCONST} return BAMCONST;
{BAMCALL} return BAMCALL;
{FUNCT} return FUNCT;
{CONNECTION} return CONNECTION;
{TIMER} return TIMER;

{SWITCH} return SWITCH;

{IF} return IF;
{ELSE} return ELSE;
{IDENTIFIER} return IDENTIFIER;
{ARROW_OP} return ARROW_OP;
{UNDER_SCORE} return UNDER_SCORE;
{LP} return LP;
{RP} return RP;
{LB} return LB;
{RB} return RB;
{LSB} return LSB;
{RSB} return RSB;
{COMMA} return COMMA;
{COLON} return COLON;
{SC} return SC;
{PLUS} return PLUS;
{MUL} return MUL;
{DIV} return DIV;
{MOD} return MOD;
{MINUS} return MINUS;
{LT} return LT;
{LEQ} return LEQ;
{GT} return GT;
{GEQ} return GEQ;
{EE} return EE;
{NEQ} return NEQ;
{ASSIGN_OP} return ASSIGN_OP;
{AND_OP} return AND_OP;
{OR_OP} return OR_OP;
{NOT_OP} return NOT_OP;
{INCREMENT} return INCREMENT;
{DECREMENT} return DECREMENT;
{COMMENT} return COMMENT;
. ;
%%
int yywrap() { return 1; }