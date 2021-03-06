module Model where 

import Data.Tuple
import Data.List
import Data.Maybe
data Entity	= A | B | C | D | E | F | G
	| H | I | J | K | L | M | N 
	| O | P | Q | R | S | T | U 
	| V | W | X | Y | Z | Someone | Something | Unspec
  | Mandy | Ariel | Sabrina | Alice | Dora | Cheney | Andy | Cherry2 
	| Viola1 | Lisa1 | Marian | YiSian | Jessie | Demi | Maggie | Annie
	-- | James | Irene | Lulu | Johnny | Eason | Simon | Emma | Lilian | Abby | Cathy | Sunny | Jane | Claire | Connie | Bella | Lily | Sharon | Cindy | Jennifer | Ban | Calina | Jin1 | Rachel | Tina

     deriving (Eq,Show,Bounded,Enum,Ord)

entities :: [Entity]
entities	=  [minBound..maxBound] 

entity_check :: [ (Entity, String) ]
entity_check =  [
  (A, "age" )
  , (B, "" )
  , (C, "" )
  , (D, "" )
  , (E, "ellarose" )
  , (F, "filibee" )
  , (G, "" )
  , (H, "" )
  , (I, "" )
  , (J, "junior" )
  , (K, "jack" )
  , (L, "location" )
  , (M, "" )
  , (N, "must" )
  , (O, "school" )
  , (P, "" )
  , (Q, "" )
  , (R, "race" )
  , (S, "stranger" )
  , (T, "stefan" )
  , (U, "turkey" )
  , (V, "" )
  , (W, "" )
  , (X, "sex" )
  , (Y, "" )
  , (Z, "" )
	, (Alice, "alice" )
	, (Mandy, "mandy" )
	, (Ariel, "ariel" )
	, (Sabrina, "sabrina" )
	, (Dora, "dora" )
	, (Cheney, "cheney" )
	, (Andy , "andy" )
	-- , (James, "james" )
	, (Cherry2, "cherry2" )
	-- , (Irene, "irene" )
	-- , (Lulu, "lulu" )
	-- , (Johnny, "johnny" )
	-- , (Eason, "eason" )
	-- , (Simon, "simon" )
	, (Viola1, "viola1" )
	, (Lisa1, "lisa1" )
	-- , (Emma, "emma" )
	, (Marian, "marian" )
	, (YiSian, "yisian" )
	, (Jessie, "jessie" )
	-- , (Lilian, "lilian" )
	, (Annie, "annie" )
	-- , (Abby, "abby" )
	-- , (Cathy, "cathy" )
	, (Demi, "demi" )
	-- , (Sunny, "sunny" )
	-- , (Jane, "jane" )
	-- , (Claire, "claire" )
	-- , (Connie, "connie" )
	-- , (Bella, "bella" )
	-- , (Lily, "lily" )
	, (Maggie, "maggie" )
	-- , (Sharon, "sharon" )
	-- , (Cindy, "cindy" )
	-- , (Jennifer, "jennifer" )
	-- , (Ban, "ban" )
	-- , (Calina, "calina" )
	-- , (Jin1, "jin1" )
	-- , (Rachel, "rachel" )
	-- , (Tina, "tina" )
    ]

students = 
	[ Alice, Mandy, Ariel, Sabrina, Dora, Cheney, Andy, Viola1, Lisa1, Annie, Maggie, Jessie, Demi, Cherry2 ]
  -- [ James, Irene, Mandy, Ariel, Lulu, Johnny, Eason, Simon, Emma, Marian, YiSian, Lilian, Abby, Cathy, Sunny, Jane, Claire, Connie, Bella, Lily, Sharon, Cindy, Jennifer, Sabrina, Ban, Alice, Calina, Jin1, Rachel, Tina ]

ent_ided :: String -> Entity
ent_ided name = head [entity | (entity,string) <- entity_check ,
				name == string
				]

characters :: [(String,Entity)]
characters = map findEnt students
	where findEnt e
		| Just name <- lookup e entity_check
			= (name,e)
		| otherwise = error ("No " ++ (show e))

stringEntity :: [(String,Entity)]
stringEntity = map swap entity_check

namelist :: [String]
namelist = [string | (entity,string) <- entity_check, string /= "" ]

predid1 :: String -> Maybe OnePlacePred
predid2 :: String -> Maybe TwoPlacePred
predid3 :: String -> Maybe ThreePlacePred
predid4 :: String -> Maybe FourPlacePred

predid3 name
       | Just pred <- lookup name threePlacers = Just pred
        -- | otherwise    = Nothing
        | otherwise    = error $ "no '" ++ name ++ "' three-place predicate."
predid4 name
       | Just pred <- lookup name fourPlacers = Just pred
        -- | otherwise    = Nothing
        | otherwise    = error $ "no '" ++ name ++ "' four-place predicate."
predid5 name
       | Just pred <- lookup name fivePlacers = Just pred
        -- | otherwise    = Nothing
        | otherwise    = error $ "no '" ++ name ++ "' five-place predicate."

onePlacers, onePlaceStarters, entityonePlacers :: [(String, [Entity])]
onePlaceStarters = [
	("true",        entities )
	, ("false",     [] )
	, ("role",      [] )


	-- , ("male",	[Cheney, Andy, James, Johnny, Eason, Simon] )
	, ("male",	[S, J, F] )
	-- , ("female",	[Dora, Cherry2, Irene, Mandy, Ariel, Lulu, Viola1, Lisa1, Emma, Marian, YiSian, Jessie, Lilian, Annie, Abby, Cathy, Demi, Sunny, Jane, Claire, Connie, Bella, Lily, Maggie, Sharon, Cindy, Jennifer, Sabrina, Ban, Alice, Calina, Jin1, Rachel, Tina] )
	, ("female",	[S, E,  Mandy, Ariel, Sabrina, Alice] )
	]


onePlacers = 
	entityonePlacers ++ onePlaceStarters

predid1 "people"	= predid1 "person"
predid1 "person"	= Just person
predid1 "thing"	= Just thing
predid1 "man"	= predid1 "male"

predid1 name = if name `elem` (map fst onePlacers) then
	Just (pred1 (concat [ oneple | (id, oneple) <- onePlacers
		, id == name] ) ) else
		-- Nothing
		error $ "no '" ++ name ++ "' one-place predicate."

entityonePlacers =
	map (\x -> (snd x, [fst x])) entity_check

genonePlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> 
	(String, [Entity])
genonePlacer area id content role =
	( id, [ r | (co,cs) <- area
		, co == content
		, Just r <-[lookup role cs]
		] )

type OnePlacePred	= Entity -> Bool
type TwoPlacePred	= Entity -> Entity -> Bool
type ThreePlacePred	= Entity -> Entity -> Entity -> Bool
type FourPlacePred      = Entity -> Entity -> Entity -> Entity -> Bool
type FivePlacePred      = Entity -> Entity -> Entity -> Entity -> Entity ->  Bool

list2OnePlacePred :: [Entity] -> OnePlacePred
list2OnePlacePred xs	= \ x -> elem x xs

pred1 :: [Entity] -> OnePlacePred
pred1	= flip elem

test1 :: String -> OnePlacePred
test1 p = fromMaybe (\_ -> False) (predid1 p)

person, thing :: OnePlacePred
person	= \ x -> (test1 "male" x || test1 "female" x || test1 "role" x || x == Someone)
thing	= \ x -> (x == Unspec || x == Something || not ( person x ) )

pred2 :: [(Entity,Entity)] -> TwoPlacePred
pred3 :: [(Entity,Entity,Entity)] -> ThreePlacePred
pred2 xs	= curry ( `elem` xs )
pred3 xs	= curry3 ( `elem` xs )
pred4 xs	= curry4 ( `elem` xs )

goal :: [ (Content, [(Case, Entity)]) ]
goal = [
	]

event :: [ (Content, [(Case, Entity)]) ]
event = [
	("ask", [(Agent, Mandy), (Recipient, S), (Predicate, P), (Topic, A)])
	, ("ask", [(Agent, Mandy), (Recipient, S), (Predicate, P), (Topic, X)])
	, ("ask", [(Agent, S), (Recipient, Mandy), (Predicate, P), (Topic, X)])
	, ("ask", [(Agent, Alice), (Recipient, E), (Predicate, P), (Topic, O)])
	, ("greet", [(Agent, E), (Patient, Alice) ])
	, ("state", [(Agent, E), (Recipient, Alice), (Predicate, P), (Topic, A)])
	, ("state", [(Agent, E), (Recipient, Alice), (Predicate, P), (Topic, O)])
	, ("state", [(Agent, Alice), (Recipient, E), (Predicate, P), (Topic, L)])
	, ("greet", [(Agent, Ariel), (Patient, F) ])
	, ("state", [(Agent, F), (Recipient, Ariel), (Predicate, P), (Topic, L) ])
	, ("state", [(Agent, Ariel), (Recipient, F), (Predicate, P), (Topic, L) ])

	, ("greet", [(Agent, Sabrina), (Patient, S) ])
	, ("greet", [(Agent, S), (Patient, Sabrina) ])
	, ("ask", [(Agent, J), (Recipient, Sabrina), (Predicate, P), (Topic, R)])
	, ("state", [(Agent,S),(Recipient, Sabrina),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,Sabrina),(Recipient, S),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,S),(Recipient, Sabrina),(Predicate,P),(Topic,A)])
	, ("state", [(Agent, Sabrina),(Recipient, S), (Predicate, P), (Topic, A)])

	, ("greet", [(Agent, Sabrina), (Patient, J) ])
	, ("greet", [(Agent, J), (Patient, Sabrina) ])
	, ("ask", [(Agent, J), (Recipient, Sabrina), (Predicate, P), (Topic, R)])
	, ("state", [(Agent,J),(Recipient, Sabrina),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,Sabrina),(Recipient, J),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,J),(Recipient, Sabrina),(Predicate,P),(Topic,A)])
	, ("state", [(Agent, Sabrina),(Recipient, J), (Predicate, P), (Topic, A)])

	, ("greet", [(Agent, S), (Patient, Marian) ])
	, ("greet", [(Agent, Marian), (Patient, S) ])
	, ("ask", [(Agent, S), (Recipient, Marian), (Predicate, P), (Topic, L)])
	, ("ask", [(Agent, Marian), (Recipient, S), (Predicate, P), (Topic, L)])
	, ("state", [(Agent,S),(Recipient, Marian),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,Marian),(Recipient, S),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Viola1), (Patient, S) ])
	, ("greet", [(Agent, S), (Patient, Viola1) ])
	, ("state", [(Agent,Viola1),(Recipient, S),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,S),(Recipient, Viola1),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,Viola1),(Recipient, S),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,S),(Recipient, Viola1),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,Viola1),(Recipient, S),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,S),(Recipient, Viola1),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Maggie), (Patient, S) ])
	, ("state", [(Agent,Maggie),(Recipient, S),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,S),(Recipient, Maggie),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,Maggie),(Recipient, S),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,S),(Recipient, Maggie),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,Maggie),(Recipient, S),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,S),(Recipient, Maggie),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Dora), (Patient, S) ])
	, ("greet", [(Agent, S), (Patient, Dora) ])
	, ("ask", [(Agent, Dora), (Recipient, S), (Predicate, P), (Topic, O)])
	, ("ask", [(Agent, S), (Recipient, Dora), (Predicate, P), (Topic, O)])
	, ("state", [(Agent,Dora),(Recipient, S),(Predicate,P),(Topic,O)])
	, ("state", [(Agent,S),(Recipient, Dora),(Predicate,P),(Topic,O)])
	, ("state", [(Agent,Dora),(Recipient, S),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,S),(Recipient, Dora),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Cherry2), (Patient, S) ])
	, ("greet", [(Agent, S), (Patient, Cherry2) ])
	, ("ask", [(Agent, Cherry2), (Recipient, S), (Predicate, P), (Topic, O)])
	, ("ask", [(Agent, S), (Recipient, Cherry2), (Predicate, P), (Topic, O)])
	, ("state", [(Agent,Cherry2),(Recipient, S),(Predicate,P),(Topic,O)])
	, ("state", [(Agent,S),(Recipient, Cherry2),(Predicate,P),(Topic,O)])
	, ("state", [(Agent,Cherry2),(Recipient, S),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,S),(Recipient, Cherry2),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,Cherry2),(Recipient, S),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,S),(Recipient, Cherry2),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Jessie), (Patient, S) ])
	, ("greet", [(Agent, S), (Patient, Jessie) ])
	, ("ask", [(Agent, Jessie), (Recipient, S), (Predicate, P), (Topic, L)])
	, ("ask", [(Agent, S), (Recipient, Jessie), (Predicate, P), (Topic, L)])
	, ("state", [(Agent,Jessie),(Recipient, S),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,S),(Recipient, Jessie),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,Jessie),(Recipient, S),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,S),(Recipient, Jessie),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Demi), (Patient, S) ])
	, ("greet", [(Agent, S), (Patient, Demi) ])
	, ("ask", [(Agent, Demi), (Recipient, S), (Predicate, P), (Topic, X)])
	, ("ask", [(Agent, S), (Recipient, S), (Predicate, P), (Topic, X)])
	, ("ask", [(Agent, Demi), (Recipient, S), (Predicate, P), (Topic, L)])
	, ("ask", [(Agent, S), (Recipient, Demi), (Predicate, P), (Topic, L)])
	, ("state", [(Agent,Demi),(Recipient, S),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,S),(Recipient, Demi),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,Demi),(Recipient, S),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,S),(Recipient, Demi),(Predicate,P),(Topic,X)])
	, ("state", [(Agent,Demi),(Recipient, S),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,S),(Recipient, Demi),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Annie), (Patient, S) ])
	, ("greet", [(Agent, S), (Patient, Annie) ])
	, ("ask", [(Agent, Annie), (Recipient, S), (Predicate, P), (Topic, A)])
	, ("ask", [(Agent, S), (Recipient, S), (Predicate, P), (Topic, A)])
	, ("ask", [(Agent, Annie), (Recipient, S), (Predicate, P), (Topic, L)])
	, ("ask", [(Agent, S), (Recipient, Annie), (Predicate, P), (Topic, L)])
	, ("state", [(Agent,Annie),(Recipient, S),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,S),(Recipient, Annie),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,Annie),(Recipient, S),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,S),(Recipient, Annie),(Predicate,P),(Topic,L)])

	, ("greet", [(Agent, Cheney), (Patient, K) ])
	, ("ask", [(Agent, Cheney), (Recipient, K), (Predicate, P), (Topic, L)])
	, ("ask", [(Agent, K), (Recipient, Cheney), (Predicate, P), (Topic, L)])
	, ("state", [(Agent,Cheney),(Recipient, K),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,K),(Recipient, Cheney),(Predicate,P),(Topic,L)])
	, ("ask", [(Agent, Cheney), (Recipient, K), (Predicate, P), (Topic, A)])
	, ("ask", [(Agent, K), (Recipient, S), (Predicate, P), (Topic, A)])
	, ("state", [(Agent,Cheney),(Recipient, K),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,K),(Recipient, Cheney),(Predicate,P),(Topic,A)])

	, ("greet", [(Agent, Andy), (Patient, T) ])
	, ("ask", [(Agent, Andy), (Recipient, T), (Predicate, P), (Topic, L)])
	, ("state", [(Agent,Andy),(Recipient, T),(Predicate,P),(Topic,L)])
	, ("state", [(Agent,T),(Recipient, Andy),(Predicate,P),(Topic,L)])
	, ("ask", [(Agent, Andy), (Recipient, T), (Predicate, P), (Topic, A)])
	, ("state", [(Agent,Andy),(Recipient, T),(Predicate,P),(Topic,A)])
	, ("state", [(Agent,T),(Recipient, Andy),(Predicate,P),(Topic,A)])
	, ("ask", [(Agent, Andy), (Recipient, T), (Predicate, P), (Topic, O)])
	, ("state", [(Agent,Andy),(Recipient, T),(Predicate,P),(Topic,O)])
	, ("state", [(Agent,T),(Recipient, Andy),(Predicate,P),(Topic,O)])

	]

question :: [ (Content, [(Case, Entity)]) ]
question = [
	("age", [(Predicate, P), (Topic, A), (Pivot, S)])
	, ("sex", [(Predicate, P), (Topic, X), (Pivot, S)])
	, ("student", [(Pivot, E), (Predicate, P), (Topic, O) ] )
	, ("school", [(Topic, O), (Predicate,P), (Pivot, E) ] )
	, ("hispanic",	[(Pivot, Sabrina), (Topic, R), (Predicate, P) ] )

	, ("student", [(Pivot, Dora), (Predicate, P), (Topic, O) ] )
	, ("student", [(Pivot, S), (Predicate, P), (Topic, O) ] )
	, ("must", [(Pivot, Dora), (Predicate, P), (Topic, O) ] )
	, ("must", [(Pivot, S), (Predicate, P), (Topic, O) ] )

	, ("student", [(Pivot, Cherry2), (Predicate, P), (Topic, O) ] )
	, ("student", [(Pivot, S), (Predicate, P), (Topic, O) ] )

	, ("sex", [(Pivot, Cherry2), (Predicate, P), (Topic, O) ] )
	, ("location", [(Pivot, Cherry2), (Predicate, P), (Topic, O) ] )

	, ("age", [(Pivot, Annie), (Predicate, P), (Topic, A) ] )
	, ("age", [(Pivot, S), (Predicate, P), (Topic, A) ] )
	, ("student", [(Pivot, Annie), (Predicate, P), (Topic, O) ] )
	, ("student", [(Pivot, S), (Predicate, P), (Topic, O) ] )

	, ("age", [(Pivot, Annie), (Predicate, P), (Topic, A) ] )
	, ("age", [(Pivot, S), (Predicate, P), (Topic, A) ] )
	, ("student", [(Pivot, Annie), (Predicate, P), (Topic, O) ] )
	, ("student", [(Pivot, S), (Predicate, P), (Topic, O) ] )

	]

condition :: [ (Content, [(Case, Entity)]) ]
condition = [
	("sixteen", [(Pivot,E), (Predicate,P) ] )
	, ("taiwan", [(Pivot,Alice), (Predicate,P) ] )
	, ("taiwan", [(Pivot,Ariel), (Predicate,P) ] )
	, ("taiwan", [(Pivot, Marian), (Predicate,P) ] )
	, ("taiwan", [(Pivot, YiSian), (Predicate,P) ] )
	, ("taiwan", [(Pivot, S), (Predicate,P) ] )
	, ("japan", [(Pivot, S), (Predicate,P) ] )
	, ("turkey", [(Pivot,F), (Predicate,P) ] )
	, ("male",	[(Pivot, S), (Predicate, P) ] )
	, ("female",	[(Pivot, Sabrina), (Predicate, P) ] )
	, ("young",	[(Pivot, S), (Predicate, P) ] )
	, ("sixteen", [(Pivot,J), (Predicate,P) ] )

	, ("twentyone",	[(Pivot, Viola1), (Predicate, P) ] )
	, ("twentytwo",	[(Pivot, S), (Predicate, P) ] )
	, ("female",	[(Pivot, Viola1), (Predicate, P) ] )
	, ("taiwan", [(Pivot, Viola1), (Predicate,P) ] )
	, ("us", [(Pivot, S), (Predicate,P) ] )

	, ("nineteen",	[(Pivot, Maggie), (Predicate, P) ] )
	, ("nineteen",	[(Pivot, S), (Predicate, P) ] )
	, ("female",	[(Pivot, Maggie), (Predicate, P) ] )
	, ("taiwan", [(Pivot, Maggie), (Predicate,P) ] )
	, ("us", [(Pivot, S), (Predicate,P) ] )

	, ("taiwan", [(Pivot, Dora), (Predicate,P) ] )
	, ("must", [(Pivot, Dora), (Predicate,P) ] )
	, ("student", [(Pivot, Dora), (Predicate, P), (Topic, O) ] )
	, ("student", [(Pivot, S), (Predicate, P), (Topic, O) ] )
	, ("must", [(Pivot, S), (Predicate, P), (Topic, O) ] )

	, ("taiwan", [(Pivot, Cherry2), (Predicate,P) ] )
	, ("student", [(Pivot, Cherry2), (Predicate, P), (Topic, O) ] )
	, ("sixteen", [(Pivot, S), (Predicate, P), (Topic, O) ] )
	, ("romania", [(Pivot, S), (Predicate, P), (Topic, O) ] )

	, ("taiwan", [(Pivot, Jessie), (Predicate,P) ] )
	, ("female", [(Pivot, Jessie), (Predicate, P), (Topic, X) ] )
	, ("china", [(Pivot, S), (Predicate, P), (Topic, L) ] )

	, ("taiwan", [(Pivot, Demi), (Predicate,P) ] )
	, ("female", [(Pivot, Demi), (Predicate, P), (Topic, X) ] )
	, ("nineteen", [(Pivot, Demi), (Predicate, P), (Topic, O) ] )
	, ("eighteen", [(Pivot, S), (Predicate, P), (Topic, O) ] )

	, ("taiwan", [(Pivot, Annie), (Predicate,P) ] )
	, ("student", [(Pivot, Annie), (Predicate, P), (Topic, O) ] )
	, ("nineteen", [(Pivot, Annie), (Predicate, P), (Topic, A) ] )
	, ("nineteen", [(Pivot, S), (Predicate, P), (Topic, A) ] )

	, ("taiwan", [(Pivot, Cheney), (Predicate,P) ] )
	, ("china", [(Pivot, K), (Predicate,P) ] )
	, ("student", [(Pivot, Cheney), (Predicate, P), (Topic, O) ] )
	, ("nineteen", [(Pivot, Cheney), (Predicate, P), (Topic, A) ] )
	, ("twentytwo", [(Pivot, K), (Predicate, P), (Topic, A) ] )

	, ("taiwan", [(Pivot, Andy), (Predicate,P) ] )
	, ("hungary", [(Pivot, T), (Predicate,P) ] )
	, ("student", [(Pivot, Andy), (Predicate, P), (Topic, O) ] )
	, ("nineteen", [(Pivot, Andy), (Predicate, P), (Topic, A) ] )
	, ("twentythree", [(Pivot, T), (Predicate, P), (Topic, A) ] )

	]

idea :: [ (Content, [(Case, Entity)]) ]
idea = [
	]

attitude :: [ (Content, [(Case, Entity)]) ]
attitude = [
	]

affiliation :: [ (Content, [(Case, Entity)]) ]
affiliation = [
	 ("nationality", [(Theme,Alice),(Source,T)] )
	 , ("nationality", [(Theme,Ariel),(Source,T)]  )
	]

gentwoPlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> Case ->
	(String, [(Entity,Entity)] )
gentwoPlacer area id content role1 role2 =
	( id, [ (r1,r2) | (co,cs) <- area
		, co == content
		, Just r1 <-[lookup role1 cs]
		, Just r2 <- [lookup role2 cs]
		] )

twoPlacers, twoPlaceStarters :: [(String, [(Entity,Entity)])]
twoPlaceStarters = [
    ]

twoPlacers =
	gentwoPlacer affiliation "have" "nationality" Theme Source :
	gentwoPlacer question "how_old" "age" Predicate Pivot:
	gentwoPlacer question "man_or_woman" "sex" Predicate Pivot:
	gentwoPlacer question "male_or_female" "sex" Predicate Pivot:
	gentwoPlacer event	"say" "state" Agent Predicate:
	gentwoPlacer condition	"fifteen" "fifteen" Predicate Pivot:
	gentwoPlacer condition	"sixteen" "sixteen" Predicate Pivot:
	gentwoPlacer condition	"eighteen" "eighteen" Predicate Pivot:
	gentwoPlacer condition	"nineteen" "nineteen" Predicate Pivot:
	gentwoPlacer condition	"twentyone" "twentyone" Predicate Pivot:
	gentwoPlacer condition	"twentytwo" "twentytwo" Predicate Pivot:
	gentwoPlacer condition	"twentythree" "twentythree" Predicate Pivot:
	gentwoPlacer question	"student" "school" Predicate Pivot:
	gentwoPlacer event	"greet" "greet" Agent Patient:
	gentwoPlacer condition	"taiwan" "taiwan" Predicate Pivot:
	gentwoPlacer condition	"turkey" "turkey" Predicate Pivot:
	gentwoPlacer condition	"male" "male" Predicate Pivot:
	gentwoPlacer condition	"female" "female" Predicate Pivot:
	gentwoPlacer condition	"girl" "female" Predicate Pivot:
	gentwoPlacer condition	"young" "young" Predicate Pivot:
	gentwoPlacer question	"hispanic" "hispanic" Predicate Pivot:
	twoPlaceStarters

predid2 name = if name `elem` (map fst twoPlacers) then
	Just (pred2 (concat [ twople | (id, twople) <- twoPlacers
		, id == name] ) ) else
		-- Nothing
		error $ "no '" ++ name ++ "' two-place predicate."

curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)

genthreePlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> Case -> Case ->
	(String, ThreePlacePred)
genthreePlacer area id content role1 role2 role3 =
	( id, pred3 [ (r1,r2,r3) | (co,cs) <- area
		, co == content
		, Just r1 <-[lookup role1 cs]
		, Just r2 <- [lookup role2 cs]
		, Just r3 <- [lookup role3 cs]
		] )

threePlacers, threePlaceStarters :: [(String, ThreePlacePred)]
threePlaceStarters = [
    ]
threePlacers =
	(genthreePlacer event "ask_V2Q" "ask" Agent Recipient Predicate) :
	genthreePlacer event "tell" "state" Agent Recipient Predicate :
	threePlaceStarters

type Content = String
data Case = Agent | Asset | Attribute | Beneficiary | Cause | CoAgent |
	CoPatient | CoTheme | Destination | Experiencer | Extent | Goal |
	InitialLocation | Instrument | Location | Material | Patient | Pivot |
	Predicate | Product | Recipient | Reflexive | Result | Source |
	Stimulus | Theme | Time | Topic | Trajectory | Value
  deriving Eq

genfourPlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> Case -> Case ->
	Case -> (String, FourPlacePred)
genfourPlacer area id content role1 role2 role3 role4 =
	( id, pred4 [ (r1,r2,r3,r4) | (co,cs) <- area
		, co == content
		, Just r1 <-[lookup role1 cs]
		, Just r2 <- [lookup role2 cs]
		, Just r3 <- [lookup role3 cs]
		, Just r4 <- [lookup role4 cs]
		] )

fourPlacers, fourPlaceStarters :: [(String, FourPlacePred)]
fourPlaceStarters = [
        ]

fourPlacers =
	fourPlaceStarters

fivePlacers = [
        ]


forgetful5 :: FivePlacePred -> FourPlacePred
forgetful5 r u v w t = or ( map ( r u v w t ) entities )

forgetful4 :: FourPlacePred -> ThreePlacePred
forgetful4 r u v w = or ( map ( r u v w ) entities )

forgetful3 :: ThreePlacePred -> TwoPlacePred
forgetful3 r u v = or ( map ( r u v ) entities )

forgetful2 :: TwoPlacePred -> OnePlacePred
forgetful2 r u = or ( map ( r u ) entities )

passivize :: TwoPlacePred -> OnePlacePred
passivize r     = \ x -> or ( map ( flip  r x ) entities )

passivize3 :: ThreePlacePred -> TwoPlacePred
passivize3 r    = \x y -> or ( map ( \u -> r u x y ) entities )

passivize4 r = \x y z -> or ( map (\u -> r u x y z ) entities )

self ::  (a -> a -> b) -> a -> b
self p	= \ x -> p x x 

-- vim: set ts=2 sts=2 sw=2 noet:
