--# -path=.:./engine:alltenses

concrete TornadoEng of Tornado = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng), ExtendEng in {

-- oper

lin

-- Adv

	last_thursday	= ParadigmsEng.mkAdv "last Thursday";
	in_ADV_LOCATION	= ParadigmsEng.mkAdv "in";

-- AP

	terrible	= mkAP( mkA "terrible") ;
	lucky	= mkAP( mkA "lucky") ;
	alive_and_well	= mkAP( mkA "alive and well") ;
	abandoned	= mkAP( mkA "abandoned") ;

-- Conj


-- Det


-- N

	wall	= mkCN( mkN nonhuman (mkN "wall") );
	tornado	= mkCN( mkN nonhuman (mkN "tornado") );
	storm	= mkCN( mkN nonhuman (mkN "storm") );
	Safe_to_say	s = myStoNP "safe to say that" s;
	ride	= mkN2( mkN nonhuman (mkN "ride") ) of_PREP;
	life	= mkCN( mkN nonhuman (mkN "life" "lives") );
	house	= mkCN( mkN "house") ;
	home	= mkCN( mkN "home") ;
	grandmother	= mkCN( mkN human (mkN "grandmother") );
	field	= mkCN( mkN "field") ;
	air	= mkN "air" nonExist;
	nineteen_year_old	= mkCN( mkN human (mkN "19-year-old") );
	one_fifty_miles_per_hour	= mkN "150 miles per hour" nonExist;
	thirteen_hundred_feet	= mkN "1,300 feet" nonExist;

-- PN

	missouri	= mkPN( mkN nonhuman (mkN "Missouri") );
	matt	= mkPN( mkN masculine (mkN "Matt") );

-- Prep

	to_PREP	= mkPrep "to";
	through_LOCPREP	= mkPrep "through";
	over_EXTENTPREP	= mkPrep "over";
	off_LOCPREP	= mkPrep "off";
	into_RESULTPREP	= mkPrep "into";
	in_LOCPREP	= mkPrep "in";
	by_the_name_of_ATTRIBUTEPREP	= mkPrep "by the name of";
	before_TIMEPREP	= mkPrep "before";
	at_LOCPREP	= mkPrep "at";
	after_TIMEPREP	= mkPrep "after";

-- Pron


-- Subj

	while	= mkSubj "while";

-- V

	Suck_in	np = ComplSlashPartLast (mkVPSlash (mkV2 (partV( mkV "suck") "in") )) np;
	watch_tv	= partV( mkV "watch") "TV";
	talk	= mkV2( mkV "talk") to_PREP;
	Take np adv 	= VP_Adv_extent (mkVP (mkV2 IrregEng.take_V noPrep) np) adv;
	start	= mkV "start";
	rip	= mkV3( mkV "rip") noPrep off_LOCPREP;
	intensify	= mkV2( mkV "intensify") into_RESULTPREP;
	fly	= mkV2 IrregEng.fly_V noPrep;
	drop	= mkV2( mkV "drop") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
