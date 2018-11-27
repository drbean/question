--# -path=.:./engine:alltenses

concrete CustomEng of Custom = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng) in {

oper

	live_V = mkV "live";
	travel_V = mkV "travel";

lin

-- Adv

	and	= ParadigmsEng.mkAdv "and";
	after_a_while	= ParadigmsEng.mkAdv "after a while";
	then	= ParadigmsEng.mkAdv "then";
	sometimes	= ParadigmsEng.mkAdv "sometimes";
	really	= ParadigmsEng.mkAdv "really";
	really_ADV	= ParadigmsEng.mkAdV "really";
	really_ADA	= ParadigmsEng.mkAdA "really";
	later	= ParadigmsEng.mkAdv "later";
	late	= ParadigmsEng.mkAdv "late";
	for_a_while	= ParadigmsEng.mkAdv "for a while";
	even	= ParadigmsEng.mkAdv "even";
	even_V	= ParadigmsEng.mkAdV "even";
	at_first	= ParadigmsEng.mkAdv "at first";

-- AP

	whole	= mkAP( mkA "whole") ;
	uncomfortable	= mkAP( mkA "uncomfortable") ;
	secure	= mkAP( mkA "secure") ;
	real	= mkAP( mkA "real") ;
	next	= mkAP( mkA "next") ;
	difficult	= mkAP( mkA "difficult") ;
	acceptable	= mkAP( mkA "acceptable") ;

-- Conj

	or	= mkConj "or";

-- Det

	usually	= ss "usually";
	also	= ss "also";
	one	= mkDet( mkCard (mkNumeral n1_Unit));
	all	= ss "all";

-- N

	work	= mkN "work" nonExist;
	woman	= mkCN( mkN human (mkN "woman" "women") );
	two_o_clock	= mkN "two o'clock" nonExist;
	time	= mkCN( mkN nonhuman (mkN "time") );
	nine_o_clock	= mkN "nine o'clock" nonExist;
	ten_o_clock	= mkN "ten o'clock" nonExist;
	three_o_clock	= mkN "three o'clock" nonExist;
	soup	= mkN "soup" nonExist;
	nuisance	= mkCN( mkN nonhuman (mkN "nuisance") );
	noise_CN	= mkCN( mkN nonhuman (mkN "noise") );
	noise	= mkN "noise" nonExist;
	morning	= mkCN( mkN nonhuman (mkN "morning") );
	head	= mkCN( mkN nonhuman (mkN "head") );
	food	= mkN "food" nonExist;
	evening	= mkCN( mkN nonhuman (mkN "evening") );
	dinner_table	= mkCN( mkN nonhuman (mkN "dinner table") );
	dinner	= mkN "dinner" nonExist;
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
	wear	= mkV2 IrregEng.wear_V noPrep;
	want	= mkVV( mkV "want") ;
	Travel_in	place = WithPlace travel_V ( Locating in_LOCPREP place );
	travel	= mkV2( mkV "travel") in_LOCPREP;
	think	= mkVS IrregEng.think_V ;
	talk	= mkV "talk";
	surprise	= mkV2Q( mkV "surprise") noPrep;
	stay	= mkV "stay";
	start_VV	= mkVV( mkV "start") ;
	start_V2	= mkV2( mkV "start") noPrep;
	slurp	= mkV "slurp";
	show	= mkVS( mkV "show") ;
	put	= mkV3 IrregEng.put_V noPrep over_LOCPREP;
	make	= mkV2 IrregEng.make_V noPrep;
	Live_in	place = WithPlace live_V ( Locating in_LOCPREP place );
	live	= mkV2 live_V in_LOCPREP;
	like	= mkV2( mkV "like") noPrep;
	invite	= mkV3( mkV "invite") noPrep to_PREP;
	have_to	= mkVV IrregEng.have_V ;
	guess	= mkVS( mkV "guess") ;
	grow_up	= partV IrregEng.grow_V "up";
	go_to_work	= partV IrregEng.go_V "to work";
	get_used_to	= mkV2 ( partV IrregEng.get_V "used to" ) noPrep;
	get_up	= partV IrregEng.get_V "up";
	find_AP	= mkV2A IrregEng.find_V noPrep;
	find_NP	= mkV3 IrregEng.find_V noPrep noPrep;
	feel	= mkVA IrregEng.feel_V ;
	expect	= mkV2V( mkV "expect") noPrep to_PREP;
	enjoy	= mkV2( mkV "enjoy") noPrep;
	eat	= IrregEng.eat_V;
	drink	= mkV2 IrregEng.drink_V noPrep;
	cover	= mkV2( mkV "cover") noPrep;
	come	= IrregEng.come_V;
	bother	= mkV2( mkV "bother") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
