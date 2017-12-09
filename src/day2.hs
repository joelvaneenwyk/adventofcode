module Day2
( process
) where

import Helper
import Data.Char -- ord
import qualified Data.ByteString.Lazy as BL
import qualified Data.Vector as V
import Data.Csv
import Data.Text    (Text)

dec_opts = defaultDecodeOptions {
    decDelimiter = fromIntegral $ ord '\t'
  }

getData :: IO (Either String (V.Vector (V.Vector Int)))
getData = do
    filename <- getDataFilePath "day2.csv"
    csvData <- BL.readFile filename
    return (decodeWith dec_opts NoHeader csvData)

processRow :: (Ord a, Num a) => V.Vector a -> a
processRow row = (V.maximum row) - (V.minimum row)

processTable :: (Ord a, Num a) => V.Vector (V.Vector a) -> a
processTable table = V.sum (V.map processRow table)

process :: IO Int
process = do
    x <- getData
    case x of
        Left error -> return 0
        Right values -> return (processTable values)