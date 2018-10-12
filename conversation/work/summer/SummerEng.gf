--# -path=.:./engine:alltenses

concrete SummerEng of Summer = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	much_more	= ParadigmsEng.mkCAdv "much more" "not much more" "than";
	really	= ParadigmsEng.mkAdA "really";
	at_night	= ParadigmsEng.mkAdv "at night";
	much	= ParadigmsEng.mkAdA "much";
	just	= ParadigmsEng.mkAdV "just";
	full_time	= ParadigmsEng.mkAdv "full-time";
	also	= ParadigmsEng.mkAdV "also";
	again	= ParadigmsEng.mkAdv "again";

-- AP

	challenging	=  mkA "challenging" ;
	young	= mkAP( mkA "young") ;
	started	= mkAP( mkA "started") ;
	own	= mkAP( mkA "own") ;
	interesting	= mkAP( mkA "interesting") ;
	hot	= mkAP( mkA "hot") ;
	educational	= mkAP( mkA "educational") ;
	easy	= mkAP( mkA "easy") ;
	crazy	= mkAP( mkA "crazy") ;

-- Conj

	and	= mkConj "and";

-- Det

	one_of	= ss "one of";
	a_couple_of	= mkDet( ParadigmsEng.mkQuant nonExist "a couple of") pluralNum;
	another	= mkDet( ParadigmsEng.mkQuant "another" nonExist) singularNum;
	two	= mkDet( mkCard (mkNumeral n2_Unit));
	one	= mkDet( mkCard (mkNumeral n1_Unit));
	a_lot_of	= ss "a lot of";
	eleven	= mkDet( ParadigmsEng.mkQuant nonExist "eleven") pluralNum;
	eight	= mkDet( mkCard (mkNumeral n8_Unit));

-- N

	summer_job	= mkCN( mkN nonhuman (mkN "summer job") );
	work_N	= mkN "work" nonExist;
	summer_camp	= mkCN( mkN nonhuman (mkN "summer camp") );
	reader	= mkCN( mkN human (mkN "reader") );
	post	= mkCN( mkN nonhuman (mkN "post") );
	opening	= mkCN( mkN nonhuman (mkN "opening") );
	news_website	= mkCN( mkN nonhuman (mkN "news website") );
	lead	= mkCN( mkN nonhuman (mkN "lead") );
	kind	= mkCN( mkN nonhuman (mkN "kind") );
	internship	= mkCN( mkN nonhuman (mkN "internship") );
	intern	= mkCN( mkN human (mkN "intern") );
	email	= mkCN( mkN nonhuman (mkN "email") );
	college_credits	= mkCN( mkN nonhuman (mkN nonExist "college credits") );
	camp_counselor	= mkCN( mkN human (mkN "camp counselor") );
	beach_resort	= mkCN( mkN nonhuman (mkN "beach resort") );
	vegetable	= mkCN( mkN nonhuman (mkN "vegetable") );
	tutor	= mkCN( mkN human (mkN "tutor") );
	telephone	= mkCN( mkN nonhuman (mkN "telephone") );
	script	= mkCN( mkN nonhuman (mkN "script") );
	restaurant	= mkCN( mkN nonhuman (mkN "restaurant") );
	problem	= mkCN( mkN nonhuman (mkN "problem") );
	phone	= mkCN( mkN nonhuman (mkN "phone") );
	money	= mkN "money" nonExist;
	meat	= mkN "meat" nonExist;
	marketing	= mkN "marketing" nonExist;
	marketer	= mkCN( mkN human (mkN "marketer") );
	learning_center	= mkCN( mkN "learning center") ;
	landscaping	= mkN "landscaping" nonExist;
	landscaper	= mkCN( mkN human (mkN "landscaper") );
	kitchen	= mkCN( mkN "kitchen") ;
	kid	= mkCN( mkN human (mkN "kid") );
	job	= mkCN( mkN nonhuman (mkN "job") );
	intern	= mkCN( mkN human (mkN "intern") );
	hour	= mkCN( mkN nonhuman (mkN "hour") );
	game	= mkCN( mkN nonhuman (mkN "game") );
	fun_N	= mkN "fun" nonExist;
	dish	= mkCN( mkN nonhuman (mkN "dish") );
	costume	= mkCN( mkN nonhuman (mkN "costume") );
	computer	= mkCN( mkN nonhuman (mkN "computer") );
	company	= mkCN( mkN nonhuman (mkN "company") );
	chef	= mkCN( mkN human (mkN "chef") );
	cartoon_character	= mkCN( mkN human (mkN "cartoon character") );
	call_CN	= mkCN( mkN nonhuman (mkN "call") );
	amusement_park	= mkCN( mkN nonhuman (mkN "amusement park") );
	afternoon	= mkCN( mkN nonhuman (mkN "afternoon") );
	adult	= mkCN( mkN human (mkN "adult") );
	activity	= mkCN( mkN nonhuman (mkN "activity") );

-- PN

	tyler	= mkPN( mkN masculine (mkN "Tyler") );
	emma	= mkPN( mkN feminine (mkN "Emma") );

-- Prep

	at_LOCPREP	= mkPrep "at";
	to_RECIPIENTPREP	= mkPrep "to";
	with_COAGENTPREP	= mkPrep "with";
	around_PREP	= mkPrep "around";
	until_TIMEPREP	= mkPrep "until";
	over_MANNERPREP	= mkPrep "over";
	on_THEMEPREP	= mkPrep "on";
	as_ATTRIBUTEPREP	= mkPrep "as";
	into_STIMULUSPREP	= mkPrep "into";
	in_TIMEPREP	= mkPrep "in";
	in_MANNERPREP	= mkPrep "in";
	in_LOCPREP	= mkPrep "in";
	from_TIMEPREP	= mkPrep "from";
	from_SOURCEPREP	= mkPrep "from";
	for_BENEFICIARYPREP	= mkPrep "for";
	by_THEMEPREP	= mkPrep "by";
	at_TIMEPREP	= mkPrep "at";
	at_LOCPREP	= mkPrep "at";

-- Pron


-- Subj

	when	= mkSubj "when";
	since	= mkSubj "since";
	as_long_as	= mkSubj "as long as";

-- V

	say	= mkVS( mkV "say") ;
	pay	= mkV2( mkV "pay") noPrep;
	enjoy	= mkV2( mkV "enjoy") noPrep;
	earn	= mkV2( mkV "earn") noPrep;
	could	= mkVV( mkV "could") ;
	ask	= mkV2S( mkV "ask") noPrep;
	answer	= mkV2( mkV "answer") noPrep;
	work	= mkV "work";
	wash	= mkV2( mkV "wash") noPrep;
	walk	= mkV2( mkV "walk") around_PREP;
	try	= mkVV( mkV "try") ;
	take	= mkV2 IrregEng.take_V noPrep;
	think	= mkVS IrregEng.think_V ;
	show_to	= mkV3( mkV "show") noPrep to_RECIPIENTPREP;
	show	= mkV3( mkV "show") noPrep noPrep;
	sell	= mkV3 IrregEng.sell_V noPrep noPrep;
	run	= mkV2 IrregEng.run_V into_STIMULUSPREP;
	realize	= mkVQ( mkV "realize") ;
	read	= mkV2 IrregEng.read_V from_SOURCEPREP;
	make	= mkV2 IrregEng.make_V noPrep;
	help	= mkV2V( mkV "help") noPrep noPrep;
	get_VA	= mkVA IrregEng.get_V ;
	get_VV	= mkVV IrregEng.get_V ;
	get	= mkV2 IrregEng.get_V noPrep;
	earn	= mkV2( mkV "earn") noPrep;
	drive	= mkV2A IrregEng.drive_V noPrep;
	-- cut_up	= mkV2( partV( mkV "cut") "up") noPrep;
	choose	= mkV2 IrregEng.choose_V noPrep;
	call_V2	= mkV2( mkV "call") noPrep;
	answer	= mkV2( mkV "answer") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
