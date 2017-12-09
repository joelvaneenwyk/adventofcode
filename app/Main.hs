module Main where

import qualified Day1
import qualified Day2

main :: IO ()
main = do
        result1 <- Day1.process
        result2 <- Day2.process
        putStrLn $ "Day 1: " ++ show result1
        putStrLn $ "Day 2: " ++ show result2
