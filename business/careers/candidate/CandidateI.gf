incomplete concrete CandidateI of Candidate = open Syntax, ParadigmsEng, LexCandidate in {

lincat
	Utt	= Syntax.Utt;
	PN	= Syntax.PN;
	NP	= Syntax.NP;
	AP	= Syntax.AP;
	Comp	= Syntax.Comp;
	Cl	= Syntax.Cl;
	QCl	= Syntax.QCl;
	S	= Syntax.S;
	QS	= Syntax.QS;
	SC	= Syntax.SC;
	V	= Syntax.V; 
	VP	= Syntax.VP; 
	V2	= Syntax.V2; 
	V2V	= Syntax.V2V;
	V2S	= Syntax.V2S;
	VV	= Syntax.VV;
	VS	= Syntax.VS;
	VA	= Syntax.VA;
	Det	= Syntax.Det;
 	CN	= Syntax.CN;
 	N2	= Syntax.N2;
	IP	= Syntax.IP;
	Prep	= Syntax.Prep;

lin
	-- Is item quality	=	mkCl item quality;
	-- Cop item1 item2	= mkCl item1 item2;
	Be_bad ap	= mkComp ap;
	Be_dee np	= mkComp np;
	Be_vp comp	= mkVP comp;
	Look_bad verb adj	= mkVP verb adj;
	Happening action	=	mkVP action;
	Changing action patient	= mkVP action patient;
	Causative causal patient predicate	= mkVP causal patient predicate;
	Intens attitude predicate	= mkVP attitude predicate;
	Positing posit event	= mkVP posit event;
	Informing posit patient event	= mkVP posit patient event;
	YN cl	= mkQCl cl;
	-- WH_Cop ip comp	= mkQCl ip comp;
	WH_NP ip np	= mkQCl ip np;
	WH_AP ip ap	= mkQCl ip ap;
	WH_Pred ip vp	= mkQCl ip vp;
	PosQ qcl	= mkQS qcl;
	NegQ qcl	= mkQS negativePol qcl;
	PosS cl	= mkS cl;
	NegS cl	= mkS negativePol cl;
	Ut q	= mkUtt q;
	Sentence subject predicate	= mkCl subject predicate;

	Yes	= LexCandidate.yes_Utt;
	No	= LexCandidate.no_Utt;
	NoAnswer	= LexCandidate.no_answer_Utt;

	Entity pn	= mkNP pn;
	Item det noun	= mkNP det noun;
	Ofpos n2 np	= mkCN n2 np;

	a_Det	= LexCandidate.a_Det;
	zero_Det	= LexCandidate.zero_Det;
	the_Det	= LexCandidate.the_Det;
	thePlural_Det = LexCandidate.thePlural_Det;

	who_WH	= LexCandidate.who_WH;
	what_WH	= LexCandidate.what_WH;

	of_prep	= LexCandidate.of_prep;

	become	= become_V2;
	can	= LexCandidate.can_VV;
	get_along	= get_along_V2;
	get	= get_V2;
	go	= go_V2;
	have	= LexCandidate.have_V2;
	hire	= hire_V2;
	interview	= interview_V2;
	know	= know_V;
	know_VS	= LexCandidate.know_VS;
	laugh	= laugh_V;
	lift	= lift_V2;
	like	= like_V2;
	look_here	= look_V;
	look	= look_VA;
	need	= need_VV;
	-- need	= need_V2;
	prove	= prove_V2;
	say	= say_VS;
	see	= see_V2;
	slow_down	= slow_down_V;
	start	= start_ing_VV;
	take	= take_V2V;
	tell	= tell_V2S;
	think	= think_VS;
	work_V	= LexCandidateEng.work_V;

	bad	= mkAP bad_A;
	better	= mkAP better_A;
	first	= mkAP first_A;
	little	= mkAP little_A;
	mad	= mkAP mad_A;
	hard	= mkAP hard_A;

	ambitious	= mkAP ambitious_A;
	bad	= mkAP bad_A;
	competitive	= mkAP competitive_A;
	confident	= mkAP confident_A;
	difficult	= mkAP difficult_A;
	each	= mkAP each_A;
	fast	= mkAP fast_A;
	few	= mkAP few_A;
	five	= mkAP five_A;
	good	= mkAP good_A;
	hard	= mkAP hard_A;
	honest	= mkAP honest_A;
	local	= mkAP local_A;
	long	= mkAP long_A;
	next	= mkAP next_A;
	other	= mkAP other_A;
	outgoing	= mkAP outgoing_A;
	past	= mkAP past_A;
	patient	= mkAP patient_A;
	Polish	= mkAP Polish_A;
	poor	= mkAP poor_A;
	possible	= mkAP possible_A;
	realistic	= mkAP realistic_A;
	safe	= mkAP safe_A;
	soon	= mkAP soon_A;
	successful	= mkAP successful_A;
	true	= mkAP true_A;
	unable	= mkAP unable_A;
	various	= mkAP various_A;

	barbara	= mkPN barbara_N;
	tadeusz	= mkPN tadeusz_N;
	eva	= mkPN eva_N;
	dr_bean	= mkPN dr_bean_N;

}

