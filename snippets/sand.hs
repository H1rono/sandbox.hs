{-# OPTIONS -Wall -Werror #-}

head' :: [a] -> a
head' [] = error "err"
head' (x : _) = x

max' :: Ord a => a -> a -> a
max' x y
  | x < y = y
  | otherwise = y

maximum' :: Ord a => [a] -> a
maximum' [] = error "err"
maximum' [a] = a
maximum' (x : xs) = max' x $ maximum' xs

replicate' :: Int -> a -> [a]
replicate' n x =
  let ord = n `compare` 0
   in case ord of
        LT -> error "error"
        EQ -> []
        GT -> x : replicate' (n - 1) x

take' :: Int -> [a] -> [a]
take' _ [] = []
take' n (x : xs)
  | n <= 0 = []
  | otherwise = x : take' (n - 1) xs

concat' :: [a] -> [a] -> [a]
concat' [] xs = xs
concat' xs [] = xs
concat' (x : xs) ys = x : concat' xs ys

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x : xs) = reverse' xs `concat'` [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x (y : ys)
  | x == y = True
  | otherwise = elem' x ys

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x : xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f $ f x

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

filp' :: (a -> b -> c) -> (b -> a -> c)
filp' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x : xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x : xs)
  | f x = x : filter' f xs
  | otherwise = filter' f xs

quicksort' :: Ord a => [a] -> [a]
quicksort' [] = []
quicksort' (x : xs) = filter' (<= x) xs ++ [x] ++ filter' (> x) xs

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x : xs)
  | f x = x : takeWhile' f xs
  | otherwise = []
