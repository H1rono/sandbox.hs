import System.Random (getStdGen, randomRs)

main :: IO ()
main = do
    gen <- getStdGen
    putStrLn $ take 20 (randomRs ('a', 'z') gen)
