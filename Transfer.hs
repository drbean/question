module Main where

import Dickson
import LogicalForm
import Evaluation

--import Model
import WordsCharacters

import Data.Maybe
import Control.Monad
import Data.List.Split

import GHC.IO.Handle
import System.IO

import System.Environment.FindBin

main :: IO ()
main = do
  path <- getProgPath
  gr <- readPGF ( path ++ "/Dickson.pgf" )
  hClose stderr
  hDuplicateTo stdout stderr
  s <- getLine
  let l = (chomp . lc_first) s
  putStrLn ("Unknown_words: " ++ (unknown l) )
  let ps = parses gr l
  let ls = map (linear transform gr) ps
  putStrLn ("Parsed: " ++ (show (map (showExpr []) ps) ) )
  putStrLn ("Answer: " ++ (bestAnswer ls) )
  let courses = map (label . fg) ps
  putStrLn ("Course: " ++ foldl takeCourse "Unparseable" courses )

unknown :: String -> String
unknown ws = unwords ( filter (\x -> not (checkLists x ws) ) (words ws))

checkLists :: String -> String -> Bool
checkLists w ws	=	if check_on_wordlist w then True
									else if check_on_wordlist (alternative w (bigram ws)) then True
									else if check_on_wordlist (alternative w (trigram ws)) then True
									else False
splitVariants :: [String] -> [String]
splitVariants ls = concat $ map (splitOn ", ") ls

check_on_wordlist :: String -> Bool
check_on_wordlist = flip elem (splitVariants wordlist)

alternative :: String -> [(String, String)] -> String
alternative w bis	| Just bi <- lookup w bis = bi
									| Nothing <- lookup w bis = "Nothing"

bigram :: String -> [ (String, String) ]
bigram ws = let zs = zip ss sss
						where
						ss = words ws
						sss = tail ss
						in (map (\(a,b) -> (a, unwords [a,b]) ) zs) ++
							(map (\(a,b) -> (b, unwords [a,b]) ) zs)

trigram :: String -> [ (String, String) ]
trigram ws = let zs = zip3 ss sss ssss
			where
			ss = words ws
			sss = tail ss
			ssss = tail sss
			in (map (\(a,b,c) -> (a, unwords [a,b,c]) ) zs) ++
				(map (\(a,b,c) -> (c, unwords [a,b,c]) ) zs)

label :: GUtt -> String
label (GQUt (GPosQ (GWH_Pred _ _)))	= "WH"
label (GQUt (GNegQ (GWH_Pred _ _)))	= "WH"
label (GQUt (GPosQ (GYN _)))	= "YN"
label (GQUt (GNegQ (GYN _)))	= "YN"
label (GQUt (GPosQ (GTagQ _ _)))	= "Tag"
label (GQUt (GNegQ (GTagQ _ _)))	= "Tag"
label (GQUt (GPosQ (GTagComp _ _)))	= "Tag"
label (GQUt (GNegQ (GTagComp _ _)))	= "Tag"
label _				= "Unparseable"

takeCourse :: String -> String -> String
takeCourse _ "WH" = "WH"
takeCourse "WH" _ = "WH"
takeCourse _ "YN" = "YN"
takeCourse "YN" _ = "YN"
takeCourse _ "Tag"  = "Tag"
takeCourse "Tag" _  = "Tag"
takeCourse _ "S"  = "S"
takeCourse "S" _  = "S"
takeCourse "Unparseable" _  = "Unparseable"
takeCourse _  _   = error "undefined course, not WH, YN, S, or Unparseable"

bestAnswer :: [Maybe String] -> String
bestAnswer ss = 
	foldl takeAnswer "No answer" (map (fromMaybe "Nothing") ss)

takeAnswer :: String -> String -> String
takeAnswer _ "yes" = "yes"
takeAnswer "yes" _ = "yes"
takeAnswer "no" _  = "no"
takeAnswer _ "no" = "no"
takeAnswer "No answer" _ = "No answer"
takeAnswer _ "No answer" = "No answer"
takeAnswer _ "Nothing" = "Nothing"
takeAnswer "Nothing" _ = "Nothing"
takeAnswer _  _   = error "undefined answer, not Yes, No, No answer or Nothing"

-- vim: set ts=2 sts=2 sw=2 noet:
