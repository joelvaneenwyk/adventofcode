module Main where

import qualified Day1
import qualified Day2

main :: IO ()
main = do
        result <- Day1.process
        print $ result
