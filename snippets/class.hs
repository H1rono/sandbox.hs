class Container c where
  cmap :: (a -> b) -> c a -> c b

instance Container Maybe where
  cmap f Nothing = Nothing
  cmap f (Just x) = Just $ f x
