--# -path=.:/home/drbean/GF/lib/src/translator:./gf-contrib/drbean/speaking/crime/murder:/home/drbean/GF/gf-contrib/drbean/speaking/crime/murder/engine:present

concrete MurderEng of Murder = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude in {

lin

	married	= mkAP( mkA "married");
	dying	= mkAP( mkA "dying");
	alive	= mkAP( mkA "alive");

	by	= mkPrep "by";
	to	= mkPrep "to";

	so_much	= mkAdv "so much";
	anymore	= mkAdv "anymore";
	on_february_9	= mkAdv "on February 9";
	for_8_months	= mkAdv "for 8 months";

	-- PassV2V vp = PassVPSlash vp;
	-- Slash v2v vp = mkVPSlash v2v vp;
	go	= mkVA( mkV "go");
	shoot	= mkV2 "shoot";
	say	= mkVS( mkV "say");
	love	= mkV2 "love";
	watch	= mkV2S "watch";
	suffer	= mkV "suffer";

	wife	= mkCN( mkN "wife");
	cancer	= mkCN( mkN "cancer");
oper
	husband	= mkCN( mkN "husband");
	hospital	= mkCN( mkN "hospital");
	respirator	= mkCN( mkN "respirator");

	mercer	= mkPN( mkN masculine (mkN "Mercer") );
}
	sara,	= mkPN( mkN feminine (mkN "Sara,") );

-- vim: set ts=2 sw=2 noet:

