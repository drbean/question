module Evaluation (readPGF, languages, buildMorpho, morphoMissing, term2ref, drsRefs, xyzwp, var_e, unmaybe, rep, drsToLF, linear, showExpr, transform) where

import PGF2
import Data.DRS hiding (Or,Neg,Imp,Rel)
import Representation hiding ((==))
import Translate
import LogicalForm
import Interpretation
import Model
import Utility (lc_first, chomp, leading_space, be_morphology)

import Data.Maybe
import Control.Monad

import GHC.IO.Handle
import System.IO

import System.Environment.FindBin

import Data.List
import Data.Char
import qualified Data.Map as Map

--type FInterp = String -> [Entity] -> Entity
--
--fint :: FInterp
--fint name [] =	maybe (entities!!26) id $ lookup name characters

realents :: [Entity]
-- realents = filter ( not . flip elem [Unspec,Someone,Something] ) entities
namedents = map snd characters
realents = entities

ref2ent :: Entity -> DRSRef -> Entity
ref2ent e x = e

ent2ref :: Entity -> DRSRef
ent2ref e = let [ref] = [ r | r <- [DRSRef "x", DRSRef "y", DRSRef "z", DRSRef "w", DRSRef "p"]
			, ref2ent e r == e ] in ref

term2ent :: Term -> Entity
term2ent (Const e) = e
term2ent _ = Something

subst :: (Term -> Entity) -> Term -> Entity -> (Term -> Entity) 
subst g x d = \ v -> if x == v then d else g v

eval :: (Term -> Entity) -> LF -> Maybe Answer
eval g (Exists v f)     = Just (disjLF [ fromMaybe NoAnswer ( eval (subst g v d) f) | d <- entities ])
eval g (Forall v f)     = Just (conjLF [ fromMaybe NoAnswer ( eval (subst g v d) f) | d <- entities ])
eval g (Conj lfs) = Just (conjLF (map (fromMaybe NoAnswer . eval g) lfs))
eval g (Disj lfs) = Just (disjLF (map (fromMaybe NoAnswer . eval g) lfs))
eval g (Neg form) = eval g form >>= notLF
eval g (Imp lfs@[f1, f2]) = Just (implLF (map (fromMaybe NoAnswer . eval g) lfs))
eval g (Rel name ts) = int name (map g ts)
eval g Top = Just (Boolean True)
eval g Bottom = Just (Boolean False)

answer2bool :: Answer -> Bool
answer2bool (Boolean b) = b
answer2bool _ = False

notLF :: Answer -> Maybe Answer
notLF (Boolean b) = Just (Boolean (not b))
notLF _	= Nothing

lifting :: ([Bool] -> Bool) -> [Answer] -> Answer
lifting f as = if (elem NoAnswer as) then NoAnswer
	else Boolean (f (map debooled as)) where
		debooled (Boolean b) = b

implLF :: [Answer] -> Answer
implLF = lifting (\[b1, b2] -> not (b1 && (not b2)))

conjLF :: [Answer] -> Answer
conjLF = lifting and

disjLF :: [Answer] -> Answer
disjLF = lifting or

bool2Maybe :: Bool -> Maybe Bool
bool2Maybe = \x -> case x of False -> Nothing; True -> Just True

evalW :: LF -> Maybe [Entity]
evalW (scope)	= Just [ e | e <- namedents
				, a <- [eval (\v -> e) scope]
				, a == Just (Boolean True)
							]
evalW _ = Nothing

notNull :: [Entity] -> Maybe Answer
notNull [] = Just (Boolean False )
notNull [_] = Just (Boolean True )
notNull [_,_] = Just (Boolean True )
notNull [_,_,_] = Just (Boolean True )
notNull [_,_,_,_] = Just (Boolean True )
notNull [_,_,_,_,_] = Just (Boolean True )
notNull _ = Nothing

smallN :: [a] -> Bool
smallN [_,_]	= True
smallN [_,_,_]	= True
smallN _	= False

bigN :: [a] -> Bool
bigN [] = False
bigN [_] = False
bigN xs = not . smallN $ xs

-- used by both Transfer, Tests

-- parse :: PGF -> String -> [ParseOutput]
parse = do
	path <- getProgPath
	gr <- readPGF ( path ++ "/Tenant.pgf" )
	let Just eng = Map.lookup "TenantEng" (languages gr)
	let morpho = map fst (fullFormLexicon eng) ++ be_morphology
	hClose stderr
	hDuplicateTo stdout stderr

-- transform :: Tree -> Maybe Tree
transform = gfmaybe <=< answer . fg

-- gfmaybe :: GUtt -> Maybe Tree
gfmaybe (GYes) = Just (gf GYes)
gfmaybe (GNo) = Just (gf GNo)
gfmaybe (GAnswer x) = Just (gf (GAnswer x))
gfmaybe _ = Nothing

-- rep :: Tree -> Maybe (DRSRef -> DRS)
rep x =  (repS . fg) x

answer :: GUtt -> Maybe GUtt
answer	utt@(GQUt (GMkQS GpresentTense GsimultaneousAnt GpositivePol (GYN _)))
	| eval (\v -> Unspec) lf == Just (Boolean True) = Just GYes
	| eval (\v -> Unspec) lf == Just (Boolean False) = Just GNo
	| otherwise = Just GNoAnswer
	where
		drs = ((unmaybe . repS) utt) (DRSRef "r1")
		lf = drsToLF drs
answer	utt@(GQUt (GMkQS GpresentTense GsimultaneousAnt GnegativePol (GYN _)))
	| eval (\v -> Unspec) lf == Just (Boolean True) = Just GYes
	| eval (\v -> Unspec) lf == Just (Boolean False) = Just GNo
	| otherwise = Just GNoAnswer
	where
		drs = ((unmaybe . repS) utt) (DRSRef "r1")
		lf = drsToLF drs
answer	utt@(GQUt (GMkQS GpresentTense GsimultaneousAnt GpositivePol (GTagS _ _)))
	| eval (\v -> Unspec) lf == Just (Boolean True) = Just GYes
	| eval (\v -> Unspec) lf == Just (Boolean False) = Just GNo
	| otherwise = Just GNoAnswer
	where
		drs = ((unmaybe . repS) utt) (DRSRef "r1")
		lf = drsToLF drs
answer	utt@(GQUt (GMkQS GpresentTense GsimultaneousAnt GnegativePol (GTagS _ _)))
	| eval (\v -> Unspec) lf == Just (Boolean True) = Just GYes
	| eval (\v -> Unspec) lf == Just (Boolean False) = Just GNo
	| otherwise = Just GNoAnswer
	where
		drs = ((unmaybe . repS) utt) (DRSRef "r1")
		lf = drsToLF drs
--answer	(GQUt (GPosQ (GTagComp np comp))) = 
--	answer	(GQUt (GPosQ (GYN (GSentence np (GBe_vp comp)))))
--answer	(GQUt (GNegQ (GTagComp np comp))) = 
--	answer	(GQUt (GNegQ (GYN (GSentence np (GBe_vp comp)))))
answer	utt@(GQUt _) = case (evalW . drsToLF) (((unmaybe . repS) utt) (DRSRef "r1")) of
	(Just []) -> Just (GAnswer Gno_PL_NP)
	(Just [x]) -> Just (GAnswer (GEntity (ent2gent x)))
	(Just [x,y]) -> Just (GAnswer (GCloseList Gor_CONJ (GList (GEntity (ent2gent x)) (GEntity (ent2gent y)))))
	(Just [x,y,z]) -> Just (GAnswer (GCloseList Gor_CONJ (GAddList (GEntity (ent2gent x)) (GList (GEntity (ent2gent y)) (GEntity (ent2gent z))))))
	(Just [x,y,z,w]) -> Nothing
	otherwise	-> Nothing

-- vim: set ts=2 sts=2 sw=2 noet:
