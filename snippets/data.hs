data Shape = Rect Double Double | Tri Double Double

area :: Shape -> Double
area (Rect x y) = x * y
area (Tri x y) = x * y / 2

data Person = Person {name :: String, age :: Int}

taro = Person {name = "taro", age = 20}

inc p = p {age = age p + 1}

data Point = Pt Double Double

instance Eq Point where
  (Pt x y) == (Pt x' y') = x == x' && y == y'
