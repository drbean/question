--# -path=.:/home/drbean/GF/gf-contrib/drbean:present

concrete SiarEng of Siar = MyConcrete **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

lin

  three	= mkDet( mkNumeral n3_Unit);
  five	= mkDet( mkNumeral n5_Unit);

	on	= mkPrep "on";

	feel	= mkVA( mkV "feel");
	have	= mkV2 IrregEng.have_V;
	like	= mkVV( mkV "like");
	like_ing	= ingVV( mkV "like");
	listen	= mkV2 (mkV "listen" "listened") (mkPrep "to");
	live	= mkV "live";
	love	= mkVV( mkV "love");
	-- make_V2V	= mkV2V IrregEng.make_V noPrep noPrep;
	make_V2	= mkV2 IrregEng.make_V;
	play	= mkV2 "play";
	study	= mkV "study";
	feel	= mkVA( mkV "feel");
	want	= mkVV( mkV "want");

	family	= mkCN( mkN "family");
	family_place	= mkCN( mkN "family");
	father	= mkCN( mkN "father");
	mother	= mkCN( mkN "mother");
	name	= mkCN( mkN "name");
	person	= mkCN( mkN "person");
	sport	= mkCN( mkN "sport");
	brother	= mkCN( mkN "older brother");
	father	= mkCN( mkN "father");
	friend	= mkCN( mkN "friend");
	mother	= mkCN( mkN "mother");
	name	= mkCN( mkN "name");
	person	= mkCN( mkN "person");
	people	= mkCN( mkN nonExist "people");
	sister	= mkCN( mkN "younger sister");
	song	= mkCN( mkN "song");
	sport	= mkCN( mkN "sport");
	subject	= mkCN( mkN "subject");
	tourguide	= mkCN( mkN "tour guide");
	translator	= mkCN( mkN "translator");

	simon	= mkPN( mkN masculine (mkN "Simon") );
	ariel	= mkPN( mkN feminine (mkN "Ariel") );
	chiyuantien	= mkPN( mkN feminine (mkN "ChiYuan Tien") );
	minghu	= mkNP( mkPN( mkN "Minghu Junior High School"));
	taipei	= mkNP( mkPN( mkN "Taipei"));
	wenhua	= mkNP( mkPN( mkN "WenHua University"));

	baseball	= mkN "baseball";
	drums	= mkN "drums";
	guitar	= mkN "guitar";
	playing_drums	= mkN "playing drums";
	playing_guitar	= mkN "playing guitar";

  chinese	= mkAP( mkA "Chinese");
	english	= mkAP( mkA "English");
	favorite	= mkAP( mkA "favorite");
	happy	= mkAP( mkA "happy");
	humorous	= mkAP( mkA "humorous");
	relaxed	= mkAP( mkA "relaxed");
	nineteen	= mkAP( mkA "19 years old");
	logical	= mkAP( mkA "logical");

}

-- vim: set ts=2 sts=2 sw=2 noet:
