module Exercicios where 

--1 
salarioLiquido salBase = salBase*1.03

-- 2
conceito n1 n2 n3 | mp >= 8 = 'A'
                | mp >= 7 = 'B'
                | mp >= 6 = 'C'
                | mp >= 5 = 'D'
                | otherwise = 'E'
                where mp = (n1*2 + n2*3 + n3*5)/10

--3
precoRetrato :: Integer -> String -> Double
precoRetrato p d = let extra | d == "domingo" = 1.2
                             | d == "sábado" = 1.2
                             | otherwise = 1
                    in vp * extra
                    where vp | p == 1 = 100
                             | p == 2 = 130
                             | p == 3 = 150
                             | p == 4 = 165
                             | p == 5 = 175
                             | p == 6 = 180
                             | p >= 7 = 185

--4
fatDuplo 0 = 1
fatDuplo 1 = 1
fatDuplo n = (fatDuplo (n - 2)) * n

-- 5
expo x 0 = 1
expo x n = x * (expo x (n-1))

-- 6
-- salarioAtual :: Num a => a -> a -> a -> a
salarioAtual s a b = f s 0.015 (b - a)
                        where
                            f x y z | z == 1 = x * (y + 1)
                                    | otherwise = f (x* (y+1)) (y*2) (z-1) 
