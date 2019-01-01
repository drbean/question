abstract Pollution = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv

	all_over_the_world	: Adv_location;

-- AP

	rapid	: AP;
	natural	: AP;
	high	: AP;
	urban	: AP;
	underground	: AP;
	terrible	: AP;
	other	: AP;
	huge	: AP;
	environmental	: AP;
	dead	: AP;
	bad	: AP;
	green_mission	: AP;

-- Conj


-- Det

	one	: Det;
	a_lot_of	: Det;

-- N

	urbanization	: N;
	resources	: CN;
	emissions	: N;
	climate	: CN;
	change_CN	: CN;
	carbon_dioxide	: N;
	farm	: CN;
	livestock_farm	: CN;
	wildlife	: N;
	way	: N2;
	water_pollution	: N;
	water	: N;
	uncle	: CN;
	tv_station	: CN;
	town	: Place;
	top_executive	: CN;
	suburb	: CN;
	story	: CN;
	statue	: CN;
	soil	: N;
	river	: PlaceNoun;
	publicity	: N;
	pollution	: N;
	plant	: CN;
	oil_spill	: CN;
	marine_life	: N;
	management	: N;
	law	: CN;
	health	: N2;
	Growth	: NP -> N;
	rain_forest	: CN;
	fish	: CN;
	farmland	: N;
	factory	: CN;
	Extinction	: NP -> N;
	environment	: CN;
	Destruction	: NP -> N;
	company	: CN;
	chemical	: CN;
	building	: CN;
	bird	: CN;
	area	: PlaceNoun;
	amount	: N2;
	air_pollution	: N;
	air	: N;
	acid_rain	: N;

-- PN

	otis	: PN;
	green_mission_industries	: PN;
	cindy	: PN;

-- Prep

	as_a_result_of_CAUSERPREP	: CauserPrep;
	because_of_CAUSERPREP	: CauserPrep;
	due_to_CAUSERPREP	: CauserPrep;
	through_CAUSERPREP	: CauserPrep;
	by_CAUSERPREP	: CauserPrep;
	to	: Prep;
	outside	: LocPrep;
	on	: ThemePrep;
	into	: LocPrep;
	in_LOCPREP	: LocPrep;
	at	: Prep;
	against	: ThemePrep;
	about	: Prep;

-- Pron


-- Subj

	if	: Subj;

-- V

	deplete	: V2;
	cause	: V2;
	work	: V;
	threaten	: V2;
	think	: VS;
	talk	: V2;
	see	: V2;
	say	: VS;
	run	: V2;
	Pump	: NP -> Adv_location -> VP;
	pollute	: V2;
	kill	: V2;
	ignore	: V2;
	hate	: V2;
	harm	: V2;
	happen	: V;
	get	: V2V;
	erode	: V2;
	eat_up	: V2;
	Do_V3	: NP -> NP -> VP;
	Do_about	: NP -> VPSlash;
	Do_	: NP -> VPSlash;
	contaminate	: V2;
	change	: V2;
	accelerate	: V2;
	ask	: VQ;
}

-- vim: set ts=2 sts=2 sw=2 noet:
