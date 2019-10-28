module Main where

main :: IO ()
main = do
    [a, b] <- fmap read . words <$> getLine :: IO [Int]
    let c = a - 2 * b
        result = if c < 0 then 0 else c
    print result

