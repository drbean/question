abstract Tenant = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv

	right_away	: Adv_time;
	out	: Adv_theme;
	on	: Adv_result;
	off	: Adv_result;
	all_night	: Adv;

-- AP

	quiet	: AP;
	busy	: AP;

-- Conj

	but	: Conj;
	and	: Conj;

-- Det


-- N

	problem	: CN;
	complaint	: CN;
	tenant	: CN;

	fixing	: N;
	temperature_control	: CN;
	refrigerator	: CN;
	oven	: CN;
	neighbor	: CN;
	lightbulb	: CN;
	light	: CN;
	ladder	: CN;
	kitchen_window	: CN;
	fuse_box	: CN;
	electricity	: N;
	dog	: CN;
	cousin	: CN;
	building_manager	: CN;
	building	: PlaceNoun;
	apartment	: PlaceNoun;

-- PN

	mrs_taylor	: PN;
	mrs_harris	: PN;
	mr_won	: PN;
	mr_two	: PN;
	jack_burr	: PN;
	mr_burr	: PN;

-- Prep

	to	: Prep;
	to_LOCPREP	: LocPrep;
	out_front_of_LOCPREP	: LocPrep;
	near	: Prep;
	at	: Prep;
	in_LOCPREP	: LocPrep;
	about	: Prep;

-- Pron


-- Subj


-- V

	need_V2	: V2;
	want	: VV;
	try	: VV;
	shut	: V2A;
	say	: VS;
	promise	: VV;
	open_V2	: V2;
	need	: VV;
	look_at	: V2;
	keep	: VV;
	jam	: V2A;
	help_V2	: V2;
	help_V	: V;
	guess	: VS;
	Go : Adv_result	-> VP;
	Go_LOC	: Adv_location -> VP;
	give	: V3;
	get	: V2V;
	fix	: V2;
	cook	: V2;
	check	: V2;
	call	: V2V;
	burn	: V2;
	bark	: V;
	ask	: V2V;
	adjust	: V2;
}

-- vim: set ts=2 sts=2 sw=2 noet: