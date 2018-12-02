import Data.List.Split
import Data.Map
main = do
    s <- readFile "input"
    putStrLn $ show $ getChecksum $ Prelude.filter (\x -> length x > 0) $ splitOn "\n" s

getChecksum :: [String] -> Int
getChecksum ids = doubles * triples
    where (doubles, triples) = getDoublesAndTriples ids

getDoublesAndTriples :: [String] -> (Int, Int)
getDoublesAndTriples ids = Prelude.foldl (\(a, b) (c, d) -> (a + c, b + d)) (0, 0) $ Prelude.map getRepeats ids

getRepeats :: String -> (Int, Int)
getRepeats id = 
    if elem 2 instanceList then
        if elem 3 instanceList then (1, 1)
        else (1, 0)
    else
        if elem 3 instanceList then (0, 1)
        else (0, 0)
    where instanceList = elems $ countInstances (empty) id

countInstances :: Map Char Int -> [Char] -> Map Char Int
countInstances countingMap (c:cs)
    | member c countingMap = countInstances (adjust (\x -> x + 1) c countingMap) cs
    | otherwise = countInstances (insert c 1 countingMap) cs
countInstances countingMap [] = countingMap
