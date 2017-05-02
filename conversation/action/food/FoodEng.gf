--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete FoodEng of Food = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	ever	= ParadigmsEng.mkAdV "ever" ;

-- AP

	-- same	= mkCN( mkAP( mkA "same") ) ;
	ready	= mkA2( mkA "ready") to;
	positive	= mkAP( mkA "positive") ;
	personal	= mkAP( mkA "personal") ;
	new	= mkAP( mkA "new") ;
	learning	= mkAP( mkA "learning") ;
	community	= mkAP( mkA "community") ;
	business_AP	= mkAP( mkA "business") ;

-- Conj

	and	= mkConj "and";

-- Det

	three	= mkDet( mkCard (mkNumeral n3_Unit));
	more_DET	= mkDet( ParadigmsEng.mkQuant "more" nonExist) singularNum;
	every	= mkDet( ParadigmsEng.mkQuant "every" nonExist) singularNum;

-- N

	way	= mkCN( mkN nonhuman (mkN "way") );
	town	= mkCN( mkN nonhuman (mkN "town") );
	time	= mkN2( mkN nonhuman (mkN "time") ) to;
	story	= mkCN( mkN nonhuman (mkN "story") );
	skill	= mkCN( mkN nonhuman (mkN "skill") );
	school	= mkN "school" nonExist;
	room	= mkCN( mkN nonhuman (mkN "room") );
	responsibility	= mkN "responsibility" nonExist;
	proposition	= mkCN( mkN nonhuman (mkN "proposition") );
	pocket	= mkCN( mkN nonhuman (mkN "pocket") );
	plate	= mkCN( mkN nonhuman (mkN "plate") );
	ourselves	= mkNP( mkN "ourselves" nonExist );
	money	= mkN "money" nonExist;
	meeting	= mkCN( mkN nonhuman (mkN "meeting") );
	life	= mkCN( mkN nonhuman (mkN "life") );
	kindness	= mkN "kindness" nonExist;
	kid	= mkCN( mkN human (mkN "kid") );
	food	= mkN "food" nonExist;
	environment	= mkCN( mkN nonhuman (mkN "environment") );
	each_other	= mkNP( mkN "each other" nonExist );
	business	= mkCN( mkN nonhuman (mkN "business") );
	action	= mkCN( mkN nonhuman (mkN "action") );

-- PN

	pam_warhurst	= mkPN( mkN feminine (mkN "Pam Warhurst") );

-- Prep

	with_PREP	= mkPrep "with";
	to	= mkPrep "to";
	in_PREP	= mkPrep "in";
	around	= mkPrep "around";
	amongst	= mkPrep "amongst";

-- Pron


-- Subj

	when	= mkSubj "When";

-- V

	want	= mkV2( mkV "want") noPrep;
	tell	= mkV2( mkV "tell") noPrep;
	teach	= mkV3( mkV "teach") noPrep noPrep;
	take	= mkV2( mkV "take") noPrep;
	support	= mkV2( mkV "support") noPrep;
	share	= mkV3( mkV "share") noPrep amongst;
	say	= mkVS( mkV "say") ;
	respond	= mkV2( mkV "respond") to;
	put	= mkV3( mkV "put") noPrep to;
	live	= mkV2( mkV "live") noPrep;
	know	= mkVS( mkV "know") ;
	invest	= mkV2( mkV "invest") in_PREP;
	focus	= mkV3( mkV "focus") noPrep around;
	explode	= mkV "explode";
	engage	= mkV2( mkV "engage") in_PREP;
	do	= mkV3( mkV "do") noPrep with_PREP;
	choose	= mkVV( mkV "choose") ;

}

-- vim: set ts=2 sts=2 sw=2 noet:
