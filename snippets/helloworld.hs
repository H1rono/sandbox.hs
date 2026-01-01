{-
main = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn $ "Hey " ++ name ++ ", you rock!"
-}

main =
    putStrLn "Hello, what's your name?"
    >>= \() -> getLine
    >>= \name -> putStrLn $ "Hey " ++ name ++ ", you rock!"
