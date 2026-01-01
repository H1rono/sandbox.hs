main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes =
    let respond line = if isPal line then "palindrome" else "not a palindrome"
    in unlines . map respond . lines

isPal :: String -> Bool
isPal line = line == reverse line
