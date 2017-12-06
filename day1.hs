module Main where

import Data.Char (digitToInt)

readNumbers :: IO String
readNumbers = readFile "day1.input"

intify :: IO [Int]
intify = fmap (map digitToInt) readNumbers

aoc :: [Int] -> Int
aoc (x:y:xs) = if x == y
                    then (1 + aoc(xs))
                    else aoc(xs)
aoc (x:xs) = 0
aoc _ = 0

main :: IO ()
main = do
          x <- intify
          print $ (addm x)
