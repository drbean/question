module Tests where

import Control.Monad
import Data.Maybe
import Data.Char
import Data.List
import qualified Data.Map as Map

import Data.DRS

import PGF2
import Tornado
import Utility
import Model

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

gr :: IO PGF
gr = readPGF "./Tornado.pgf"

cat2funs :: String -> IO ()
cat2funs cat = do
  gr' <- gr
  let fs = functionsByCat gr' (show cat)
  let ws = filter (isLower . head . show) fs
  let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x) . reverse .show ) ws
  putStrLn (unwords is)

catByPOS :: String -> IO ()
catByPOS  pos = do
  gr' <- gr
  let allCats = categories gr'
  let cats = filter (isPrefixOf pos . show) allCats
  putStrLn (unwords (map show cats))

trans = id

run f tests = do
  gr' <- gr
  let Just eng = Map.lookup "TornadoEng" (languages gr')
  let ss = map (chomp . lc_first) tests
  let p =  parse eng (startCat gr')
  let Just incompleteparse = readExpr "ParseIncomplete"
  let Just noaccountfail = readExpr "ParseFailed somewhere"
  let failingparse n string = fromMaybe noaccountfail (readExpr ("ParseFailed at " ++ (show n) ++ " " ++ string))
  let t p = case p of
        ParseOk ((e,prob):rest) -> e
        (ParseFailed offset token) -> failingparse offset token
        ParseIncomplete -> incompleteparse
  let ts = map (t . p) ss
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

{-

ans tests = do
  gr	<- readPGF "./Tornado.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

reps tests = do
  gr	<- readPGF "./Tornado.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
  gr  <- readPGF "./Tornado.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
  gr  <- readPGF "./Tornado.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

-}

dic_test = [

	"A 19-year-old by the name of Matt is lucky to be alive and well."
	, "Matt was watching TV at his grandmother's home in Missouri last Thursday when a terrible storm started."
	, "While he was talking to his grandmother, the storm intensified into a tornado, ripping the walls off the house and sucking him in."
	, "The tornado took Matt over 1,300 feet before dropping him in an abandoned field."
	, "After flying through the air at 150 miles per hour, it's safe to say that Matt had the ride of his life!"

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
