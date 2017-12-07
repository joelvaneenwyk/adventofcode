{-# LANGUAGE LambdaCase #-}

module Day1
( process
) where

import Data.Char (digitToInt)
import System.Directory
import System.FilePath

dataFolder = "data"

-- 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
-- 1111 produces 4 because each digit (all 1) matches the next.
-- 1234 produces 0 because no digit matches the next.
-- 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

test1 = [1, 1, 2, 2]
test2 = [1, 1, 1, 1]
test3 = [1, 2, 3, 4]
test4 = [9, 1, 2, 1, 2, 1, 2, 9]

runTest :: [Integer] -> Int
runTest x = aoc (map fromInteger x)

getDataFilePath filename = do
    dir <- searchCurrentDirectory filename
    return (joinPath [dir, dataFolder, filename])

searchCurrentDirectory filename = do
    dir <- getCurrentDirectory
    searchForFile dir filename

searchForFile dir filename = do
    doesFileExist (joinPath [dir, "data", filename]) >>= \case
        True ->  return dir
        False -> searchForFile (takeDirectory dir) filename

readNumbers :: IO String
readNumbers = do
    filename <- getDataFilePath "day1.input"
    readFile filename

intify :: IO [Int]
intify = fmap (map digitToInt) readNumbers

--sumMatching :: [Int] Int -> Int
sumMatching [] litem = 0
sumMatching [x] litem = if litem == x
             then x
             else 0
sumMatching (x:xs) litem = if x == (head xs)
                    then x + (sumMatching xs litem)
                    else sumMatching xs litem

aoc :: [Int] -> Int
aoc x = sumMatching x (head x)


process :: IO Int
process = do
            x <- intify
            return (aoc x)
