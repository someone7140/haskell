{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Monoid ((<>))
import Data.Text as Tx(Text, drop, take)
import qualified Data.Text as T

yuugou :: Text -> Text
yuugou s =
    if s == "" then ""
    else do
        let take2 = Tx.take 2 s
            take2Head = Tx.take 1 take2
            take2Last = Tx.drop 1 take2
        if take2Head == take2Last then
            yuugou (take2Head <> Tx.drop 2 s)
        else
            take2Head <> yuugou (Tx.drop 1 s)

main :: IO ()
main = do
    _ <- getLine
    s <- getLine
    let result = T.length $ yuugou (T.pack s)
    print result
