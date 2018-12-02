import Data.List.Split
main = do
    s <- readFile "input"
    putStrLn $ show $ getCommonSubstring $ Prelude.filter (\x -> length x > 0) $ splitOn "\n" s

getCommonSubstring :: [String] -> String
getCommonSubstring (id:ids)
    | Nothing <- checked = getCommonSubstring ids
    | Just (first, second) <- checked = calcCommon first second
    where checked = checkDistances id ids

checkDistances :: String -> [String] -> Maybe (String, String)
checkDistances needle (head:rest)
    | delta needle head == 1 = Just (needle, head)
    | otherwise = checkDistances needle rest
checkDistances _ [] = Nothing

delta :: String -> String -> Int
delta (a:as) (b:bs)
    | a == b = delta as bs
    | otherwise = 1 + delta as bs
delta as [] = length as
delta [] bs = length bs

calcCommon :: String -> String -> String
calcCommon (a:as) (b:bs)
    | a == b = a:(calcCommon as bs)
    | otherwise = calcCommon as bs
calcCommon _ [] = []
calcCommon [] _ = []
