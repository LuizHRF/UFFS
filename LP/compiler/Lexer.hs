module Lexer where 
import Data.Char

data Expr = BTrue 
          | BFalse 
          | Num Int 
          | Add Expr Expr 
          | Sub Expr Expr
          | Mul Expr Expr
          | And Expr Expr 
          | Or Expr Expr
          | Not Expr
          | If Expr Expr Expr
          | Eq Expr Expr
          | Geq Expr Expr 

          | Var String
          | Lam String Ty Expr
          | App Expr Expr
          | Paren Expr

          | Let String Expr Expr

          | Try Expr Expr
          | Raise Expr
          | Error
          deriving Show 

data Ty = TBool 
        | TNum 
        | TFun Ty Ty
        deriving (Show, Eq)

data Token = Token_True
           | Token_False
           | Token_Num Int
           | Token_Add
           | Token_And
           | Token_If
           | Token_Then
           | Token_Else
           | Token_Sub
           | Token_Mul
           | Token_Not
           | Token_Or
           | Token_Geq
           | Token_Eq
           | Token_Lam
           | Token_Var String
           | Token_Seta
           | Token_Colon
           | Token_TNum
           | Token_TBool
           | Token_Lparen
           | Token_Rparen
           | Token_Let
           | Token_Atb
           | Token_In
           
           | Token_Try
           | Token_Raise
           | Token_With
           | Token_Error

           deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer ('+':cs) =        Token_Add : lexer cs
lexer ('*':cs) =        Token_Mul : lexer cs
lexer ('-':'>':cs) =    Token_Seta : lexer cs
lexer ('-':cs) =        Token_Sub : lexer cs
lexer ('=':'=':cs) =    Token_Eq : lexer cs
lexer ('=':cs) =        Token_Atb : lexer cs
lexer ('>':'=':cs) =    Token_Geq : lexer cs
lexer (':': cs) =       Token_Colon : lexer cs
lexer ('(': cs) =       Token_Lparen : lexer cs
lexer (')': cs) =       Token_Rparen : lexer cs


lexer (c:cs) | isSpace c = lexer cs
             | isDigit c = lexerNum (c:cs)
             | isAlpha c = lexer_Key_Words (c:cs)


lexerNum :: String -> [Token]
lexerNum cs = case span isDigit cs of (num, rest) -> Token_Num (read num) : lexer rest

lexer_Key_Words :: String-> [Token]
lexer_Key_Words cs = case span isAlpha cs of
                        ("TRUE", rest)  -> Token_True   : lexer rest
                        ("FALSE", rest) -> Token_False  : lexer rest
                        ("AND", rest)   -> Token_And    : lexer rest
                        ("IF", rest)    -> Token_If     : lexer rest
                        ("THEN", rest)  -> Token_Then   : lexer rest
                        ("ELSE", rest)  -> Token_Else   : lexer rest
                        ("NOT", rest)   -> Token_Not    : lexer rest
                        ("OR", rest)    -> Token_Or     : lexer rest
                        ("LAMBDA", rest)-> Token_Lam    : lexer rest
                        ("NUM", rest)   -> Token_TNum   : lexer rest
                        ("BOOL", rest)  -> Token_TBool  : lexer rest
                        ("LET", rest)   -> Token_Let    : lexer rest
                        ("IN", rest)    -> Token_In     : lexer rest
                        ("TRY", rest)   -> Token_Try    : lexer rest
                        ("WITH", rest)  -> Token_With   : lexer rest
                        ("RAISE", rest) -> Token_Raise  : lexer rest
                        ("ERROR", rest) -> Token_Error  : lexer rest
                        (var, rest)     -> Token_Var var: lexer rest