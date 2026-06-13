grammar language ;


program
    : (class | functions | imports | statement)* EOF
    ;

statement
    : variable
    | loop
    | expr_statment
    | array
    | if_else
    | switch_case
    | print_statement
    | return_statement
    | file
    | exceptions
    ;



imports
         : INCLUDE EXCL MODULE_NAME EXCL ';!:'
         |  FROM EXCL MODULE_NAME EXCL INCLUDE NAME ';!:'
         ;

functions
         : FUN_TYPE? FUN NAME INTTTT EXCL NAME (','NAME)? EXCL
                    ':{'
                      (statement)*
                      RETURN INTTTT? NAME? ';!:'
                    '}:'
         | FUN_TYPE? FUN NAME CHARRRR EXCL NAME (','NAME)? EXCL
                    ':{'
                      (statement)*
                      RETURN CHARRRR? NAME? ';!:'
                    '}:'
         | FUN_TYPE? FUN NAME STRINGGGG EXCL NAME (','NAME)? EXCL
                   ':{'
                     (statement)*
                     RETURN STRINGGGG? NAME? ';!:'
                   '}:'
         | FUN_TYPE? FUN NAME BOOLEANNNN EXCL NAME (','NAME)? EXCL
                    ':{'
                      (statement)*
                      RETURN BOOLEANNNN? NAME? ';!:'
                    '}:'
         ;



variable
         : INTTTT NAME '=' INTLIT ';!:'
         | CHARRRR NAME '=' CHAR ';!:'
         | STRINGGGG NAME '=' STRING ';!:'
         | BOOLEANNNN NAME '=' (TRUE | FALSE) ';!:'
         ;





value
  :   CHAR
  |   STRING
  |   TRUE | FALSE
  |   INTLIT
  ;



loop
       : WHILE EXCL expr EXCL ':{' (statement)* '}:'
       | FOR NAME IN NAME ':{' (statement)* '}:'
       | FOR NAME IN RANGE EXCL value (',' NAME)? EXCL ':{' (statement)* '}:'
       ;


expr
       : NAME '=' expr
       | expr ('**') expr
       | expr op=('*' | '/' | '%') expr
       | expr op=('++' | '--' | '+' | '-') expr
       | expr op=('or' | 'and') expr
       | expr op=('==' | '!=' | '<=' | '=>') expr
       | expr op=('<' | '>') expr
       | '!' expr '!'
       | '!' expr
       | INTLIT
       | STRING
       | TRUE
       | FALSE
       | NAME
       ;
expr_statment
       : expr ';!:'
       | expr ('++' | '--') ';!:'
       ;

array
       : CHARRRR NAME '=' EXCL INTLIT+ EXCL CHARRRR ('{'value ((',' value)*)? '}')? ';!:'
       | INTTTT NAME '=' EXCL INTLIT+ EXCL INTTTT ('{'value ((',' value)*)? '}')? ';!:'
       | STRINGGGG NAME '=' EXCL INTLIT+ EXCL STRINGGGG ('{'value ((',' value)*)? '}')? ';!:'
       | BOOLEANNNN NAME '=' EXCL INTLIT+ EXCL BOOLEANNNN ('{'value ((',' value)*)? '}')? ';!:'
       ;

if_else
       : IF EXCL expr EXCL ':{'
         (statement)*
         '}:'
         (ELSE IF EXCL expr EXCL ':{'
         (statement)*
         '}:')*
         (ELSE ':{'
         (statement)*
         '}:')?
      ;

switch_case
      : SW EXCL NAME EXCL ':{'
        (CASE value ':'
        ((statement )*)?
        ('break' ';!:')?
        )*
        DEFAULT ':' EXCL
        ((statement )*)?
        ('break' ';!:')?
        EXCL
        '}:'
     ;

print_statement
     : PRINT EXCL (value| NAME) EXCL ';!:'
     ;
return_statement
     : RETURN (value| NAME) ';!:'
     ;

class
     :CLASS CLASS_NAME ':{'
         (array|variable|functions)*
      '}:'
     ;

file
     : NAME '=' OPEN EXCL '"' (NAME'.'TXT) '"' ',' '"' METHOD '"' EXCL ';!:'
     | (NAME'.') WRITE EXCL STRING EXCL ';!:'
     | (NAME'.') CLOSE EXCL EXCL ';!:'
     ;

exceptions
     : TRY ':{'
       (statement)* '}:'
       EXCEPT NAME ':{'
       (statement)* '}:'
     ;




COMMENT_ML
    : '#$' .*? '$#' -> skip
    ;

COMMENT_SL
    : '#' ~[\r\n]*  -> skip
    ;

fragment A: [aA];
fragment B: [bB];
fragment C: [cC];
fragment D: [dD];
fragment E: [eE];
fragment F: [fF];
fragment G: [gG];
fragment H: [hH];
fragment I: [iI];
fragment J: [jJ];
fragment K: [kK];
fragment L: [lL];
fragment M: [mM];
fragment N: [nN];
fragment O: [oO];
fragment P: [pP];
fragment Q: [qQ];
fragment R: [rR];
fragment S: [sS];
fragment T: [tT];
fragment U: [uU];
fragment V: [vV];
fragment W: [wW];
fragment X: [xX];
fragment Y: [yY];
fragment Z: [zZ];

INCLUDE: I N C L U D E;
FROM: F R O M;
PRINT: P R I N T;
FUN: F U N;
RETURN: R E T U R N;
IF: I F;
ELSE: E L S E;
CLASS: C L A S S;
WHILE: W H I L E;
FOR: F O R;
IN: I N;
RANGE: R A N G E;
SW: S W;
CASE: C A S E;
DEFAULT: D E F A U L T;
BREAK: B R E A K;
TRY: T R Y;
EXCEPT: E X C E P T;
OPEN: O P E N;
WRITE: W R I T E;
CLOSE: C L O S E;
TRUE: T R U E;
FALSE: F A L S E;
TXT: T X T;
INTTTT: I N T;
CHARRRR: C H A R;
STRINGGGG: S T R I N G;
BOOLEANNNN: B O O L E A N;



EXCL    : '!';

MODULE_NAME : [a-zA-Z@%][a-zA-Z0-9@%]*'.kh' ;


FUN_TYPE
         : 'Public'
         | 'Private'
         ;

METHOD
         : 'r'
         | 'w'
         ;

INTLIT  : [0-9]+ ;

CLASS_NAME : [A-Z][A-Z][a-zA-Z0-9@%]*;

NAME : [a-zA-Z@%] [a-zA-Z0-9@%]* ;
CHAR : '\'' [a-zA-Z@%] '\'' ;



STRING
     : '“' (~["\r\n])* '”'
     ;



WS : [ \t\r\n]+ -> skip;

