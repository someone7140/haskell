module Main where

sumarray :: Int -> [Int] -> Int
sumarray h t = do
    let tempSum = map (*h) t
    sum tempSum

combSum :: [Int] -> Int
combSum xs
    | null xs = 0
    | otherwise = do
        let xsHead = head xs
        let xsTail = tail xs
        sumarray xsHead xsTail + combSum xsTail

main :: IO ()
main = do
    _ <- getLine
    d <- fmap read . words <$> getLine :: IO [Int]
    print $ combSum d
