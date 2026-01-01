or :: String -> String -> String
or "" b = b
or a _ = a

fizz n = if n `mod` 3 == 0 then "Fizz" else ""

buzz n = if n `mod` 5 == 0 then "Buzz" else ""

fizzBuzz :: Int -> String
fizzBuzz n = (fizz n ++ buzz n) `Main.or` show n

eval :: [IO ()] -> IO ()
eval [] = return ()
eval (x : xs) = do
  x
  eval xs

main = do
  mapM (putStrLn . fizzBuzz) [1 .. 100]
