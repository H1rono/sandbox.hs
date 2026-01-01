-- map' f [] = []
-- map' f (x : xs) = f x : map' f xs
map' f = foldr (\x xs -> f x : xs) []

head' [] = Nothing
head' (x : xs) = Just x

tail' [] = []
tail' (_ : xs) = xs

take' _ [] = []
take' 0 _ = []
take' n (x : xs) = x : take' (n - 1) xs

drop' _ [] = []
drop' 0 xs = xs
drop' n (x : xs) = drop' (n - 1) xs

init' [] = []
init' [x] = []
init' (x : xs) = x : init' xs

at' _ [] = Nothing
at' 0 (x : _) = Just x
at' n (_ : xs) = at' (n - 1) xs

filter' _ [] = []
filter' f (x : xs) = if f x then x : filter' f xs else filter' f xs

reverse' [] = []
reverse' (x : xs) = reverse' xs `extend'` [x]

extend' xs [] = xs
extend' [] ys = ys
extend' (x : xs) ys = x : extend' xs ys

concat' [] = []
concat' [xs] = xs
concat' (xs : xss) = xs `extend'` concat' xss

zipWith' f [] _ = []
zipWith' f _ [] = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

zip' = zipWith' (,)

null' [] = True
null' _ = False

length' [] = 0
length' (_ : xs) = 1 + length' xs

elem' _ [] = False
elem' x (x' : xs) = x == x' || elem' x xs

all' _ [] = True
all' p (x : xs) = p x && all' p xs

any' _ [] = False
any' p (x : xs) = p x || any' p xs

foldl' f z [] = z
foldl' f z (x : xs) = foldl' f (z `f` x) xs

foldr' f z [] = z
foldr' f z (x : xs) = foldr' f (x `f` z) xs

sum' :: Num a => [a] -> a
sum' = foldr' (+) 0

product' :: Num a => [a] -> a
product' = foldr' (*) 1

repeat' x = x : repeat' x

iterate' f x = x : iterate' f (f x)
