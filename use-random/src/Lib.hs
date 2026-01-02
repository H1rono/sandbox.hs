module Lib (
    someFunc,
    readNumberInputs,
    diceRolls,
) where

import Control.Monad (guard)
import System.Random (Random (randomRs), RandomGen)

someFunc :: IO ()
someFunc = putStrLn "someFunc"

readNumberInputs :: IO [Int]
readNumberInputs = do
    str <- getContents
    pure $ do
        line <- lines str
        guard (not $ null line)
        pure $ read line

diceRolls :: (RandomGen g) => g -> [Int]
diceRolls = randomRs (1, 6)
