abstract Tornado = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv

	last_thursday	: Adv_time;
	in_ADV_LOCATION	: Adv_location;

-- AP

	terrible	: AP;
	lucky	: AP;
	alive_and_well	: AP;
	abandoned	: AP;

-- Conj


-- Det


-- N

	wall	: CN;
	tornado	: CN;
	storm	: CN;
	Safe_to_say	: S -> NP;
	ride	: CN;
	life	: CN;
	house	: PlaceNoun;
	home	: PlaceNoun;
	grandmother	: CN;
	field	: PlaceNoun;
	air	: N;
	nineteen_year_old	: CN;
	one_fifty_miles_per_hour	: N;
	thirteen_hundred_feet	: N;

-- PN

	missouri	: PN;
	matt	: PN;

-- Prep

	to_PREP	: Prep;
	through_LOCPREP	: LocPrep;
	over_EXTENTPREP	: ExtentPrep;
	off_LOCPREP	: LocPrep;
	into_RESULTPREP	: ResultPrep;
	in_LOCPREP	: LocPrep;
	by_the_name_of_ATTRIBUTEPREP	: AttributePrep;
	before_TIMEPREP	: TimePrep;
	at_LOCPREP	: LocPrep;
	after_TIMEPREP	: TimePrep;

-- Pron


-- Subj

	while	: Subj;

-- V

	Suck_in	: NP -> VP;
	watch_tv	: V;
	talk	: V2;
	Take 	: NP -> Adv_extent -> VP;
	start	: V;
	rip	: V3;
	intensify	: V2;
	fly	: V2;
	drop	: V2;
}

-- vim: set ts=2 sts=2 sw=2 noet:
