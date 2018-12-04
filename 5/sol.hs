import Data.Map
import Text.Regex.Posix
main = do
    s <- readFile "input"
    putStrLn $ show $ getOverlapCells $ Prelude.map parseLine $ lines s

parseLine :: String -> [Int]
parseLine ln = Prelude.map read matches
    where (_, _, _, matches) = ln =~ "([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)$" :: (String, String, String, [String])

getOverlapCells :: [[Int]] -> Int
getOverlapCells = countOverlap . (populateCellMap Data.Map.empty)

populateCellMap :: Map (Int, Int) Int -> [[Int]] -> Map (Int, Int) Int
populateCellMap cellMap [] = cellMap
populateCellMap cellMap (([startX, startY, width, height]):rest) = populateCellMap updatedMap rest
    where updatedMap = Prelude.foldl insertOrUpdate cellMap [(x, y) | x <- [startX..(startX + width - 1)], y <- [startY..(startY + height - 1)]]

insertOrUpdate :: Map (Int, Int) Int -> (Int, Int) -> Map (Int, Int) Int
insertOrUpdate cellMap key
    | member key cellMap = adjust (+ 1) key cellMap
    | otherwise = insert key 1 cellMap

countOverlap :: Map (Int, Int) Int -> Int
countOverlap cellMap = length $ Prelude.filter (flip (>) 1) $ elems cellMap
