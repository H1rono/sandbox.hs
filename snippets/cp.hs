{-# OPTIONS -Wall -Werror #-}

module Main (main) where

import Data.ByteString.Lazy (ByteString, hGetContents, hPut)
import System.Environment (getArgs)
import System.Exit (exitFailure)
import System.IO (Handle, IOMode (ReadMode, WriteMode), withFile)

data CopyPair a
    = CopyPair
    { src :: a
    , dst :: a
    }
    deriving (Show)

main :: IO ()
main = do
    args <- readArgs
    withFilePair args copy

usage :: IO a
usage = do
    putStrLn
        "\
        \Usage: cp <src> <dst>"
    exitFailure

readArgs :: IO (CopyPair String)
readArgs = do
    args <- getArgs
    case args of
        [src, dst] -> pure $ CopyPair{src, dst}
        _ -> usage

withFilePair :: CopyPair String -> (CopyPair Handle -> IO ()) -> IO ()
withFilePair (CopyPair{src, dst}) f =
    withFile src ReadMode $ \hSrc ->
        withFile dst WriteMode $ \hDst -> do
            let pair = CopyPair{src = hSrc, dst = hDst}
            f pair

copy :: CopyPair Handle -> IO ()
copy (CopyPair{src, dst}) = do
    contents <- hGetContents src :: IO ByteString
    hPut dst contents
