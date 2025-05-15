module TypeChecker where 

import Lexer 


-- or, not, mul, sub, eq, geq
typeof :: Expr -> Maybe Ty 
typeof (Num _) = Just TNum 
typeof BFalse = Just TBool 
typeof BTrue = Just TBool 
typeof (Add e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof (And e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TBool, Just TBool) -> Just TBool 
                       _                        -> Nothing 
typeof (If e1 e2 e3) = 
    case (typeof e1) of 
      Just TBool -> case (typeof e2, typeof e3) of 
                      (Just t1, Just t2) | t1 == t2  -> Just t1  
                                         | otherwise -> Nothing 
                      _ -> Nothing 
      _ -> Nothing 
typeof (Or e1 e2) = case (typeof e1, typeof e2) of
                        (Just TBool, Just TBool) -> Just TBool
                        _                         -> Nothing
typeof (Not e) = if (typeof e) == typeof(BTrue) then Just TBool else Nothing
typeof (Mul e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof (Sub e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof (Eq e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof (Geq e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing

typecheck :: Expr -> Expr 
typecheck e = case typeof e of
                Just _    -> e
                _         -> error "Erro de tipo"


