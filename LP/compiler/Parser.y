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
    '+'     {Token_Add}
    '-'     {Token_Sub}
    '*'     {Token_Mul}
    IF      {Token_If}
    THEN    {Token_Then}
    ELSE    {Token_Else}
    AND     {Token_And}
    OR      {Token_Or}
    NOT     {Token_Not}
    ">="    {Token_Geq}
    "=="    {Token_Eq}

%nonassoc IF THEN ELSE

%left ">=" "=="
%left '+' '-'
%left '*'
%left AND OR
%right NOT


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


{
parseError :: [Token] -> a
parseError _ = error "Erro sintático!"
}