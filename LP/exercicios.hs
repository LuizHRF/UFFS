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

--7
ultimo :: [a] -> a
ultimo (x:xs) | null xs = x
              | otherwise = ultimo xs

--8
primeiros :: [a] -> [a]
primeiros (x:xs) | null xs = []
                 | otherwise = x : primeiros xs

--9
multiplicaListas :: Num a => [a] -> [a] -> [a]
multiplicaListas (x:xs) (y:ys) | null xs || null ys = [(x*y)]
                               | otherwise = (x*y) : multiplicaListas xs ys

--10 / 11 / 12

data Produto = Pe Int String Int Bool SellType
             | NPe Int String String Int SellType
             deriving Show

data SellType = Unidade | Peso
                deriving Show

verificaVal :: Produto -> Int -> Bool
verificaVal (NPe _ _ _ _ _) _ = True
verificaVal (Pe _ _ anov _ _) anoa = anov >= anoa 

p1 = Pe 122 "Banana" 2024 True Peso
p2 = Pe 111 "Pizza" 2025 True Unidade   
p3 = NPe 999 "Sabonete" "Nivea" 2024 Unidade

-- 13

--14
func :: Num a => [a] -> a
func (x:xs) | null xs = x
func (x:xs) = x + head xs
func [] = 0

--15
count :: [a] -> Int
count l = foldl (\x y -> x+1) 0 l