-- gets some error, idk why

{-# LANGUAGE ScopedTypeVariables #-}
import Data.List
import Control.Monad
import Control.Arrow ((>>>))
import Data.Function (on)

($>) :: a -> (a -> b) -> b
($>) = flip ($)

solve :: [(Int, String, String)] -> Int
solve =
  map (\ (a, b, c) -> if b == "mobile" then (a + 100, c) else (a, c)) >>>
  sort >>>
  dropWhile ((== "paus") . snd) >>>
  (\xs -> head xs : ((xs `zip` tail xs) $>
                     filter (uncurry ((/=) `on` snd)) $>
                     map snd)) >>>
  go

go :: [(Int, String)] -> Int
go [] = 0
go ((play_begin, "play") : (pause_begin, "paus") : xs) =
  pause_begin - play_begin + go xs


main :: IO ()
main = do
  (n :: Int) <- readLn
  raw_input <- replicateM n getLine
  let input = map ((\ [a, b, c] -> (read a :: Int, b, c)) . words) raw_input
  print $ solve input

