--# -path=.:./engine:alltenses

concrete AllEng of All = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng), ExtendEng in {

-- oper

lin

-- bull

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
	charge_V2	= mkV2( mkV "charge") noPrep;
	begin	= ingVV IrregEng.begin_V ;

-- tornado

-- Adv

	last_thursday	= ParadigmsEng.mkAdv "last Thursday";
	in_ADV_LOCATION	= ParadigmsEng.mkAdv "in";

-- AP

	terrible	= mkAP( mkA "terrible") ;
	safe	= mkAP( mkA "safe") ;
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
	-- field	= mkCN( mkN "field") ;
	air	= mkN "air" nonExist;
	nineteen_year_old	= mkCN( mkN human (mkN "19-year-old") );
	one_fifty_miles_per_hour	= mkNP (mkN "150 miles per hour" nonExist);
	thirteen_hundred_feet	= mkN "1,300 feet" nonExist;

-- PN

	missouri	= mkPN( mkN nonhuman (mkN "Missouri") );
	matt	= mkPN( mkN masculine (mkN "Matt") );

-- Prep

	at_VALUEPREP	= mkPrep "at";
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
	say	= mkVS IrregEng.say_V ;
	rip	= mkV3( mkV "rip") noPrep off_LOCPREP;
	intensify	= mkV2( mkV "intensify") into_RESULTPREP;
	fly	= mkV2 IrregEng.fly_V through_LOCPREP;
	drop	= mkV2( mkV "drop") noPrep;


-- rescue

-- Adv

	early_tuesday_morning	= ParadigmsEng.mkAdv "early Tuesday morning";

-- AP

	sudden	= mkA "sudden" ;
	surprising	= mkA "surprising" ;
	local	= mkAP( mkA "local") ;

-- Conj


-- Det

	two	= mkDet( mkCard (mkNumeral n2_Unit));
	all	= ss "all";

-- N

	vehicle	= mkCN( mkN nonhuman (mkN "vehicle") );
	thief	= mkCN( mkN human (mkN "thief") );
	scene	= mkN2( mkN nonhuman (mkN "scene") ) of_PREP;
	river	= mkCN( mkN nonhuman (mkN "river") );
	police_department	= mkCN( mkN nonhuman (mkN "police department") );
	police_officer	= mkCN( mkN human (mkN "police officer") );
	officer	= mkCN( mkN human (mkN "officer") );
	life	= mkCN( mkN nonhuman (mkN "life" "lives") );
	control	= mkN2( mkN nonhuman (mkN "control") ) of_PREP;
	charge_N2	= mkN2( mkN nonhuman (mkN "charge") ) against_RECIPIENTPREP;
	car_thief	= mkCN( mkN human (mkN "car thief") );
	car	= mkCN( mkN nonhuman (mkN "car") );
	accident	= mkCN( mkN nonhuman (mkN "accident") );

-- PN

	ontario	= mkPN( mkN nonhuman (mkN "Ontario") );

-- Prep

	to_LOCPREP	= mkPrep "to";
	into_LOCPREP	= mkPrep "into";
	in_LOCPREP	= mkPrep "in";
	from_SOURCEPREP	= mkPrep "from";
	for_ATTRIBUTEPREP	= mkPrep "for";
	back_to_LOCPREP	= mkPrep "back to";
	against_RECIPIENTPREP	= mkPrep "against";

-- Pron


-- Subj


-- V

	go	= mkV2 IrregEng.go_V back_to_LOCPREP;
	save	= mkV2( mkV "save") noPrep;
	rescue	= mkV2( mkV "rescue") noPrep;
	lose	= mkV2 IrregEng.lose_V noPrep;
	help	= mkVV( mkV "help") ;
	help	= mkVV( mkV "help") ;
	drive	= mkV2 IrregEng.drive_V into_LOCPREP;
	drop	= mkV2( mkV "drop") noPrep;
	chase	= mkV2( mkV "chase") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
