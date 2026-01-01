module Lib (
    helloWorld,
    threeCoins,
) where

import System.Random (RandomGen, random)

helloWorld :: IO ()
helloWorld = putStrLn "Hello, world!"

-- >>> import System.Random (mkStdGen)
-- >>> threeCoins (mkStdGen 42)
-- (False,True,True)
threeCoins :: (RandomGen g) => g -> (Bool, Bool, Bool)
threeCoins gen =
    let (first, newGen) = random gen
        (second, newGen') = random newGen
        (third, _newGen'') = random newGen'
     in (first, second, third)
