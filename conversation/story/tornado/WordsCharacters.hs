module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/question/conversation/story/tornado/Tornado.pgf"

cat2funs :: String -> IO [CId]
cat2funs cat = do
	gr' <- gr
	let fs = functionsByCat gr' (mkCId cat)
	let ws = filter (isLower . head . showCId) fs
	let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x || isNumber x) . reverse .showCId ) ws
	return (map mkCId is )

gfWords :: [(String, IO [CId])]
gfWords = [
	("A",a)
	, ("Adv",adv)
	-- , ("Aux",aux)
	, ("Conj",conj)
	, ("Det",det)
	, ("N",n)
	, ("CN",cn)
	, ("PN",pn)
	, ("Pron",pron)
	, ("Prep",prep)
	-- , ("Rel",rel)
	, ("Tag",tag)
	, ("V",v)
	, ("V2",v2)
	, ("V3",v3)
	, ("VV",vv)
	, ("VS",vs)
	, ("V2A",v2a)
	]

posName :: String -> String
posName "A"	= "Adjective"
posName "Adv"	= "Adverb"
posName "Aux"	= "Auxiliary"
posName "Conj"	= "Conjunction"
posName "Det"	= "Determiner"
posName "N"	= "Uncount Noun"
posName "CN"	= "Count Noun"
posName "PN"	= "Proper Noun"
posName "Pron"	= "Pronoun"
posName "Prep"	= "Preposition"
posName "Rel"	= "Relative Pronoun"
posName "Tag"	= "Question Tag"
posName "V"	= "Verb"
posName "V2"	= "Verb + object"
posName "V3"	= "Verb + obj1 + obj2"
posName "VV"	= "Verb + verb"
posName "VS"	= "Verb + sentence"
posName "V2S"	= "Verb + object + sentence"
posName "V2A"	= "Verb + object + adjective"


a	= cat2funs "AP"
adv	= cat2funs "Adv"
conj	= cat2funs "Conj"
det	= cat2funs "Det"
n	= cat2funs "N"
cn	= cat2funs "CN"
pn	= cat2funs "PN"
prep	= cat2funs "Prep"
pron	= cat2funs "NP"
v	= cat2funs "V"
v2	= cat2funs "V2"
v3	= cat2funs "V3"
vv	= cat2funs "VV"
vs	= cat2funs "VS"
v2a	= cat2funs "V2A"
tag = return ( map mkCId tags )





aux = [
	"doesn't"
	, "don't"
	, "does"
	, "do"
	, "is"
	, "are"
	, "isn't"
	, "aren't"
	, "would"
	, "should"
	]
	

rel = [


	]

tags = [
	"doesn't he"
	, "doesn't she"
	, "doesn't it"
	, "don't they"
	, "does he"
	, "does she"
	, "does it"
	, "do they"
	, "isn't he"
	, "isn't she"
	, "isn't it"
	, "aren't they"
	, "is he"
	, "is she"
	, "is it"
	, "are they"
	]

{-


1,300 feet	: N;
150 miles per hour	: N;
19-year-old	: CN;
abandoned	: AP;
after_TIMEPREP	: TimePrep;
air	: N;
alive and well	: AP;
at_LOCPREP	: LocPrep;
before_TIMEPREP	: TimePrep;
by the name of_ATTRIBUTEPREP	: AttributePrep;
drop	: V2;
field	: PlaceNoun;
fly	: V2;
grandmother	: CN;
home	: PlaceNoun;
house	: PlaceNoun;
in_ADV_LOCATION	: Adv_location;
in_LOCPREP	: LocPrep;
intensify	: V2;
into_RESULTPREP	: ResultPrep;
last Thursday	: Adv_time;
life	: CN;
lucky	: AP;
Matt	: PN;
Missouri	: PN;
off_LOCPREP	: LocPrep;
over_EXTENTPREP	: ExtentPrep;
ride	: CN;
rip	: V3;
safe to say	: N;
start	: V;
storm	: CN;
suck
talk	: V2;
terrible	: AP;
through_LOCPREP	: LocPrep;
to_PREP	: Prep;
take
tornado	: CN;
wall	: CN;
watch TV	: V;
when
while	: Subj;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
