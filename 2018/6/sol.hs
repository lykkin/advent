import Data.Map
import Text.Regex.Posix
main = do
    s <- readFile "input"
    putStrLn $ show $ getLonePatch [(id, (startX, startY), (startX + width, startY + height)) | [id, startX, startY, width, height] <- Prelude.map parseLine $ lines s]
parseLine :: String -> [Int]
parseLine ln = Prelude.map read matches
    where (_, _, _, matches) = ln =~ "^#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)$" :: (String, String, String, [String])

doesOverlap :: (Int, Int) -> (Int, Int) -> (Int, Int) -> (Int, Int) -> Bool
doesOverlap (a1, b1) (c1, d1) (a2, b2) (c2, d2) = a1 < c2 && c1 > a2 && b1 < d2 && d1 > b2 

getLonePatch :: [(Int, (Int, Int), (Int, Int))] -> Int
getLonePatch patches = id
    where (id, _, _) = head $ Prelude.filter (\(id, topLeft, bottomRight) ->  (Prelude.all (\(id2, tl, br) -> id == id2 || not (doesOverlap topLeft bottomRight tl br)) patches)) patches
