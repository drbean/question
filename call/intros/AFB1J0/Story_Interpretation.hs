module Story_Interpretation where


import Model
import AFB1J0

entity_list :: GPN -> Entity
entity_list Gjeremy	= ent_ided "Jeremy"
entity_list Gmay	= ent_ided "May"
entity_list Goliver	= ent_ided "Oliver"
entity_list Gbetty	= ent_ided "Betty"
entity_list Gemily2	= ent_ided "Emily2"
entity_list Gsilvi	= ent_ided "Silvi"
entity_list Gbruce2	= ent_ided "Bruce2"
entity_list Giris	= ent_ided "Iris"
entity_list Groger	= ent_ided "Roger"

entity_list Gtaoyuan	= ent_ided "Taoyuan"
entity_list Gtaiwan	= ent_ided "Taiwan"
entity_list Gminghsin	= ent_ided "Minghsin University"
entity_list Gtucheng	= ent_ided "Tucheng"
entity_list Gpingzhen	= ent_ided "PingZhen"
entity_list Gtaipei	= ent_ided "Taipei"
entity_list Glondon	= ent_ided "London"
entity_list Gnew_york	= ent_ided "New York"
entity_list Ggucci	= ent_ided "Gucci"
entity_list Gomo	= ent_ided "Omo"
entity_list Gtaichung	= ent_ided "Taichung"
entity_list Gyilan	= ent_ided "YiLan"
entity_list Gdwyane_wade	= ent_ided "Dwyane Wade"


entity_list Gfast_and_furious	= ent_ided "Fast and Furious"


adjective_list :: GAP -> String
adjective_list Gcute	= "cute"

n2_kind_list :: GN2 -> String
n2_kind_list Gfather_2	= "father"
n2_kind_list Gmother_2	= "mother"
n2_kind_list Gbrother_2	= "brother"
n2_kind_list Gsister_2	= "sister"

uncount_list :: GNP -> String
uncount_list Gmoney	= "money"
uncount_list Gtime	= "time"
uncount_list Gwork	= "work"
uncount_list Gwatching_action_movies	= "watching_action_movies"
uncount_list Gwatching_scary_movies	= "watching_scary_movies"
uncount_list Gplaying_with_her_nephews	= "playing_with_her_nephews"
uncount_list Gtwenty_one	= "21"
uncount_list Gplaying_basketball	= "playing_basketball"
uncount_list Gplaying_soccer	= "playing_soccer"
uncount_list Gdancing	= "dancing"

uncount_list Gdogs_and_cats	= "dogs_and_cats"

kind_list :: GCN -> String
kind_list Gbrother	= "brother"
kind_list Gchild	= "child"
kind_list Gdog	= "dog"

kind_list Gdream	 = "dream"
kind_list Gfashion_designer	 = "fashion_designer"
kind_list Gfamily	= "family"
kind_list Gfather	= "father"
kind_list Ggraduation	= "graduation"
kind_list Gjob	= "job"
kind_list Glife	= "life"
kind_list Gman	= "man"
kind_list Gmother	= "mother"
kind_list Gpet	= "pet"

kind_list Gschool	= "school"
kind_list Gsister	= "sister"
kind_list Gthing	= "thing"
kind_list Gway	= "way"
kind_list Gwoman	= "woman"
kind_list Gnephew	= "nephew"
kind_list Gfreshman	= "freshman"
kind_list Gsenior	= "senior"
kind_list Gfriend	= "friend"




happening_list :: GV -> String
happening_list Gstudy	= "study"

changing_list :: GV2 -> String
changing_list Gbecome	= "become"
changing_list Ghave	= "have"
changing_list Gcome	= "come"
changing_list Glike	= "like"


causative_list :: GV2V -> String
causative_list Gmake	= "make"


positing_list :: GVS -> String
positing_list Gsay	= "say"
positing_list Gthink	= "think"

intens_list :: GVV -> String
intens_list Gcan	= "can"

objects = [
	( "brother",	\[x]	-> predid1 "brother" x	)
	, ( "child",	\[x]	-> predid1 "child" x	)
	, ( "family",	\[x]	-> predid1 "family" x	)
	, ( "dog",	\[x]	-> predid1 "dog" x	)

	, ( "fashion_designer",	\[x]	-> predid1 "fashion_designer" x	)
	, ( "father",	\[x]	-> predid1 "father" x	)
	, ( "graduation",	\[x]	-> predid1 "graduation" x	)
	, ( "job",	\[x]	-> predid1 "job" x	)
	, ( "life",	\[x]	-> predid1 "life" x	)
	, ( "man",	\[x]	-> predid1 "man" x	)
	, ( "mother",	\[x]	-> predid1 "mother" x	)
	, ( "money",	\[x] -> predid1 "money" x	)
	, ( "pet",	\[x]	-> predid1 "pet" x	)
	, ( "playing_basketball",	\[x]	-> predid1 "basketball" x	)
	, ( "playing_soccer",	\[x]	-> predid1 "soccer" x	)
	, ( "dancing",	\[x]	-> predid1 "dancing" x	)


	, ( "school",	\[x]	-> predid1 "school" x	)
	, ( "sister",	\[x]	-> predid1 "sister" x	)
	, ( "time",	\[x]	-> predid1 "time" x	)
	, ( "thing",	\[x]	-> predid1 "thing" x	)
	, ( "way",	\[x]	-> predid1 "way" x	)
	, ( "week",	\[x]	-> predid1 "week" x	)
	, ( "woman",	\[x]	-> predid1 "woman" x	)
	, ( "work",	\[x]	-> predid1 "work" x	)
	, ( "friend",	\[x]	-> predid1 "friend" x	)
	, ( "dogs_and_cats",	\[x]	-> predid1 "dogs_and_cats" x	)


-- betty

	]

inflections = [
	( "children",	"child")
	]

relations = [

	( "cute",	\[x]	-> predid1 "cute" x	)

	, ( "work",	\[x]	-> predid1 "work" x	)
	, ( "come",	\[x,y]	-> predid2 "come" y x	)
	, ( "like",	\[x,y]	-> predid2 "like" y x	)


	]

-- vim: set ts=8 sts=2 sw=2 noet:
