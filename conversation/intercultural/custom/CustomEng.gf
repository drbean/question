--# -path=.:./engine:alltenses

concrete CustomEng of Custom = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	after_a_while	= ParadigmsEng.mkAdv "after a while";
	usually	= ParadigmsEng.mkAdV "usually";
	then	= ParadigmsEng.mkAdv "then";
	really	= ParadigmsEng.mkAdV "really";
	really_ADA	= ParadigmsEng.mkAdA "really";
	even_A	= ParadigmsEng.mkAdA "even";
	even_V	= ParadigmsEng.mkAdV "even";
	at_first	= ParadigmsEng.mkAdv "at first";
	also	= ParadigmsEng.mkAdV "also";

-- AP

	whole	= mkAP( mkA "whole") ;
	uncomfortable	= mkAP( mkA "uncomfortable") ;
	secure	= mkAP( mkA "secure") ;
	real	= mkAP( mkA "real") ;
	next	= mkAP( mkA "next") ;
	late	= mkAP( mkA "late") ;
	head	= mkAP( mkA "head") ;
	difficult	= mkAP( mkA "difficult") ;
	acceptable	= mkAP( mkA "acceptable") ;

-- Conj

	or	= mkConj "or";

-- Det

	one	= mkDet( mkCard (mkNumeral n1_Unit));
	all	= ss "all";

-- N

	work	= mkN "work" nonExist;
	woman	= mkCN( mkN human (mkN "woman") );
	two_o_clock	= mkN "two o’clock" nonExist;
	time	= mkCN( mkN nonhuman (mkN "time") );
	nine_o_clock	= mkN "nine o’clock" nonExist;
	ten_o_clock	= mkN "ten o’clock" nonExist;
	three_o_clock	= mkN "three o’clock" nonExist;
	soup	= mkN "soup" nonExist;
	nuisance	= mkCN( mkN nonhuman (mkN "nuisance") );
	noise_CN	= mkCN( mkN nonhuman (mkN "noise") );
	noise	= mkN "noise" nonExist;
	morning	= mkCN( mkN nonhuman (mkN "morning") );
	food	= mkN "food" nonExist;
	evening	= mkCN( mkN nonhuman (mkN "evening") );
	dinner_table	= mkCN( mkN nonhuman (mkN "dinner table") );
	day	= mkCN( mkN nonhuman (mkN "day") );
	clothing	= mkN "clothing" nonExist;
	body	= mkCN( mkN nonhuman (mkN "body") );

-- PN

	spain	= mkNP( mkPN( mkN nonhuman ( mkN "Spain") ) ) ;
	shauna	= mkPN( mkN feminine (mkN "Shauna") );
	saudi_arabia	= mkNP( mkPN(  mkN nonhuman ( mkN "Saudi Arabia") ) );
	nate	= mkPN( mkN masculine (mkN "Nate") );
	south_korea	= mkNP( mkPN( mkN nonhuman (mkN "South Korea") ) );
	carla	= mkPN( mkN feminine (mkN "Carla") );

-- Prep

	at_THEMEPREP	= mkPrep "at";
	until_TIMEPREP	= mkPrep "until";
	to_PREP	= mkPrep "to";
	over_LOCPREP	= mkPrep "over";
	in_TIMEPREP	= mkPrep "in";
	in_LOCPREP	= mkPrep "in";
	for_TIMEPREP	= mkPrep "for";
	at_LOCPREP	= mkPrep "at";
	around_TIMEPREP	= mkPrep "around";
	after_TIMEPREP	= mkPrep "after";
	about_THEMEPREP	= mkPrep "about";

-- Pron


-- Subj

	so	= mkSubj "so";
	but	= mkSubj "but";
	because	= mkSubj "because";

-- V

	worry	= mkV2( mkV "worry") about_THEMEPREP;
	wear	= mkV2( mkV "wear") noPrep;
	want	= mkVV( mkV "want") ;
	travel	= mkV2( mkV "travel") in_LOCPREP;
	think	= mkVS( mkV "think") ;
	surprise	= mkV2S( mkV "surprise") at_THEMEPREP;
	stay	= mkV "stay";
	start_VV	= mkVV( mkV "start") ;
	start_V2	= mkV2( mkV "start") noPrep;
	slurp	= mkV "slurp";
	show	= mkVS( mkV "show") ;
	put	= mkV3( mkV "put") noPrep over_LOCPREP;
	make	= mkV2( mkV "make") noPrep;
	live	= mkV2( mkV "live") in_LOCPREP;
	like	= mkV2( mkV "like") noPrep;
	invite	= mkV2( mkV "invite") to_PREP;
	have_to	= mkVV( mkV "have") ;
	guess	= mkVS( mkV "guess") ;
	grow_up	= partV( mkV "grow") "up";
	go_to_work	= partV( mkV "go") "to work";
	get_used_to	= partV( mkV "get") "used to";
	get_up	= partV( mkV "get") "up";
	find	= mkV2A( mkV "find") noPrep;
	feel	= mkVA( mkV "feel") ;
	expect	= mkV2V( mkV "expect") noPrep to_PREP;
	enjoy	= mkV2( mkV "enjoy") noPrep;
	drink	= mkV2( mkV "drink") noPrep;
	cover	= mkV2( mkV "cover") noPrep;
	come	= mkV "come";
	bother	= mkV2( mkV "bother") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
