module Representation (module Representation, module Siar) where

import Data.DRS
import Data.DRS.Show

import Siar
import PGF

import Model
import Interpretation
-- import Story_Interpretation
-- import qualified Topic_Interpretation as Topic

import Data.Char
import Data.List
import Data.Tuple

entuples :: [(Entity,GPN)]
entuples = [
	(S,Gsimon)
	, (A, Gariel)
	, (C, Gchiyuantien)
	, (E, Genglish)
	]

ref2int :: DRSRef -> Int
ref2int (DRSRef r@('r':[d])) | isDigit d , n <- digitToInt d = n
ref2int r = error ("No digit for DRSRef " ++ (drsRefToDRSVar r))

isDummy :: DRSRef -> Bool
isDummy (DRSRef ('d':'u':'m':'m':'y':[d])) | isDigit d = True
isDummy _ = False

int2ref :: Int -> DRSRef
int2ref n = DRSRef ("r" ++ (show n) )

instance Eq GPN where
	(==) Gsimon Gsimon = True
	(==) Gariel Gariel = True
	(==) Gchiyuantien Gchiyuantien = True
	(==) Genglish Genglish = True
	(==) _ _ = False

gent2ent :: GPN -> Entity
gent2ent gent        | Just ent <- lookup gent (map swap entuples) = ent
ent2gent :: Entity -> GPN
ent2gent ent | Just gent <- lookup ent entuples = gent

lin :: Gf a => a -> String
lin e = stripApp (unApp (gf e))

stripApp :: Maybe (CId, [Expr]) -> String
stripApp = maybe "Undefined" (\x -> ((showCId . fst) x))

linNP :: GNP -> String
linNP (GEntity name) = lin name
linNP (GItem _ (GKind _ (GOfpos noun _))) = lin noun
linNP (GItem _ (GKind _ noun)) = lin noun
linNP (GItem _ noun) = lin noun
linNP (GMassItem _ noun) = lin noun

linAP :: GAP -> String
linAP (GAdvAdj _ a) = lin a
linAP a = lin a

linIP :: GIP -> String
linIP Gwho_WH = "person"
linIP Gwhat_WH = "thing"

-- e2t :: GPN -> Tree
-- e2t e | (Just tr) <- unApp (gf e) = tr

unmaybe (Just x) = x
-- unmaybe Nothing = I

repS :: GUtt -> Maybe (DRSRef -> DRS)
repS (GQUt (GPosQ (GYN (GSentence np vp)))) = Just (repNP np (repVP vp))
repS (GQUt (GPosQ (GTagComp np comp))) = repS (GQUt (GPosQ (GYN (GSentence np (GBe_vp comp)))))
repS (GQUt (GPosQ (GTagQ np vp))) = repS (GQUt (GPosQ (GYN (GSentence np vp))))
repS (GQUt (GPosQ (GWH_Pred wh vp))) = Just (repW wh (repVP vp))

new :: GNP -> DRSRef -> DRSRef
new np r = case np of
	Gshe	-> r
	Ghe	-> r
	_ -> let
		es = [r]
		rs = newDRSRefs [r] es
		r' = head rs in r'

newOnPart :: GPartitive -> DRSRef -> DRSRef
newOnPart _ r = new (GItem Ga_Det Gperson) r

newOnPos :: GN2 -> DRSRef -> DRSRef
newOnPos _ r = new (GItem Ga_Det Gperson) r

newOnPlace :: GPlace -> DRSRef -> DRSRef
newOnPlace _ r = new (GItem Ga_Det Gperson) r

repNP :: GNP -> (DRSRef -> DRS) -> DRSRef -> DRS
repNP (GItem det cn) p r = (repDet det) (repCN cn) p r
repNP (GMassItem det n) p r = (repMassDet det) (repN n) p r
repNP (GEntity name) p r
	| entity <- (gent2ent name) , entity `elem` entities = let
	DRS rs conds = p r
	len = length (nub rs)
	reflist = newDRSRefs (replicate len (DRSRef "r")) [] in
	(DRS reflist ((Rel (DRSRel (lin name)) [r]) : conds))
repNP Gshe p r = let
	dummy =DRSRef "dummy1"
	iminus = ref2int r - 1
	rolled_ref = int2ref iminus
	she_refs = case r of
		(DRSRef "r1") -> [DRSRef "r1"]
		_ -> newDRSRefs (replicate iminus (DRSRef "r")) []
	DRS rs conds = p r
	reals = filter (not . isDummy) rs
	len = ref2int (maximum reals)
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	she_conds = foldl1 (\cs1 cs2 -> [Or
		(DRS [] cs1 )
		(DRS [] cs2)]) (map (sheDRS conds dummy ) she_refs) in
	(DRS reflist she_conds) where
	sheDRS :: [DRSCon] -> DRSRef -> DRSRef -> [DRSCon]
	sheDRS conds d r = (female r: (map (subst d r) conds))
	female :: DRSRef -> DRSCon
	female r = (Rel (DRSRel "female") [r])
	subst :: DRSRef -> DRSRef -> DRSCon -> DRSCon
	subst d r c = case c of
		(Rel rel rs) -> Rel rel (
			map (\x -> if x == d then r else x) rs
			)
		(Neg (DRS reflist conds)) ->
			Neg (DRS reflist (map (subst d r) conds))
		(Prop ref (DRS reflist conds)) ->
			Prop ref (DRS reflist (map (subst d r) conds))
		_	-> c
repNP Ghe p r = let
	dummy =DRSRef "dummy1"
	iminus = ref2int r - 1
	rolled_ref = int2ref iminus
	he_refs = case r of
		(DRSRef "r1") -> [DRSRef "r1"]
		_ -> newDRSRefs (replicate iminus (DRSRef "r")) []
	DRS rs conds = p r
	reals = filter (not . isDummy) rs
	len = ref2int (maximum reals)
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	he_conds = foldl1 (\cs1 cs2 -> [Or
		(DRS [] cs1 )
		(DRS [] cs2)]) (map (heDRS conds dummy ) he_refs) in
	(DRS reflist he_conds) where
	heDRS :: [DRSCon] -> DRSRef -> DRSRef -> [DRSCon]
	heDRS conds d r = (male r: (map (subst d r) conds))
	male :: DRSRef -> DRSCon
	male r = (Rel (DRSRel "male") [r])
	subst :: DRSRef -> DRSRef -> DRSCon -> DRSCon
	subst d r c = case c of
		(Rel rel rs) -> Rel rel (
			map (\x -> if x == d then r else x) rs
			)
		(Neg (DRS reflist conds)) ->
			Neg (DRS reflist (map (subst d r) conds))
		(Prop ref (DRS reflist conds)) ->
			Prop ref (DRS reflist (map (subst d r) conds))
		_	-> c



repDet :: GDet -> (DRSRef -> DRS) -> (DRSRef -> DRS) -> DRSRef -> DRS
repDet Ga_Det = \ p q r-> let
	DRS prs pconds = p r
	DRS qrs qconds = q (maximum prs)
	len = ref2int (maximum qrs)
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	conds = pconds ++ qconds
	in DRS reflist conds
repDet Gher_Det = \ p q dummy-> let
	iminus = ref2int dummy - 1
	rolled_ref = int2ref iminus
	her_refs = case dummy of
		(DRSRef "r1") -> [DRSRef "r1"]
		_ -> newDRSRefs (replicate iminus (DRSRef "r")) []
	DRS prs pconds = p dummy
	thing = maximum prs
	DRS qrs qconds = q thing
	len = ref2int (maximum qrs)
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	her_cond = foldl (\ors dummy -> Or
		(DRS [] [ female dummy, have dummy thing] )
		(DRS [] [ors])) false her_refs
	conds = pconds ++ [her_cond] ++ qconds
	in DRS reflist conds where
	female :: DRSRef -> DRSCon
	female r = (Rel (DRSRel "female") [r])
	have :: DRSRef -> DRSRef -> DRSCon
	have r thing = Rel (DRSRel "have") [r, thing]
	false :: DRSCon
	false = Rel (DRSRel "true") [DRSRef "r1"]
repDet Gsome_Det = repDet Ga_Det
repDet GtheSg_Det = repDet Ga_Det
repDet Gsome_pl_Det = repDet Gsome_Det
repDet GthePlural_Det =  repDet Gsome_pl_Det
repDet Gthree   = repDet Gsome_pl_Det
repDet Gfive   = repDet Gsome_pl_Det
repDet (GApos owner) = \p q r -> let
	len = ref2int r
	iminus = len - 1
	iplus = len + 1
	(owner_ref,thing) = case owner of
		Gshe -> (int2ref iminus, int2ref len)
		Ghe -> (int2ref iminus, int2ref len)
		_ -> (int2ref len, int2ref iplus)
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	ownership_cond =  Rel (DRSRel "have") [owner_ref, thing]
	DRS prs pconds = p thing
	DRS qrs qconds = q (maximum prs)
	len' = length (nub (r: prs ++ qrs))
	reflist' = newDRSRefs (replicate len' (DRSRef "r")) []
	conds = pconds ++ [ownership_cond] ++ qconds
	in repNP owner (\ ref -> DRS reflist' conds ) owner_ref
repDet (GApos_pl owner) = repDet (GApos owner)

repMassDet :: GMassDet -> (DRSRef -> DRS) -> (DRSRef -> DRS) -> DRSRef -> DRS
repMassDet Gzero_Det_sg = \ p q r-> let
	DRS prs pconds = p r
	DRS qrs qconds = q (maximum prs)
	len = length (nub (prs ++ qrs))
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	conds = pconds ++ qconds
	in DRS reflist conds
repMassDet Gthe_mass_Det = repMassDet Gzero_Det_sg
repMassDet (GMassApos owner) = \p q r -> let
	len = ref2int r
	iminus = len - 1
	iplus = len + 1
	(owner_ref,thing) = case owner of
		Gshe -> (int2ref iminus, int2ref len)
		Ghe -> (int2ref iminus, int2ref len)
		_ -> (int2ref len, int2ref iplus)
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	ownership_cond =  Rel (DRSRel "have") [owner_ref, thing]
	DRS prs pconds = p thing
	DRS qrs qconds = q (maximum prs)
	len' = length (nub (r: prs ++ qrs))
	reflist' = newDRSRefs (replicate len' (DRSRef "r")) []
	conds = pconds ++ [ownership_cond] ++ qconds
	in repNP owner (\ ref -> DRS reflist' conds ) owner_ref
repMassDet her_MassDet = \ p q r-> let
	her_refs = newDRSRefs (replicate (ref2int r - 1) (DRSRef "r")) []
	DRS prs pconds = p r
	thing = maximum prs
	DRS qrs qconds = q thing
	len = ref2int (maximum qrs)
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	her_cond = foldl (\ors r -> Or
		(DRS [] [ female r, have r thing] )
		(DRS [] [ors])) false her_refs
	conds = pconds ++ [her_cond] ++ qconds
	in DRS reflist conds where
	female :: DRSRef -> DRSCon
	female r = (Rel (DRSRel "female") [r])
	have :: DRSRef -> DRSRef -> DRSCon
	have r thing = Rel (DRSRel "have") [r, thing]
	false :: DRSCon
	false = Rel (DRSRel "true") [DRSRef "r1"]

repN :: GN -> DRSRef -> DRS
repN name = \r ->
	DRS [r] [Rel (DRSRel (lin name)) [r]]
repN2 :: GN2 -> DRSRef -> DRS
repN2 name     = \r ->
	DRS [r] [Rel (DRSRel (lin name)) [r]]
repPartitive :: GPartitive -> DRSRef -> DRS
repPartitive name     = \r ->
	DRS [r] [Rel (DRSRel (lin name)) [r]]

repCN :: GCN -> DRSRef -> DRS
repCN (GKind ap cn) = \r -> let
       DRS thing_refs thing_conds = (repCN cn r)
       DRS attri_refs attri_conds = (repAP ap r)
       in DRS (thing_refs ++ attri_refs) (thing_conds ++ attri_conds)
repCN (GOfpart part n) = \r -> let
	form = r
	thing = newOnPart part r
	DRS _ partconds = repPartitive part form
	DRS _ thingconds = repN n thing
	formcond = [ Rel (DRSRel "in_form_of") [thing,form] ]
	in DRS [form, thing] (partconds ++ thingconds ++ formcond)
repCN (GOfpos n2 np) = \r -> let
	owner = r
	thing = new np r
	DRS rs conds = repN2 n2 thing in
	repNP np (\owner -> let
	newconds = conds ++ [Rel (DRSRel "have") [owner, thing]]
	in DRS [owner, thing, newOnPos n2 thing] newconds ) owner
repCN (GModified cn rs) = \r -> let
	DRS thing_refs thing_conds = repCN cn r
	DRS attri_refs attri_conds = case rs of
		(GSubjRel wh vp) -> repVP vp r
	len = ref2int (maximum (thing_refs ++ attri_refs))
	reflist = newDRSRefs (replicate len (DRSRef "r")) [] in
	DRS reflist (thing_conds ++ attri_conds)
repCN name     = \r ->
	DRS [r] [Rel (DRSRel (lin name)) [r]]

repAP :: GAP -> DRSRef -> DRS
repAP (GAdvAdj _ a) = \ r -> DRS [r] [Rel (DRSRel (lin a)) [r]]
repAP ap = \r -> DRS [r] [Rel (DRSRel (lin ap)) [r]]

repPlace :: GPlace -> (DRSRef -> DRS) -> DRSRef -> DRS
repPlace (GLocation det name) p r = (repDet det) (repPlaceName name) p r
repPlace place p r = let
	DRS rs conds = p r
	len = ref2int (maximum rs)
	reflist = newDRSRefs (replicate len (DRSRef "r")) [] in
	(DRS reflist ((Rel (DRSRel (lin place)) [r]) : conds))

repPlaceName :: GPlaceName -> DRSRef -> DRS
repPlaceName (GPlaceKind ap name) = \r -> let
       DRS name_refs name_conds = (repPlaceName name r)
       DRS attri_refs attri_conds = (repAP ap r)
       in DRS (name_refs ++ attri_refs) (name_conds ++ attri_conds)
repPlaceName name = \r -> DRS [r] [Rel (DRSRel (lin name)) [r]]

repVP :: GVP -> DRSRef -> DRS
repVP (GWithCl vp _) = repVP vp
repVP (GWithStyle vp _) = repVP vp
repVP (GWithTime vp _) = repVP vp
repVP (GBe_vp comp) = case comp of
	(GBe_someone np) -> \r -> let
		DRS rs conds = repNP np
			(\ hypernym -> DRS [hypernym] [] ) r
		len = ref2int (maximum rs)
		reflist = newDRSRefs (replicate len (DRSRef "r")) [] in
		DRS rs conds
	GBe_bad ap -> repAP ap
	GBe_somewhere (GLocating prep place) -> \r -> 
		repPlace place (\name -> DRS [r,name]
		[ Rel (DRSRel (lin prep)) [r, name]]
		) (newOnPlace place r)
repVP (GWithPlace v (GLocating prep place)) = \r ->
	repPlace place (\name -> DRS [r,name]
	[ Rel (DRSRel (lin v)) [r,name]]
	) (newOnPlace place r)
repVP (GLook_bad v ap) = \r -> let
	patient = r
	DRS rs' [Rel rel rs] = repAP ap patient
	lin_ap = linAP ap
	p = DRSRef "p"
	look_conds = [Rel (DRSRel (lin v)) [patient, p]
		, Prop p (DRS [] [Rel (DRSRel lin_ap) rs])]
	in DRS [patient] look_conds
repVP (GHappening v) = \r -> DRS [r] [Rel (DRSRel (lin v)) [r]]
repVP (GChanging v obj) = \r -> repNP obj
	(\patient -> DRS [r,patient] [Rel (DRSRel (lin v)) [r, patient]] ) (new obj r)
repVP (GTriangulating v obj1 obj2) = \r -> repNP obj1 (\theme ->
		repNP obj2 (\recipient ->
			DRS [r,theme,recipient] [Rel (DRSRel (lin v)) [r, theme, recipient]]
			) (new obj2 theme) ) (new obj1 r)
repVP (GPositing v0 (GPosS (GSentence np vp))) = case vp of
	(GBe_vp comp) -> case comp of
		(GBe_bad ap ) -> \r -> repNP np (\referent -> let
			d = repAP ap referent
			p = DRSRef "p" in
			DRS [referent] [Rel (DRSRel (lin v0)) [r,p]
				, Prop p d] ) (new np r)
		(GBe_someone subjcomp ) -> \r -> repNP np (\referent ->
			repNP subjcomp (\_ -> let
			cond = [Rel (DRSRel (lin v0)) [r, DRSRef ((lin v0)++":be")]
				, Prop (DRSRef ((lin v0)++":be")) (DRS []
				[Rel (DRSRel ((linNP subjcomp)++"_prop")) [referent] ])]
			in DRS [referent] cond ) r ) r
	(GIntens vv vp2) -> case vp2 of
		(GChanging v obj) -> \r ->
			repNP np (\referent -> repNP obj (\theme -> let
			lin_v = lin v
			p = DRSRef "p"
			conds = [Rel (DRSRel (lin v0)) [r, p]
				, Prop p (DRS [] [Rel 
				(DRSRel lin_v) [referent, theme]])]
			in DRS [r, theme, referent] conds )
			(new obj referent) ) (new np r)
repVP (GPositing v0 (GNegS (GSentence np vp))) = case vp of
	(GIntens vv vp2) -> case vp2 of
		(GChanging v obj) -> \r -> repNP np (\referent ->
			repNP obj (\theme -> let
			lin_v = lin v
			p = DRSRef "p"
			conds = [Rel (DRSRel (lin v0)) [r, p]
				, Prop p (DRS [] [Neg (DRS []
				[Rel (DRSRel lin_v)
				[referent, theme]])])]
			in DRS [r, theme, referent] conds )
			(new obj referent) ) (new np r)
repVP (GCausative v0 obj vp) = case vp of
	(GLook_bad v ap) -> \r ->
		repNP obj (\patient -> let
			lin_v0 = lin v0
			lin_v = lin v
			DRS rs' [Rel rel rs] = repAP ap patient
			lin_ap = linAP ap
			p1 = DRSRef "p1"
			p2 = DRSRef "p2"
			conds = [Rel (DRSRel lin_v0) [r, p1]
				, Prop p1 (DRS [] [Rel
				(DRSRel lin_v) [patient, p2]
					, Prop p2 (DRS [] [Rel (DRSRel lin_ap) rs])])]
			in DRS [r, patient] conds ) (new obj r)

repW :: GIP -> (DRSRef -> DRS) -> DRSRef -> DRS
repW Gwho_WH p r = let
	person = Rel (DRSRel "person") [r]
	DRS rs conds = p r
	len = ref2int (maximum rs)
	reflist = newDRSRefs (replicate len (DRSRef "r")) [] in
	(DRS reflist ( person : conds))
repW (GWHose cn) p r = let
	owned = new (GItem Ga_Det cn) r
	ownership_conds =  [ Rel (DRSRel "have") [r, owned] ]
	DRS rs conds = repCN cn owned
	DRS prs pconds = p owned
	len = ref2int (maximum (rs ++ prs))
	reflist = newDRSRefs (replicate len (DRSRef "r")) [] in
	DRS reflist (conds ++ ownership_conds ++ pconds)

-- repW Gwhat_WH p = Merge (DRS [x] [Rel (DRSRel "thing") [x] ] ) (p x)

-- vim: set ts=2 sts=2 sw=2 noet:
