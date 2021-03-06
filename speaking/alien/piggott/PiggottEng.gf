--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean/speaking/alien/piggott:/home/drbean/GF/gf-contrib/drbean/speaking/alien/piggott/engine:present

concrete PiggottEng of Piggott = MyConcrete  **
open SyntaxEng, ParadigmsEng in {

oper

ss : ( word : Str ) -> { s : Str } =
	\word -> { s = word};

lin

-- Adv

	so_Adv	= mkAdv "so";
	just_AdV	= mkAdV "just";
	on_Adv	= mkAdv "on";
	home	= mkAdv "home";
	later	= mkAdv "later";
	never	= mkAdv "never";
	out	= mkAdv "out";
	over	= mkAdv "over";
	together	= mkAdv "together";
	whatsoever	= mkAdv "whatsoever";
-- AP

	country	= mkAP( mkA "country");
	emergency	= mkAP( mkA "emergency");
	famous	= mkAP( mkA "famous");
	gone	= mkAP( mkA "gone");
	invading	= mkAP( mkA "invading");
	mad	= mkAP( mkA "mad");
	only	= mkAP( mkA "only");
	strange	= mkAP( mkA "strange");
	unusual	= mkAP( mkA "unusual");
	big	= mkAP( mkA "big");
-- Det

	a_few	= mkDet(  mkQuant "a few" "a few");
	just	= ss "just";
	one	= mkDet(  mkNumeral n1_Unit );
	this	= mkDet this_Quant;
	all	= ss "all";
-- N

	chevrolet_automobile	= mkCN( mkN "Chevrolet automobile");
	each_other	= mkN "each other";
	news	= mkN "news";
	nothing	= mkN "nothing";
	recreation	= mkCN( mkN "recreation" );
	rubber	= mkN "rubber";
	scent	= mkN2( mkN "scent");
	something	=mkN2( mkN "something" ) to;
	car	= mkCN( mkN "car");
	direction	= mkCN( mkN "direction");
	doctor	= mkCN( mkN "doctor");
	drama	= mkCN( mkN "drama");
	end	= mkCN( mkN "end");
	end_N2	= mkN2( mkN "end");
	family	= mkCN( mkN "family");
	hoax	= mkCN( mkN "hoax");
	house	= mkCN( mkN "house");
	huff	= mkCN( mkN "huff");
	idea	= mkCN( mkN "idea");
	man	= mkCN( mkN "man");
	martian	= mkCN( mkN "Martian") ;
	minute	= mkCN( mkN "minute");
	night	= mkCN( mkN "night");
	planet	= mkCN( mkN "planet");
	program	= mkCN( mkN "program");
	radio	= mkCN( mkN "radio");
	sense_of_humor	= mkCN( mkN "sense of humor");
	sin	= mkCN( mkN "sin");
	skeptic	= mkCN( mkN "skeptic");
	sound	= mkCN( mkN "sound");
	step_grandfather	= mkCN( mkN "step-grandfather");
	story	= mkCN( mkN "story");
	uncle	= mkCN( mkN "uncle");
	vanguard	= mkN2( mkN "vanguard");
	way	= mkCN( mkN "way");
	wife	= mkCN( mkN "wife");
	word	= mkCN( mkN "word");
	world	= mkCN( mkN "world");
	yard	= mkCN( mkN "yard");
	army	= mkN2( mkN "army") from;
	being	= mkCN( mkN "being");
	brake	= mkCN( mkN "brake");
	broadcast	= mkCN( mkN "broadcast");
	brother	= mkCN( mkN "brother");
	anytime	= mkN "anytime";
	anyone	= mkN "anyone";
	eleven_o_clock	= mkN "11 o'clock";
	nineteen_thirtyeight	= mkN "1938";
-- PN

	Doctor	= mkPN( mkN feminine (mkN "Doctor") );
	the_doctor	= mkPN( mkN feminine (mkN "the Doctor") );
	joe	= mkPN( mkN feminine (mkN "Joe") );
	mars	= mkPN( mkN feminine (mkN "Mars") );
	mercury_theater	= mkPN( mkN feminine (mkN "Mercury Theater") );
	new_jersey	= mkNP( mkPN( mkN nonhuman (mkN "New Jersey") ) );
	orson_welles	= mkPN( mkN feminine (mkN "Orson Welles") );
-- Prep

	back_out_into	= mkPrep "back out into";
	over_to	= mkPrep "over to";
	around_to	= mkPrep "around to";
	from	= mkPrep "from";
	in_prep	= mkPrep "in";
	into	= mkPrep "into";
	on_source	= mkPrep "on";
	on_location	= mkPrep "on";
	to	= mkPrep "to";
	to_coagent	= mkPrep "to";
	to_location	= mkPrep "to";
	with_prep	= mkPrep "with";
	within	= mkPrep "within";
	at	= mkPrep "at";
	about	= mkPrep "about";
-- V

	walk_back_out_into	= mkV2( mkV "walk" ) back_out_into;
	come	= mkV "come";
	confess	= mkV "confess";
	convince	= mkV2S(  mkV "convince" ) noPrep;
	drive_around_to	= mkV2( mkV "drive" ) around_to;
	figure	= mkVS( mkV "figure");
	find	= mkVS( mkV "find");
	get_in	= mkV2( mkV "get" ) into;
	call	= mkV3( mkV "call");
	hear	= mkV2S(  mkV "hear" ) on_source;
	go_over_to	= mkV2( mkV "go" ) over_to;
	involve	= mkV2 "involve";
	keep	= mkVV( mkV "keep");
	land	= mkV "land";
	listen	= mkV2( mkV "listen" "listens" "listened" "listened" "listening") to;
	leave	= mkV "leave";
	make	= mkV2 "make";
	react	= mkV2 "react";
	repeat	= mkV2 "repeat";
	repent	= mkV2 "repent";
	say	= mkV2 "say";
	see	= mkV3( mkV "see");
	smell	= ingV2V( mkV "smell") noPrep noPrep;
	talk	= mkV "talk";
	talk_about	= mkV2( mkV "talk" ) about;
	tell	= mkV2S(  mkV "tell" ) noPrep;
	tell_to	= mkV2V( mkV "tell" ) noPrep to;
	think	= mkVS( mkV "think");
	turn_on	= partV( mkV "turn") "on";
	get_up	= partV( mkV "get") "up";
	wait	= mkV2 "wait";
	begin	= ingVV( mkV "begin");
	burn	= mkV "burn";
	announce	= mkVS( mkV "announce");
}

-- vim: set ts=2 sts=2 sw=2 noet:
