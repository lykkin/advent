import Data.Set

main = do
    s <- readFile "input"
    putStrLn $ show $ getRepeats (Prelude.map (\x -> read x :: Int) $ Prelude.filter (\x -> length x > 0) $ lines s) (empty) 0

getRepeats :: [Int] -> Set Int -> Int -> Int
getRepeats nums seen tot 
    | (Just x, _, _)  <- findRepeats nums seen tot = x
    | (Nothing, newSeen, newTot) <- findRepeats nums seen tot = getRepeats nums newSeen newTot

findRepeats :: [Int] -> Set Int -> Int -> (Maybe Int, Set Int, Int)
findRepeats (num:nums) seen tot
    | member tot seen = (Just tot, empty, tot)
    | otherwise = findRepeats nums (insert tot seen) (num + tot)
findRepeats [] seen tot = (Nothing, seen, tot)
