-- Desafio do tipo algbrico Nat
-- Luiz Faccio - 2211100003

module DesafioNat where

data Nat = Zero
         | Suc Nat
         deriving Show

zero = Zero
um = Suc Zero
dois = Suc um
tres = Suc dois
quatro = Suc tres

nat2integer :: Nat -> Int
nat2integer (Zero) = 0
nat2integer (Suc n) = nat2integer n + 1

integer2nat :: Int -> Nat
integer2nat 0 = Zero
integer2nat i = Suc (integer2nat (i - 1))

(<+>) :: Nat -> Nat -> Nat
(<+>) Zero na = na
(<+>) na Zero = na
(<+>) (Suc n) (Suc n2) = (<+>) n (Suc (Suc n2))

(<->) :: Nat -> Nat -> Nat
(<->) Zero na = Zero
(<->) na Zero = na
(<->) (Suc n1) (Suc n2) = (<->) n1 n2

(<**>) :: Nat -> Nat -> Nat
(<**>) Zero na = Zero
(<**>) na Zero = Zero
(<**>) (Suc Zero) na = na
(<**>) na (Suc Zero) = na
(<**>) (Suc n1) (Suc n2) =  (<+>) (Suc n2) ((<**>) n1 (Suc n2))
