abstract Blair = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv


-- AP

	own	: AP;
	missing	: A2;

-- Conj


-- Det

	another	: Det;

-- N

	texas	: PlaceNoun;
	story	: CN;
	soldier	: CN;
	newspaper	: PlaceNoun;
	the_times	: PlaceNoun;
	the_new_york_times	: Place;
	mother	: CN;
	iraq	: PlaceNoun;
	intern	: CN;
	information	: N;
	home_state	: PlaceNoun;
	editor	: CN;

-- PN

	blair	: PN;
	raines	: PN;
	hernandez	: PN;

-- Prep

	with_COAGENT	: CoagentPrep;
	to	: Prep;
	in_LOCPREP	: LocPrep;
	from	: Prep;
	for	: Prep;
	at	: LocPrep;
	as	: AttributePrep;

-- Pron


-- Subj


-- V

	leave	: Place -> VP;
	work	: Adv_location -> VP;
	tell	: V2;
	interview	: V2;
	fire	: V2;
	copy	: V3;
}

-- vim: set ts=2 sts=2 sw=2 noet: