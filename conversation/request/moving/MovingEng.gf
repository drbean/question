--# -path=.:./engine:alltenses

concrete MovingEng of Moving = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	too	= ParadigmsEng.mkAdv "too";
	really	= ParadigmsEng.mkAdV "really";
	out	= ParadigmsEng.mkAdv "out";
	already	= ParadigmsEng.mkAdv "already";

-- AP

	ok	= mkAP( mkA "OK") ;
	new	= mkAP( mkA "new") ;

-- Conj

	but	= mkConj "but";

-- Det


-- N

	weekend	= mkCN( mkN nonhuman (mkN "weekend") );
	truck	= mkCN( mkN nonhuman (mkN "truck") );
	truck_PLACE = truck;
	stuff	= mkN "stuff" nonExist;
	place	= mkCN( mkN nonhuman (mkN "place") );
	help_N	= mkN "help" nonExist;
	goldfish	= mkN "goldfish" nonExist;
	favor	= mkCN( mkN nonhuman (mkN "favor") );
	apartment	= mkCN( mkN nonhuman (mkN "apartment") );

-- PN

	sunday	= mkPN( mkN nonhuman (mkN "Sunday") );
	keiko	= mkPN( mkN feminine (mkN "Keiko") );
	hunter	= mkPN( mkN masculine (mkN "Hunter") );
	friday	= mkPN( mkN nonhuman (mkN "Friday") );
	claire	= mkPN( mkN feminine (mkN "Claire") );
	carlos	= mkPN( mkN masculine (mkN "Carlos") );

-- Prep

	with_THEMEPREP	= mkPrep "with";
	to_LOCPREP	= mkPrep "to";
	to_PREP	= mkPrep "to";
	out_of_LOCPREP	= mkPrep "out of";
	on_TIMEPREP	= mkPrep "on";
	in_LOCPREP	= mkPrep "in";
	for_TIMEPREP	= mkPrep "for";
	for_ATTRIBUTEPREP	= mkPrep "for";
	at_LOCPREP	= mkPrep "at";

-- Pron


-- Subj


-- V

	wonder	= mkVQ( mkV "wonder") ;
	want	= mkV2( mkV "want") noPrep;
	understand	= mkV "understand";
	thank	= mkV2( mkV "thank") noPrep;
	take	= mkV3 IrregEng.take_V noPrep out_of_LOCPREP;
	say	= mkVS IrregEng.say_V ;
	put	= mkV3 IrregEng.put_V noPrep in_LOCPREP;
	pack	= mkV2( mkV "pack") noPrep;
	pack_V	= mkV "pack";
	move	= mkV2( mkV "move") to_LOCPREP;
	mind	= ingVV( mkV "mind") ;
	love	= mkVV( mkV "love") ;
	Leave	np prep place= VP_Adv_location (mkVP (mkV2 IrregEng.leave_V noPrep) np) (Locating prep place);
	help_V	= mkV2V( mkV "help") noPrep noPrep;
	help	= mkV2( mkV "help") noPrep;
	go_away	= partV( mkV "go") "away";
	come_by	= partV( IrregEng.come_V) "by";
	borrow	= mkV2( mkV "borrow") noPrep;
	ask_2Q	= mkV2Q( mkV "ask") noPrep;
	ask	= mkVQ( mkV "ask") ;
	agree	= mkVV( mkV "agree") ;

}

-- vim: set ts=2 sts=2 sw=2 noet:
