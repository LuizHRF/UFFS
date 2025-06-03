module Interpreter where 

import Lexer 

isValue :: Expr -> Bool 
isValue BTrue        = True
isValue BFalse       = True
isValue (Num _)      = True
isValue (Lam _ _ _)  = True
isValue _            = False

subst :: String -> Expr -> Expr -> Expr
subst v e (Var x) = if x==v then e else (Var x)
subst v e (Lam n t ex) = Lam n t (subst v e ex)
subst v e (App e1 e2) = App (subst v e e1) (subst v e e2)

subst v e BTrue = BTrue
subst v e BFalse = BFalse
subst v e (Num x) = Num x
subst v e (Add e1 e2) = Add (subst v e e1) (subst v e e2)
subst v e (Sub e1 e2) = Sub (subst v e e1) (subst v e e2)
subst v e (And e1 e2) = And (subst v e e1) (subst v e e2)
subst v e (Or e1 e2) = Or (subst v e e1) (subst v e e2)
subst v e (Mul e1 e2) = Mul (subst v e e1) (subst v e e2)
subst v e (If e1 e2 e3) = If (subst v e e1) (subst v e e2) (subst v e e3)
subst v e (Not e1) = Not (subst v e e1)
subst v e (Eq e1 e2) = Eq (subst v e e1) (subst v e e2)
subst v e (Geq e1 e2) = Geq (subst v e e1) (subst v e e2)
subst v e (Paren e1) = Paren (subst v e e1)

subst v e (Let x e1 e2) = Let x (subst v e e1) (subst v e e2)

subst v e (Try e1 e2) = Try (subst v e e1) (subst v e e2)
subst v e (Raise e1) = Raise (subst v e e1)

subst v e (Error) = Error

step :: Expr -> Expr 
step (Paren e) = e

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
step (Not e) = Not (step e)

step (Eq (Num n1) (Num n2)) = if n1==n2 then BTrue else BFalse
step (Eq (Num n1) e2) = Eq (Num n1) (step e2)
step (Eq e1 e2) = Eq (step e1) e2

step (Geq (Num n1) (Num n2)) = if n1>=n2 then BTrue else BFalse
step (Geq (Num n1) e2) = Geq (Num n1) (step e2)
step (Geq e1 e2) = Geq (step e1) e2

step (App (Raise e1) e2) = step (Raise e1)
step (App e1 (Raise e2)) = step (Raise e2)

step (Raise e1) = if isValue e1 then e1 else (Raise (step e1))

step (Raise (Raise e)) = (Raise e)

step (Try e@(Raise e1) e2) = if isValue e1 then (App e2 e1) else (Try (step e) e2)
step (Try e1 e2) = if isValue e1 then e1 else (Try (step e1) e2)

step (Error) = Error

step (App Error e1) = Error
step (App e Error) = if isValue e then Error else (App (step e) Error)

step (App b@(Lam x t e1) v) | isValue v = subst x v e1
                          | otherwise = step (App b (step v))

step (App e1 e2) = App (step e1) e2

step (Let v e1 e2) | isValue e1 = subst v e1 e2
                   | otherwise = (Let v (step e1) e2)



eval :: Expr -> Expr 
eval e | isValue e = e
       | otherwise = eval (step e)