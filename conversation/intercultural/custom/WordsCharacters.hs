module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/question/conversation/intercultural/custom/Custom.pgf"

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


about_THEMEPREP	: ThemePrep;
acceptable	: AP;
after_TIMEPREP	: TimePrep;
after a while	: Adv_time;
all	: Predet;
also	: Postdet;
and	: Adv;
around_TIMEPREP	: TimePrep;
at_LOCPREP	: LocPrep;
at_THEMEPREP	: ThemePrep;
at first	: Adv_time;
because	: Subj;
body	: CN;
bother	: V2;
but	: Subj;
Carla	: PN;
clothing	: N;
come	: V;
cover	: V2;
day	: CN;
difficult	: AP;
dinner	: N;
dinner table	: CN;
drink	: V2;
eat	: V;
enjoy	: V2;
even_V	: AdV;
even_A	: AdA;
evening	: CN;
expect	: V2V;
feel	: VA;
food	: N;
for_TIMEPREP	: TimePrep;
find_NP	: V3;
find_AP	: V2A;
get up	: V;
get used to	: V;
go to work	: V;
grow up	: V;
guess	: VS;
have	: VV;
head	: CN;
how
How
in_LOCPREP	: LocPrep;
in_TIMEPREP	: TimePrep;
invite	: V2;
South Korea	: PN;
late	: Adv_time;
later
like	: V2;
live	: V2;
make	: V2;
morning	: CN;
Nate	: PN;
next	: AP;
nine o’clock	: N;
noise	: N;
noise_CN	: CN;
nuisance	: CN;
on
one	: Det;
or	: Conj;
over_LOCPREP	: LocPrep;
people
put	: V3;
real	: AP;
really	: Adv;
really_ADA	: AdA;
really	: AdV;
Saudi Arabia	: PlaceNoun;
secure	: AP;
Shauna	: PN;
show	: VS;
slurp	: V;
so	: Subj;
something
sometimes
soup	: N;
Spain	: PlaceNoun;
start_V2	: V2;
start_VV	: VV;
stay	: V;
surprise	: V2S;
talking
ten o’clock	: N;
then	: Adv_time;
thing
think	: VS;
three o’clock	: N;
time	: CN;
to_PREP	: Prep;
travel	: V2;
two o’clock	: N;
uncomfortable	: AP;
until_TIMEPREP	: TimePrep;
up
used
usually	: Postdet;
want	: VV;
way
wear	: V2;
what
when
whole	: AP;
woman	: CN;
work	: N;
worry	: V2;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
