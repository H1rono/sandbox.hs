{-
main = do
    contents <- getContents
    putStr $ shortLinesOnly contents
-}

main = interact shortLinesOnly

shortLinesOnly :: String -> String
shortLinesOnly =
    let isShort line = length line < 10
    in unlines . filter isShort . lines
