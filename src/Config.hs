module Config where

import Core.Math(clampToRange)
import qualified Debug.Trace as T
import Data.Maybe(fromMaybe)
import Hexagrid.Grid

--- input, defaults, and limits

maxShuffles = 500

data Input = Input {
    inputRadius :: Maybe Int,
    inputShuffles :: Maybe Int
}

-- thePositionEntropy = prandPositionEntropy
thePositionEntropy = scriptPositionEntropy

safeRadius :: Input -> Int
safeRadius input =
    let safe = clampToRange (1,5) . fromMaybe 5 . inputRadius $ input in
    T.trace ("input radius " ++ show (inputRadius input) ++ " -> " ++ show safe) $
        safe

safeShuffles :: Input -> Int
safeShuffles input =
    let safe = clampToRange (0,maxShuffles) . fromMaybe 0 . inputShuffles $ input in
    T.trace ("input radius " ++ show (inputShuffles input) ++ " -> " ++ show safe) $
    safe
