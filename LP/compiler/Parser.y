{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error {parseError}

%token
    num     {Token_Num $$}
    TRUE    {Token_True}
    FALSE   {Token_False}
    "->"    {Token_Seta}
    '+'     {Token_Add}
    '-'     {Token_Sub}
    '*'     {Token_Mul}
    IF      {Token_If}
    THEN    {Token_Then}
    ELSE    {Token_Else}
    AND     {Token_And}
    OR      {Token_Or}
    NOT     {Token_Not}
    '='     {Token_Atb}
    ">="    {Token_Geq}
    "=="    {Token_Eq}
    var     {Token_Var $$}
    LAMBDA  {Token_Lam}
    ':'     {Token_Colon}
    NUM     {Token_TNum}
    BOOL    {Token_TBool}
    '('     {Token_Lparen}
    ')'     {Token_Rparen}
    LET     {Token_Let}
    IN      {Token_In}
    WITH    {Token_With}
    RAISE   {Token_Raise}
    TRY     {Token_Try}
    ERROR   {Token_Error}

%nonassoc IF THEN ELSE BOOL NUM LAMBDA ':' "->" '(' ')' TRY WITH ERROR

%left ">=" "=="
%left '+' '-'
%left '*'
%left AND OR
%right NOT var '=' LET RAISE


%%

Exp : num                           { Num $1 }
    | TRUE                          { BTrue }
    | FALSE                         { BFalse }
    | Exp '+' Exp                   { Add $1 $3}
    | Exp '-' Exp                   { Sub $1 $3 }
    | Exp '*' Exp                   { Mul $1 $3}
    | Exp AND Exp                   { And $1 $3}
    | Exp OR Exp                    { Or $1 $3}
    | NOT Exp                       { Not $2}
    | Exp "==" Exp                  { Eq $1 $3}
    | Exp ">=" Exp                  { Geq $1 $3}
    | IF Exp THEN Exp ELSE Exp      { If $2 $4 $6}
    | LAMBDA var ':' Type "->" Exp  { Lam $2 $4 $6}
    | Exp Exp                       { App $1 $2}
    | var                           { Var $1}
    | '(' Exp ')'                   { Paren $2}
    | LET var '=' Exp IN Exp        { Let $2 $4 $6}
    | TRY Exp WITH Exp              { Try $2 $4}
    | RAISE Exp                     { Raise $2}
    | ERROR                         { Error}

Type : NUM                          { TNum }
     | BOOL                         { TBool }
     | '('Type "->" Type')'         { TFun $2 $4 }


{
parseError :: [Token] -> a
parseError _ = error "Erro sintático!"
}