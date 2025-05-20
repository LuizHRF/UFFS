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
           | Token_Let
           | Token_Lam
           deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer ('+':cs) =        Token_Add : lexer cs
lexer ('*':cs) =        Token_Mul : lexer cs
lexer ('-':cs) =        Token_Sub : lexer cs
lexer ('=':'=':cs) =    Token_Eq : lexer cs
lexer ('>':'=':cs) =    Token_Geq : lexer cs
lexer ('/' : cs) =      Token_Lam : lexer cs

lexer (c:cs) | isSpace c = lexer cs
             | isDigit c = lexerNum (c:cs)
             | isAlpha c = lexer_Key_Words (c:cs)


lexerNum :: String -> [Token]
lexerNum cs = case span isDigit cs of
                (num, rest) -> Token_Num (read num) : lexer rest

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
                        ("LET", rest)   -> Token_Let    : lexer rest
                        _ -> error "Erro léxico - Palavra chave inválida"
