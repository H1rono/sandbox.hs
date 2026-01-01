data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node y lt gt)
    | x == y = Node x lt gt
    | x < y  = Node y (treeInsert x lt) gt
    | x > y  = Node y lt (treeInsert x gt)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node y lt gt)
    | x == y = True
    | x < y  = treeElem x lt
    | x > y  = treeElem x gt

treeFromList :: (Ord a) => [a] -> Tree a
treeFromList = foldr treeInsert EmptyTree

-- WARN: fmap後は二分探索木でなくなる
instance Functor Tree where
    fmap _ EmptyTree = EmptyTree
    fmap f (Node x lt gt) = Node x' lt' gt'
        where x' = f x
              lt' = fmap f lt
              gt' = fmap f gt
