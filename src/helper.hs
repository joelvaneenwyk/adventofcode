{-# LANGUAGE LambdaCase #-}

module Helper
( getDataFilePath
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
