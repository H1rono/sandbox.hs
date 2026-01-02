import Control.Monad (forM_)

import System.Random (getStdGen)

import Lib (diceRolls, readNumberInputs)

main :: IO ()
main = do
    gen <- getStdGen
    let rolls = diceRolls gen
    inputs <- readNumberInputs
    let message = "Which number of the current dice roll?"
    putStrLn message
    forM_ (zip rolls inputs) $ \(roll, input) -> do
        if roll == input
            then putStrLn "You are correct!"
            else putStrLn $ "Sorry, it was " ++ show roll
        putStrLn message
