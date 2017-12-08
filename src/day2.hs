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

process = 5