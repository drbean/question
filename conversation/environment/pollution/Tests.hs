module Tests where

import Control.Monad
import Data.Maybe
import Data.Char
import Data.List
import qualified Data.Map as Map

import Data.DRS

import PGF2
import Pollution
import Utility
import Model

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

gr :: IO PGF
gr = readPGF "./Pollution.pgf"

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
  let Just eng = Map.lookup "PollutionEng" (languages gr')
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
  gr	<- readPGF "./Pollution.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

reps tests = do
  gr	<- readPGF "./Pollution.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
  gr  <- readPGF "./Pollution.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
  gr  <- readPGF "./Pollution.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

-}

dic_test = [

	"Otis sees a lot of dead fish."
	, "He asks what happened."
	, "Cindy says there is an Green Mission factory outside town that pumps chemicals into the river."
	, "Cindy and Otis think the chemicals killed the fish."
	, "Otis says pumping chemicals into the river is against the law."
	, "Cindy says a lot of companies ignore environmental pollution laws."
	, "Otis says that ignoring environmental pollution laws is terrible."
	, "He asks what they can do about it."
	, "Cindy says one way to change things is to talk to the company's management."
	, "Otis asks what they can do if talking to the company doesn't work."
	, "Cindy says they can get a TV station to run a story on the dead fish."
	, "Otis says companies hate bad publicity."
	, "Otis says his uncle is a top executive at Green Mission Industries."
	, "The company polluting the river is Green Mission Industries."

	, "Air pollution is threatening the health of people in urban areas."
	, "Livestock farms have contaminated soil and underground water."
	, "Acid rain has eroded statues and buildings."
	, "Oil spills are harming birds, fish and other marine life."
	, "The growth of suburbs has eaten up huge amounts of farmland."
	, "The destruction of rain forests is accelerating the extinction of plants and wildlife."

	, "High emissions of carbon dioxide are causing climate changes."
	, "Rapid urbanization is depleting our natural resources."
	, "Water pollution has threatened the health of people all over the world."

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
