import Control.Exception
import Data.List
import System.Environment
import System.Exit
import System.Directory
import System.IO

main = do
    args <- getArgs
    dispatch args

usage :: IO ()
-- usage = putStr """
-- usage: todo <command> [<args>]
-- 
-- commands:
--     add    <fileName> <item>   adds a TO-DO item to the file
--     view   <fileName>          prints TO-DO items in the file
--     remove <fileName> <index>  removes a TO-DO item from the file
-- """
usage = do
    putStr "\
        \usage: todo <command> [<args>]\n\
        \\n\
        \commands:\n\
        \    add    <fileName> <item>   adds a TO-DO item to the file\n\
        \    view   <fileName>          prints TO-DO items in the file\n\
        \    remove <fileName> <index>  removes a TO-DO item from the file\n"
    exitWith $ ExitFailure 1

dispatch :: [String] -> IO ()
dispatch ("add":fileName:todoItem:[]) = add fileName todoItem
dispatch ("view":fileName:[]) = view fileName
dispatch ("remove":fileName:index:[]) = remove fileName index
dispatch _ = usage

add :: String -> String -> IO ()
add fileName todoItem = do
    appendFile fileName $ todoItem ++ "\n"

view :: String -> IO ()
view fileName = do
    contents <- readFile fileName
    mapM_ putStrLn $ enumerateTodos contents

remove :: String -> String -> IO ()
remove fileName indexString = do
    contents <- readFile fileName
    let todoItems = lines contents
        index = read indexString
        removedTodoItems = removeNth index todoItems
    bracketOnError (openTempFile "." "temp")
        (\(tempName, tempHandle) -> do
            hClose tempHandle
            removeFile tempName)
        (\(tempName, tempHandle) -> do
            hPutStr tempHandle $ unlines removedTodoItems
            hClose tempHandle
            removeFile fileName
            renameFile tempName fileName)

enumerateTodos :: String -> [String]
enumerateTodos contents =
    let todoItems = lines contents
        showTodoItem n item = show n ++ " - " ++ item
    in zipWith showTodoItem [0..] todoItems

removeNth :: Int -> [a] -> [a]
removeNth 0 (_:xs) = xs
removeNth n (x:xs) = (:) x $ removeNth (n-1) xs
