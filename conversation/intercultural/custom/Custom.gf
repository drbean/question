abstract Custom = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv

	and	: Adv;
	after_a_while	: Adv_time;
	then	: Adv_time;
	sometimes	: Adv_time;
	really	: Adv;
	really_ADV	: AdV;
	really_ADA	: AdA;
	late	: Adv_time;
	later	: Adv_time;
	late_ADV	: Adv;
	for_a_while	: Adv_time;
	even	: Adv;
	even_V	: AdV;
	at_first	: Adv_time;

-- AP

	whole	: AP;
	uncomfortable	: AP;
	secure	: AP;
	real	: AP;
	next	: AP;
	difficult	: AP;
	acceptable	: AP;

-- Conj

	or	: Conj;

-- Det

	usually	: Postdet;
	also	: Postdet;
	one	: Det;
	all	: Predet;

-- N

	work	: N;
	woman	: CN;
	two_o_clock	: N;
	time	: CN;
	nine_o_clock	: N;
	ten_o_clock	: N;
	three_o_clock	: N;
	soup	: N;
	nuisance	: CN;
	noise_CN	: CN;
	noise	: N;
	morning	: CN;
	head	: CN;
	food	: N;
	evening	: CN;
	dinner_table	: CN;
	dinner	: N;
	day	: Time;
	clothing	: N;
	body	: CN;

-- PN

	spain	: Place;
	shauna	: PN;
	saudi_arabia	: Place;
	nate	: PN;
	south_korea	: Place;
	carla	: PN;

-- Prep

	at_THEMEPREP	: ThemePrep;
	until_TIMEPREP	: TimePrep;
	to_PREP	: Prep;
	over_LOCPREP	: LocPrep;
	in_TIMEPREP	: TimePrep;
	in_LOCPREP	: LocPrep;
	for_TIMEPREP	: TimePrep;
	at_LOCPREP	: LocPrep;
	around_TIMEPREP	: TimePrep;
	after_TIMEPREP	: TimePrep;
	about_THEMEPREP	: ThemePrep;

-- Pron


-- Subj

	so	: Subj;
	but	: Subj;
	because	: Subj;

-- V

	worry	: V2;
	wear	: V2;
	want	: VV;
	travel	: V2;
	Travel_in	: Place -> VP;
	think	: VS;
	talk	: V;
	surprise	: V2Q;
	stay	: V;
	start_VV	: VV;
	start_V2	: V2;
	slurp	: V;
	show	: VS;
	put	: V3;
	make	: V2;
	Live_in	: Place -> VP;
	live	: V2;
	like	: V2;
	invite	: V3;
	have_to	: VV;
	guess	: VS;
	grow_up	: V;
	go_to_work	: V;
	get_used_to	: V2;
	get_up	: V;
	find_AP	: V2A;
	find_NP	: V3;
	feel	: VA;
	expect	: V2V;
	enjoy	: V2;
	eat	: V;
	drink	: V2;
	cover	: V2;
	come	: V;
	bother	: V2;
}

-- vim: set ts=2 sts=2 sw=2 noet:
