--# -path=.:./engine:alltenses

concrete BullEng of Bull = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	luckily	= ParadigmsEng.mkAdv "luckily";
	just	= ParadigmsEng.mkAdV "just";
	apparently	= ParadigmsEng.mkAdV "apparently";

-- AP

	sudden	= mkA "sudden";
	shocked	= mkA2( mkA "shocked") at_STIMULUSPREP;
	unexpected	= mkAP( mkA "unexpected") ;
	fast	= mkAP( mkA "fast") ;
	bored	= mkA2( mkA "bored") with_STIMULUSPREP;
	fourteen_year_old	= mkAP( mkA "14-year-old") ;

-- Conj


-- Det


-- N

	way	= mkCN( mkN "way") ;
	viewer	= mkCN( mkN human (mkN "viewer") );
	turn	= mkCN( mkN nonhuman (mkN "turn") );
	teenager	= mkCN( mkN human (mkN "teenager") );
	soccer	= mkN "soccer" nonExist;
	player	= mkCN( mkN human (mkN "player") );
	goal	= mkCN( mkN "goal") ;
	game	= mkCN( mkN nonhuman (mkN "game") );
	field_PLACENOUN	= mkCN( mkN "field") ;
	field	= mkCN( mkN nonhuman (mkN "field") );
	bull	= mkCN( mkN nonhuman (mkN "bull") );
	boy	= mkCN( mkN human (mkN "boy") );
	ball	= mkCN( mkN nonhuman (mkN "ball") );

-- PN

	saturday	= mkPN( mkN nonhuman (mkN "Saturday") );
	australia	= mkPN( mkN nonhuman (mkN "Australia") );

-- Prep

	with_STIMULUSPREP	= mkPrep "with";
	toward_LOCPREP	= mkPrep "toward";
	out_of_LOCPREP	= mkPrep "out of";
	on_TIMEPREP	= mkPrep "on";
	in_LOCPREP	= mkPrep "in";
	at_STIMULUSPREP	= mkPrep "at";

-- Pron


-- Subj


-- V

	witness	= mkV2( mkV "witness") noPrep;
	take	= mkV2 IrregEng.take_V noPrep;
	shock	= mkV2( mkV "shock") noPrep;
	run	= IrregEng.run_V;
	manage	= mkVV( mkV "manage") ;
	leave	= mkV2 IrregEng.leave_V noPrep;
	leave_A	= mkV2A IrregEng.leave_V noPrep;
	join	= mkV2( mkV "join") noPrep;
	Get prep place	= VP_Adv_location (mkVP IrregEng.get_V ) (Locating prep place);
	escape	= mkV "escape";
	enter	= mkV2( mkV "enter") noPrep;
	decide	= mkVV( mkV "decide") ;
	chase	= mkV2( mkV "chase") noPrep;
	charge_V	= mkV "charge";
	charge	= mkV2( mkV "charge") noPrep;
	begin	= mkVV IrregEng.begin_V ;

}

-- vim: set ts=2 sts=2 sw=2 noet:
