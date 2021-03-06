--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete EnjoyEng of Enjoy = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	happy_A	= mkA "happy";
	fine_A	= mkA "fine";
	make_V = mkV "make";
	thing_N	= mkN "thing";

lin

-- Adv

	too	= mkAdv "too";
	always	= mkAdV "always";
	also	= mkAdV "also";
	already	= mkAdv "already";
-- AP

	top	= mkA2( mkA "top") of_prep;
	raining	= mkAP( mkA "raining") ;
	unfit	= mkAP( mkA "unfit") ;
	positive	= mkAP( mkA "positive") ;
	miserable	= mkAP( mkA "miserable") ;
	high	= mkAP( mkA "high") ;
	happy_go_lucky	= mkAP( mkA "happy-go-lucky") ;
	happy	= mkAP happy_A ;
	happier	= comparAP happy_A ;
	happiest = mkAP( myOrdSuperl happy_A);
	good	= mkAP( mkA "good") ;
	fine	= mkAP fine_A;
	finer		= comparAP fine_A;
	down_in_the_dumps	= mkAP( mkA "down in the dumps") ;
	bad	= mkAP( mkA "bad") ;
-- Conj

	but	= mkConj "but";
	and	= mkConj "and";
-- Det

-- N

	quality	= mkN2( mkN "quality") ;
	situation	= mkCN( mkN "situation") ;
	smile	= mkCN( mkN "smile") ;
	study	= mkCN( mkN "study") ;
	wine	= mkN "wine" nonExist;
	word	= mkN2( mkN "word") about;
	nothing	= mkN "nothing" nonExist;
	news	= mkN "news" nonExist;
	nation	= mkCN( mkN "nation") ;
	money	= mkN "money" nonExist;
	list	= mkN2( mkN "list") in_prep;
	life	= mkN "life" nonExist;
	happiness	= mkN "happiness" nonExist;
	food	= mkN "food" nonExist;
	face	= mkCN( mkN "face") ;
	thing_like	= mkN2 thing_N like;
	thing_in	= mkN2 thing_N in_prep;
	everything	= mkN "everything" nonExist;
	country	= mkCN( mkN "country") ;
-- PN

	rob	= mkPN( mkN feminine (mkN "Rob") );
	world_happiness_database	= mkCN( mkN "World Happiness Database");
	finland	= mkPN( mkN feminine (mkN "Finland") );
	finn	= mkPN( mkN feminine (mkN "Finn") );
	canada	= mkPN( mkN feminine (mkN "Canada") );
-- Prep

	on	= mkPrep "on";
	like	= mkPrep "like";
	in_prep	= mkPrep "in";
	in_loc	= mkPrep "in";
	for	= mkPrep "for";
	even_in	= mkPrep "even in";
	about	= mkPrep "about";

-- Pron

	you = mkNP youSg_Pron;
-- Subj

-- V

	say	= mkVS( mkV "say") ;
	sound	= mkVA( mkV "sound") ;
	tell	= mkV2S( mkV "tell") noPrep;
	tell_V3	= mkV3( mkV "tell") noPrep noPrep;
	think	= mkVS( mkV "think") ;
	use	= mkV2( mkV "use") noPrep;
	worry	= mkV2( mkV "worry") noPrep;
	put	= mkV3( mkV "put") noPrep on;
	might	= ModalVV "" "might" "" "" "mightn't";
	make	= mkV2V make_V noPrep noPrep;
	make_V2A	= mkV2A make_V noPrep;
	look	= mkV2( mkV "look") for;
	feel	= mkVA( mkV "feel") ;
	could	= ModalVV "" "could" "" "" "couldn't";
	ask	= mkV2Q( mkV "ask") noPrep;
}

-- vim: set ts=2 sts=2 sw=2 noet:
