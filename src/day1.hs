{-# LANGUAGE LambdaCase #-}

module Day1
( process
) where

import Data.Char (digitToInt)
import System.Directory
import System.FilePath

dataFolder = "data"

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

aoc :: [Int] -> Int
aoc (x:y:xs) = if x == y
                    then (1 + aoc(xs))
                    else aoc(xs)
aoc (x:xs) = 0
aoc _ = 0

process :: IO Int
process = do
            x <- intify
            return (aoc x)
