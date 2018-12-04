main = do
    s <- readFile "input"
    putStrLn $ show $ sum $ map (\x -> read x :: Int) $ filter (\x -> length x > 0) $ lines s 
