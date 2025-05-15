module Interpreter where 

import Lexer 

isValue :: Expr -> Bool 
isValue BTrue       = True
isValue BFalse      = True
isValue (Num _)     = True
isValue _           = False

step :: Expr -> Expr 
step (Add (Num n1) (Num n2)) = Num (n1 + n2)     -- S-Add
step (Add (Num n1) e2) = let e2' = step e2       -- S-Add2
                           in Add (Num n1) e2' 
step (Add e1 e2) = Add (step e1) e2              -- S-Add1
step (And BTrue e2) = e2 
step (And BFalse e2) = BFalse 
step (And e1 e2) = And (step e1) e2 
step (If BTrue e1 e2) = e1 
step (If BFalse e1 e2) = e2
step (If e e1 e2) = If (step e) e1 e2 
step (Mul (Num n1) (Num n2)) = Num (n1*n2)
step (Mul (Num n1) e) = Mul (Num n1) (step e)
step (Mul e1 e2) = Mul (step e1) e2
step (Sub (Num n) (Num n2)) = Num (n-n2)
step (Or BTrue e1) = BTrue
step (Or BFalse e1) = e1
step (Not BTrue) = BFalse
step (Not BFalse) = BTrue
step (Eq (Num n1) (Num n2)) = if n1==n2 then BTrue else BFalse
step (Eq (Num n1) e2) = Eq (Num n1) (step e2)
step (Eq e1 e2) = Eq (step e1) e2
step (Geq (Num n1) (Num n2)) = if n1>=n2 then BTrue else BFalse
step (Geq (Num n1) e2) = Geq (Num n1) (step e2)
step (Geq e1 e2) = Geq (step e1) e2

eval :: Expr -> Expr 
eval e | isValue e = e
       | otherwise = eval (step e)
