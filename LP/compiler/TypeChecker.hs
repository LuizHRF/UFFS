module TypeChecker where 

import Lexer 

type Ctx = [(String, Ty)]

-- or, not, mul, sub, eq, geq
typeof :: Ctx -> Expr -> Maybe Ty 
typeof ctx (Num _) = Just TNum 
typeof ctx BFalse = Just TBool 
typeof ctx BTrue = Just TBool 
typeof ctx (Add e1 e2) = case (typeof ctx  e1, typeof ctx  e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof ctx (And e1 e2) = case (typeof ctx  e1, typeof ctx  e2) of 
                       (Just TBool, Just TBool) -> Just TBool 
                       _                        -> Nothing 
typeof ctx  (If e1 e2 e3) = 
    case (typeof ctx  e1) of 
      Just TBool -> case (typeof ctx e2, typeof ctx e3) of 
                      (Just t1, Just t2) | t1 == t2  -> Just t1  
                                         | otherwise -> Nothing 
                      _ -> Nothing 
      _ -> Nothing 
typeof ctx (Or e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                        (Just TBool, Just TBool) -> Just TBool
                        _                         -> Nothing
typeof ctx (Not e) = if (typeof ctx e) == typeof ctx (BTrue) then Just TBool else Nothing
typeof ctx (Mul e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof ctx (Sub e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof ctx (Eq e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof ctx (Geq e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing

typeof ctx (Var v) = lookup v ctx

typeof ctx (Lam x t e1) = case typeof ctx' e1 of
                            Just t2   -> Just (TFun t t2)  
                            _         -> Nothing
                          where ctx' = (x, t) : ctx

typeof ctx (App e1 e2) = 
  case (typeof ctx e1) of
    Just (TFun t1 t2) -> case typeof ctx e2 of
                          Just t3 -> if t3 == t1 then Just t2 else Nothing
                          _ -> Nothing
    _ -> Nothing

typeof ctx (Paren e) = typeof ctx e

typeof ctx (Let x e1 e2) = case typeof ctx e1 of
                                Just t  -> typeof ctx' e2 where
                                                            ctx' = (x, t) : ctx
                                _       -> Nothing

typeof ctx (Error _) = Just TNum

typecheck :: Expr -> Expr 
typecheck e = case typeof [] e of
                Just _    -> e
                _         -> error "Erro de tipo"

