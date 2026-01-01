import System.IO

{-
main = do
    handle <- openFile "baabaa.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
-}

main = withFile "baabaa.txt" ReadMode $ \handle -> do
    contents <- hGetContents handle
    putStr contents

-- main = do
--     contents <- readFile "baabaa.txt"
--     putStr contents

-- withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
-- withFile path mode op =
--     let acquire = openFile path
--     in bracket acquire hClose op
