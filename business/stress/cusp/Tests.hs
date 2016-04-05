module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Cusp
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Cusp.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Cusp.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Cusp.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Cusp.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Cusp.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

  "A good working climate is one where stress is largely prevented."
  , "Gourlay provides a brief overview of a critically important In Equilibrium framework called CUSP."
  , "CUSP can be used both to prevent stress and to reduce the risks to an individual's health when stress has occurred."
  , "CUSP really is a very useful model."
  , "CUSP is a very useful model."
  , "CUSP is based on what we know from thousands of psychological studies and from experience."
  , "Stressful work situations have particular characteristics."
  , "Stressful situations tend to be ones where individuals feel that they have very little control over what is happening."
  , "Stressful situations are often high in uncertainty."
  , "Stressful situations tend to be situations where individuals feel unsupported, or feel that they are receiving the wrong kind of support."
  , "The way that CUSP works is very simple."
  , "The framework suggests that managers can reduce the level of uncertainty by boosting workers' sense of control."
  , "The framework suggests that managers can reduce the level of uncertainty by offering support."
  , "The 'C' stands for Control."
  , "The 'U' stands for Uncertainty."
  , "The 'S' stands for Support."
  , "The 'P' stands for Pressure."

  ]

in_equilibrium = [
  "Is In Equilibrium a company?"
  , "Does Gourlay work in In Equilibrium?"
  , "Does Bradshaw know the company?"
  , "Does Bradshaw know In Equilibrium?"
  , "Does Gourlay know In Equilibrium?"
  ]

sales_test = [
  "Eva has sales experience doesn't she?"
  , "Does Eva work in the sales department?"
  , "Does Eva have sales experience?"
  ]

cause_test = [
  "Is a lack of uncertainty a cause of stress?"
  , "Is a lack of control a cause of stress?"
  ]

lack_test = [
  "Is a lack of control stressful?"
  , "Is a lack of support stressful?"
  , "Is a lack of uncertainty stressful?"
  , "Is a lack of pressure stressful?"
  ]

high_level_test = [
  "Is a level of uncertainty stressful?"
  , "Are levels of stress high?"
  , "Is a high level of uncertainty stressful?"
  , "Is a high level of control stressful?"
  , "Does Bradshaw have a high level of stress?"
  , "Does assessment have a high level of stress?"
  , "Do men have a high level of stress?"
  ]

strategy_test = [
  "Do men have poor strategies?"
  , "Do women have good strategies?"
  , "Does a strategy work?"
  , "Does some strategy work?"
  , "Do strategies work?"
  , "Do some strategies work?"
  , "Do women's strategies work?"
  , "Do the strategies of women work?"
  ] 

getting_test = [
  "Do women get support?"
  , "Do women ask for support?"
  , "Do men have support?"
  , "Do men ask for support?"
  , "Do men get support from managers?"
  , "Do women get support from managers?"
  , "Do women ask managers for support?"
  , "Do managers give women support?"
  ]

comparative_test = [
  "Are women more vulnerable than men?"
  , "Are men more vulnerable than women?"
  , "Are men more vulnerable?"
  , "Are women more vulnerable?"
  , "Do women have more stress?"
  , "Are levels of uncertainty higher than levels of a lack of control?"
  , "Is the level of uncertainty higher than the level of pressure?"
  ]

people_test = [
  "Is Bradshaw a person?"
  , "Is Bradshaw a man?"
  , "Is Bradshaw assertive people?"
  , "Are men people?"
  , "Are managers people?"
  , "Do people feel unsupported?"
  ]

feel_test = [
  "Do people feel helpless?"
  , "Do people feel unsupported?"
  , "Does Bradshaw feel helpless?"
  , "Does Bradshaw feel stress?"
  , "Does Bradshaw think that stress is bad?"
  , "Does Bradshaw feel that stress is bad?"
  , "Does Bradshaw feel that stress is good?"
  , "Does Bradshaw feel that stress is high?"
  , "Does Bradshaw feel that a lack of control is good?"
  , "Does Gourlay feel unsupported?"
  , "Do people feel stressful?"
  ]

little_test = [
  "Do people have little control?"
  , "Do people have little support?"
  ]

common_test = [
  "Is stress common?"
  , "Is a high level of stress common?"
  , "Is pressure common?"
  , "Is uncertainty common?"
  , "Is a lack of control common?"
  ]

quality_test = [
  "Does stress have characteristics?"
  , "Is uncertainty stressful?"
  , "Is pressure stressful?"
  , "Does CUSP have characteristics?"
  , "Is CUSP critically-important?"
  , "Is control critically-important?"
  , "Is support critically-important?"
  , "Does Barbara have experience?"
  , "Is Barbara experienced?"
  , "Is Tadeusz experienced?"
  , "Is Fast-Track experienced?"
  , "Is Dr Bean experienced?"
  , "Is Barbara realistic?"
  , "Is Tadeusz realistic?"
  , "Is Fast-Track realistic?"
  , "Is Dr Bean realistic?"
  , "Does Tadeusz have good judgement?"
  , "Does Barbara have good judgement?"
  , "Does Dr Bean have good judgement?"
  ]

stands_test = [
  "C stands for control, doesn't it?"
  , "C stands for control, doesn't he?"
  , "Does C stand for control?"
  , "U stands for uncertainty, doesn't it?"
  , "Does U stand for uncertainty?"
  , "Does S stand for Support?"
  , "Does P stand for pressure?"
  ]

determiner_test = [
  "Is a lack of control stressful?"
  , "Is lack of control stressful?"
  ]

working_test = [

  "Does Bradshaw work?"
  , "Does Gourlay have work?"
  , "Is Bradshaw work?"
  , "Does a manager have a job?"
  , "Who works?"
  , "Who has work?"
  , "Who has a job?"
  , "CUSP works doesn't it?"
  , "Do women's strategies work?"
  , "Gourlay has work doesn't she?"
  , "A manager has a job doesn't she?"
  ]

comm_test = [
  "A woman talks to a manager, doesn't she?"
  , "Women talk about stress, don't they?"
  , "A woman talks about stress with a manager, doesn't she?"
  , "Women talk about stress with managers, don't they?"
  , "Do men talk about stress?"
  , "Do men talk to managers?"
  , "Managers talk to men about stress, don't they?"
  , "Men don't talk to managers about stress, do they?"
  , "Do women report more stress?"
  , "Do women report stress?"
  , "Do women tend to report stress?"
  , "Do women report stress to managers?"
  , "Do men say that a lack of control is stressful?"
  , "Do women say that uncertainty is stressful?"
  , "Do managers ask men about stress?"
  , "Do women ask managers about stress?"
  , "Do women ask for support?"
	]

student_tag_tests = [
	-- "Eva had been with Fast-Track for one year, hadn't she?"
	"Barbara isn't a good team-player, is she?",
	"Barbara is a good team-player, isn't she?",
	"Barbara is a confident person, isn't she?",
	"Barbara is thirty years old, isn't she?"
	]

student_yn_tests = [
	"Does Barbara want to improve her English?",
	"Is Barbara a good team-player?",
	"Does Eva have a college degree?",
	"Is Tadeusz a hard worker?",
	"Does Tadeuszs have successful sales experience?",
	"Does Barbara have confidence?",
	"Is Tadeusz a sales manager?",
	"Is Tadeusz thirty-years-old?",
	"Does Barbara feel nervous?",
	"Could Barbara speak German?",
	"Were the three people comfortable when they faced difficulties?",
	"Were they all Polish?",
	"Could Eva speak Polish?",
	"Could Barbara speak Polish?"
	]

student_tests_wh = [
	"What features did Tadeusz lack as business manager?",
	"Who could be a great leader in this group?",
	"Who was Tadeusz?",
	"Who worked in many industries for five years?",
	"Who worked for Fast-Track?",
	"Was Barbara's English good?",
	"Who had the best language skill?",
	"Who knew lots of English words?",
	"Who was the oldest?",

	"What did Eva major in in university?",
	"Who finished high school and had a marketing diploma",
	"How long had Barbara been at Fast-Track",
	"Who has excellent language ability?",
	"What is Eva's occupation?",
	"How many languages can you speak?",
	"How old was Tadeusz?",
	"How many percent did Tadeusz increse sales each year?",
	"How many years did they work in Fast-Track?",
	"What is Barbara's personality like?",
	"Who is the oldest person?",
	"Who is the longest in sales departments?",
	"How old is Eva?",
	"How many years did Barbara work in Fast-Track?",
	"Who worked in Fast-Track the longest?",
	"What kind of leader do you think is best?",
	"Who has the longest sales experience?",
	"Who worked shorter?",
	"Who is not Polish?",
	"Who has the highest degree in history?",
	"Who is the oldest?",
	"Who is the youngest?",
	"How many years did Eva work at Fast-Track?",
	"Who had the highest degree?",
	"Who can speak most languages?",
	"Who has the history diploma?",
	"Who is the oldest?",
	"Who is the best sales representative in Fast-Track?",
	"Who worked in Fast-Track five years ago?",
	"Where does Eva come from?",
	"Who is the best in history?",
	"Who worked in Fast-Track the shortest time?",
	"How old is Eva?",
	"Where does Barbara work?",
	"Where is Eva from?"

	]

test_text = [
	"Barbara's boss talked to Eva.",
	"Barbara's boss had a boss and a boss was German.",
	"Barbara's boss talked to Eva and a co-worker talked to Dr Bean.",
	"Barbara's boss talked to Eva but a co-worker didn't talk to Dr Bean.",
	"Barbara talked to a co-worker and a co-worker talked to Barbara's boss.",
	"Barbara talked to a co-worker and a co-worker talked to Eva \
	\and Eva talked to Barbara."
	-- "Barbara hoped to get the job on a boss's upbringing. \
	-- \Barbara talked to a co-worker. \
	-- \Barbara's boss asked a co-worker about Barbara."
	]

comp_test1 = [
	"Is Eva Polish?",
	"Eva is Polish, isn't she?",
	"Barbara is strong, isn't she?",
	"Barbara is aggressive, isn't she?",
	"Barbara is a sales representative, isn't she?",
	"Barbara is Eva's co-worker, isn't she?",
	"Is Barbara a successful woman?",
	"Barbara is a successful woman, isn't she?",
	"Barbara is a man, isn't she?",
	"Barbara is a woman, isn't she?",
	"Barbara is a sales manage, isn't she?",
	"A man is Tadeusz, isn't he?",
	"A woman is Eva, isn't she?",
	"The woman is Eva, isn't she?",
	"Barbara is a German woman, isn't she?",
	"Barbara is the German woman, isn't she?",
	"A German woman is Barbara, isn't she?",
	"A ambitious woman is Barbara, isn't she?",
	"The ambitious woman is Barbara, isn't she?",
	"The German woman is Barbara, isn't she?",
	-- "The successful German woman is Barbara, isn't she?",
	-- "Barbara is the successful German woman, isn't she?",
	"Dr Bean is the German woman's co-worker, isn't he?",
	"Dr Bean is the German woman's boss, isn't he?",
	"Dr Bean is a German woman's boss, isn't he?",
	"Dr Bean is an ambitious woman's boss, isn't he?",
	"Dr Bean is an ambitious woman's co-worker, isn't he?",
	"Dr Bean is the ambitious women's co-worker, isn't he?",
	"Eva is the ambitious women's co-worker, isn't she?",
	"Eva is an ambitious woman's co-worker, isn't she?",
	"Eva is the German woman's co-worker, isn't she?",
	"Eva is a German woman's co-worker, isn't she?",
	"Eva is Barbara's co-worker, isn't she?",
	"Dr Bean is Barbara's co-worker, isn't he?",
	"Dr Bean is Tadeusz's co-worker, isn't he?",
	"Dr Bean is Barbara's boss, isn't he?",
	"Dr Bean is Eva's boss, isn't he?",
	"Barbara is Eva's boss, isn't she?",
	"Barbara is Eva's co-worker, isn't she?",
	"Barbara is Dr Bean's co-worker, isn't she?",
	"Some women were ambitious, isn't she?",
	"Dr Bean is a co-worker and Eva is a co-worker, isn't he?",
	"Dr Bean is a woman and Eva is a woma, isn't he?",
	"Some co-workers were women, isn't she?",
	"Some women were co-workers, isn't she?",
	"All co-workers were women, isn't she?",
	"All women were co-workers, isn't she?",
	"All ambitious women were successful."
	]

comp_test2 = [
	"Some woman was ambitious.",
	"Some women was successful.",
	"Some women were successful.",
	"Eva was a woman.",
	"Was Eva a woman?",
	"Were some women co-workers?",
	"Was Tadeusz's co-worker a woman?",
	"Eva was Dr Bean's co-worker.",
	"Eva was Tadeusz's co-worker.",
	"Eva was Barbara's co-worker.",
	"Barbara was an ambitious woman who was a co-worker.",
	"Barbara was an ambitious woman who had a boss.",
	"Barbara was an ambitious woman with a boss.",
	"Barbara was an ambitious woman from a boss.",
	"The ambitious woman who had a boss was Barbara.",
	"Barbara had a boss.",
	"Barbara was an ambitious woman.",
	"Barbara was a woman who was ambitious.",
	"Tadeusz was Barbara's boss.",
	"Barbara was Tadeusz's boss.",
	"Tadeusz was Barbara's co-worker."
	]

tag_test = [
	"Barbara worked, didn't she.",
	"Some woman was ambitious, wasn't she.",
	"Some women were successful, wasn't she.",
	"Some women were successful, weren't they.",
	"Eva was a woman with a boss, wasn't she?",
	"Was Eva a woman, wasn't she?",
	"Barbara was an ambitious woman who was a co-worker, wasn't she?",
	"Barbara was an ambitious woman who had a boss, wasn't she?",
	"The ambitious woman who had a boss was Barbara, wasn't she?",
	"Barbara had a boss, didn't she?",
	"Barbara had a boss, wasn't she?",
	"Barbara had a co-worker, did she?",
	"Barbara did have a co-worker, didn't she?",
	"Barbara didn't have a co-worker, did she?",
	"Barbara didn't have a co-worker, did he?",
	"Some women had co-workers, didn't they?"
	]

neg_tag_test = [
	"Barbara didn't work, did she.",
	"Some woman wasn't ambitious, was she.",
	"Some women weren't successful, was she.",
	"Some women weren't successful, were they.",
	"Eva wasn't a woman with a boss, was she?",
	"Wasn't Eva a woman, was she?",
	"Barbara wasn't an ambitious woman who was a co-worker, was she?",
	"Barbara wasn't an ambitious woman who had a boss, was she?",
	"The ambitious woman who had a boss wasn't Barbara, was she?",
	"Barbara didn't have a boss, did she?",
	"Barbara didn't have a boss, was she?",
	"Barbara didn't have a co-worker, did she?",
	"Barbara did have a co-worker, didn't she?",
	"Barbara did have a co-worker, did she?",
	"Barbara did have a co-worker, did he?",
	"Some women didn't have co-workers, did they?"
	]

test_possessives = [
	"Tadeusz is the head of the company isn't he?"
	, "Barbara's co-worker talked to the boss."
	, "Barbara's boss got Dr Bean's job."
	, "Did Dr Bean's co-worker give a job to the German woman's boss?"
	, "Did Dr Bean's co-worker give a job to a German woman's boss?"
	, "Did Eva talk to Dr Bean?"
	, "The boss of Barbara talked to Eva."
	, "Did the co-worker of Barbara talk to Dr Bean?"
	, "Did a co-worker of Barbara talk to Dr Bean?"
	, "Did the co-worker of a German woman talk to Barbara's boss?"
	, "Did the co-worker of the German woman have sales experience?"
	, "Did a co-worker of an ambitious woman have sales experience?"
	, "Did the co-workers of the ambitious women have sales experience?"
	, "Did the co-worker of Dr Bean have sales experience?"
	, "Did the boss of Barbara have sales experience?"
	, "Did the boss of the German woman have sales experience?"
	, "Did the boss of Barbara talk to Eva?"
	, "Dr Bean's co-worker hoped to get the job."
	]

haves = [
	"Did Barbara have a co-worker?",
	"Did Barbara have a boss?",
	"Did Barbara have a strong personality?",
	"Did Barbara's boss have a co-worker?",
	"Did Eva have a job?",
	"Did Eva have some job?",
	"Did Eva have sales experience?",
	"Did Barbara's boss have sales experience?",
	"Did Eva have sales experience?",
	"Did Tadeusz have a boss?",
	"Did Tadeusz have some bosses?",
	"Did Tadeusz have bosses?",
	"Did Tadeusz's boss have a boss?",
	"Did Tadeusz's boss have some bosses?",
	"Did Tadeusz's boss have bosses?",
	"Did Tadeusz have work?",
	"Did Eva work?",
	"Did Eva have work?",
	"Did Eva have a job?",
	"Did Barbara have work?",
	"Did Barbara have a job?",
	"Did Barbara's boss have work?",
	"Did a co-worker have a job?",
	"Did a co-worker have a woman's job?",
	"Did a co-worker have Barbara's job?",
	"Did a co-worker have a co-worker?",
	"Did a co-worker have a boss?",
	-- "Did a job have a salary?",
	"Did an ambitious woman have sales experience?",
	"Did an ambitious woman have some sales experience?",
	"Did an ambitious woman's boss have some sales experience?",
	"Did an ambitious woman's boss have a job?",
	"Did the boss have some sales experience?",
	"Did the boss have no sales experience?",
	"Eva's boss had many jobs in Poland.",
	"Did the boss have some job?",
	"Did the boss have no job?",
	"Did Poland have sales experience?",
	"Did the United States have sales experience?",
	"Did Fast-Track have sales experience?",
	"Did Barbara's boss have sales experience?",
	"Did a co-worker have a boss?",
	"Did a co-worker have some bosses?",
	"Did a co-worker have bosses?",
	"Did Fast-Track have a boss?",
	"Did Fast-Track have some bosses?",
	"Did Fast-Track have bosses?",
	"Did a co-worker have a worker?",
	"Did Barbara's boss have a worker?",
	"Did Fast-Track have a worker?",
	"Did someone have a worker?"
	]

ungrammatical = [
	"Did Eva worked?",
	"Barbara work?",
	"Man worked.",
	"Some man work.",
	"No worked.",
	"No-one work.",
	"Did Eva taught?",
	"Eva teach Barbara.",
	"Barbara taught.",
	-- "Did Barbara's boss hoped to get the job?",
	-- "Man hoped to get the job.",
	"Some man work.",
	-- "No hoped to get the job.",
	"No-one work.",
	"Did Barbara's boss taught?",
	"Barbara's boss teach a co-worker.",
	"A co-worker interviewed."
	]

intransitives = [
	"Eva worked",
	"Did Eva work?",
	"Barbara's boss worked.",
	"A woman's boss worked.",
	"Did Barbara's boss work?",
	"Did a woman's boss work?",
	"A man worked.",
	"Some man worked.",
	"No one worked.",
	"No-one worked.",
	"Everybody worked.",
	"Everyone worked.",
	"Many persons worked.",
	"No person worked.",
	"Did the man work?",
	"Did some man work?",
	"Did some men work?",
	"Did some woman work?",
	"Did some women work?",
	"Most women worked.",
	"Most women didn't work.",
	"Several women worked.",
	"Several women didn't work.",
	"Many women worked.",
	"Many women didn't work.",
	"All women worked.",
	"No woman worked.",
	"Most men worked.",
	"Most men didn't work.",
	"Several men worked.",
	"Several men didn't work.",
	"Many men worked.",
	"Many men didn't work.",
	"All men worked.",
	"No man worked.",
	"Did Barbara work in Poland?",
	"Did Barbara work for Poland?",
	"Did Eva work for Poland?",
	"Did Eva work at a company?",
	"Did Barbara's boss work for Poland?",
	"Did Barbara's boss work?",
	"Did the co-worker work?",
	"Did Barbara's boss work?",
	"A man worked.",
	"Some man worked.",
	"No one worked.",
	"No-one worked.",
	"Everybody worked.",
	"Everyone worked.",
	"Many persons worked.",
	"No person worked.",
	"Did the man work?",
	"Did some man work?",
	"Did some men work?",
	"Did some woman work?",
	"Did some women work?",
	"Most persons worked.",
	"Most men worked.",
	"Most men didn't work.",
	"Several men worked.",
	"Several men didn't work.",
	"Several persons worked.",
	"Several persons didn't work.",
	"Did Barbara's boss work?",
	"Did a co-worker work?",
	"Did Barbara work?",
	-- "A man hoped to get the job.",
	-- "Some man hoped to get the job.",
	-- "No one hoped to get the job.",
	-- "No-one hoped to get the job.",
	-- "Everybody hoped to get the job.",
	-- "Everyone hoped to get the job.",
	-- "Many persons hoped to get the job.",
	-- "No person hoped to get the job.",
	"Did the man work?",
	"Did the girl work?",
	"Did some man work?",
	"Did some men work?",
	"Did some woman work?",
	"Did some women work?",
	-- "Most men hoped to get the job.",
	"Most men didn't work.",
	-- "Several men hoped to get the job.",
	"Several men didn't work.",
	-- "Many men hoped to get the job.",
	"Many men didn't work."
	-- "All men hoped to get the job.",
	-- "No man hoped to get the job."
	]

transitives = [
	"Did Eva study?",
	"Did Eva study IT?",
	"Eva studied marketing.",
	"Barbara studied marketing.",
	"Barbara studied marketing in Poland.",
	"Barbara studied marketing at Poland.",
	"Did Barbara go to Poland?",
	"Some woman went to Poland.",
	"Some man went to Poland.",
	"Some boy went to Poland.",
	"Some man interviewed Barbara.",
	"A man interviewed Eva",
	"Some woman gave a presentation.",
	"Did a co-worker work in the Poland?",
	"Did a co-worker work in the United States?",
	"A co-worker worked in the United States.",
	"A co-worker worked at the United States.",
	"Did a co-worker work at a company?",
	"A co-worker worked on a company.",
	"A co-worker worked in a company.",
	"A co-worker worked as a co-worker.",
	"Did the job work at a company?",
	"The job worked on a company.",
	"The job worked in a company.",
	"Did the job disappoint a co-worker?",
	"Did Barbara's boss study marketing?",
	"Barbara's boss studied marketing.",
	"A co-worker studied marketing.",
	"Did a co-worker study in Poland?",
	"A co-worker studied marketing at a company.",
	"A co-worker studied marketing at the company.",
	"Did a co-worker go to the company.",
	"Some woman went to the company.",
	"Some man went to the company.",
	"Some boy went to the company.",
	"Some man interviewed a co-worker.",
	"A man interviewed Barbara's boss",
	"Some woman gave a presentation.",
	"Did a co-worker come from Poland?",
	"Did Barbara immigrate?",
	"Did a co-worker immigrate to Poland?",
	"Did Barbara go to Poland?",
	"Did Barbara come from Poland?",
	"Did Barbara's boss come to Poland?"
	]

ditransitive_tests = [
	"Barbara's boss got a presentation from Barbara.",
	"Barbara gave a presentation.",
	"Barbara gave Barbara's boss a presentation.",
	"Barbara gave a presentation to Barbara's boss.",
	"Barbara gave a presentation to Eva",
	"Barbara gave some job to Eva.",
	"Did Barbara give some job to Eva.",
	"Did Barbara give the job to Eva?",
	"Did Barbara give the job to someone?",
	"Barbara gave several jobs to Eva.",
	"Did someone give something to Eva?",
	"A woman gave the job to Eva.",
	"A woman gave the job to someone.",
	"A woman gave something to someone.",
	"Someone gave something to someone.",
	"Barbara gave Eva some job.",
	"Did Barbara give Eva some job?",
	"Did Barbara give Eva the job?",
	"Did Barbara give someone the job?",
	"Barbara gave Eva several jobs.",
	"Did someone give Eva something?",
	"A man gave Eva the job.",
	"A boy gave Eva the job.",
	"Dr Bean gave Eva a co-worker.",
	"A man gave someone the job.",
	"A man gave someone something.",
	"Someone gave someone something.",
	"A co-worker gave a presentation.",
	"A co-worker gave the interviewer a presentation.",
	"A co-worker gave a presentation to the interviewer.",
	"A co-worker gave a presentation to Barbara's boss",
	"A co-worker gave some job to Barbara's sales record.",
	"Did a co-worker give some job to Barbara's sales record.",
	"Did a co-worker give the job to Barbara's boss?",
	"Did a co-worker give the job to someone?",
	"A co-worker gave a job to Barbara's sales record.",
	"Did someone give something to Barbara's boss?",
	"A woman gave the job to Barbara's sales record.",
	"A woman gave the job to someone.",
	"A woman gave something to someone.",
	"Someone gave something to someone.",
	"A co-worker gave Barbara's boss some candidates.",
	"Did a co-worker give Barbara's boss some candidates?",
	"Did a co-worker give Barbara's boss the candidates?",
	"Did a co-worker give someone the candidates?",
	"A co-worker gave Barbara's boss several jobs.",
	"Did someone give Barbara's boss something?",
	"A team member gave Tadeusz some ideas.",
	"A man gave Tadeusz some ideas.",
	"Someone gave Tadeusz the ideas.",
	"The job gave Barbara's boss the ideas.",
	"A man gave someone the job.",
	"A man gave someone something.",
	"Someone gave someone something.",
	"Did a co-worker work at a company?",
	"A co-worker did work at a company."
	-- "Did Barbara's boss give a name to Fast-Track?"
	]

wh_questions =[
	"Who worked?",
	"Who did Eva teach?",
	"Who taught Eva?",
	"Who gave the job to Eva?",
	"Who gave some job to Eva?",
	"Which person worked?",
	"Which person did Eva teach?",
	"What did Dr Bean teach?",
	-- "Who did Barbara give some job?",
	"Who did Barbara give some job to?",
	"Who hoped to get the job?",
	"Which man hoped to get the job?",
	"Who was Barbara's boss?",
	"Who interviewed Barbara's boss?",
	"Which woman interviewed Barbara's boss?",
	"Who gave the job to Barbara's boss?",
	"Who gave some job to Barbara's boss?",
	"Who was the ambitious administrative assistant?",
	"Who was the administrative assistant who was ambitious?",
	"Which person hoped to get the job?",
	"Which woman appreciated a co-worker?",
	"Which girl appreciated a co-worker?",
	"Which boss appreciated a co-worker?",
	"Who did Barbara's boss appreciate?",
	"Which person did Barbara's boss appreciate?",
	"Which man did Barbara's boss appreciate?",
	"Which woman did Barbara's boss appreciate?",
	"Which thing did Barbara's boss appreciate?",
	"Which worker did Barbara's boss appreciate?",
	-- "To whom did a co-worker give some languages?",
	-- "Who did a co-worker give some languages to?",
	"Who had a worker?",
	"What did Barbara's boss have?",
	"Who did Barbara's boss have?",
	"Who did the job disappoint?",
	"Who did a co-worker's boss appreciate?",
	"What did a co-worker's boss appreciate?",
	"Which thing did a co-worker's boss appreciate?",
	"Which man did a co-worker's boss appreciate?",
	"Which woman did a co-worker's boss appreciate?",
	"Which worker did a co-worker's boss appreciate?",
	"What did someone have?"
	]

comp_wh_questions = [
	"Who was ambitious?",
	"Who was successful?",
	"Who was a woman?",
	"Who were women?",
	"Who was the woman?",
	"Who was Dr Bean's co-worker?",
	"Who was Tadeusz's co-worker?",
	"Who was Barbara's co-worker?",
	"Who was the ambitious woman that had a boss?",
	"Who was Barbara's boss?",
	"Who was Barbara's boss's co-worker?"
	]

relclauses = [
	"Barbara was an ambitious woman who was a co-worker.",
	"Barbara was an ambitious woman who had a boss.",
	"The ambitious woman who had a boss was Barbara.",
	"A woman who taught Eva worked.",
	"The woman who Eva helped worked.",
	"Did the woman who taught Eva work?",
	"Did every woman who taught Eva work?",
	"The woman who gave the job to Eva worked.",
	"Barbara spoke to the man that she gave the job to.",
	"Barbara appreciated the man that helped the woman " 
	 ++ "that was ambitious.",
	-- "A woman who interviewed Barbara's boss hoped to get the job.",
	-- "The woman who interviewed Barbara's boss hoped to get the job.",
	"Did the woman who interviewed Barbara's boss work?",
	"Did every person who interviewed Barbara's boss work?",
	"Did some person who interviewed Barbara's boss work?",
	-- "The woman who gave the job to Barbara's boss hoped to get the job.",
	"Barbara gave a presentation to the man that gave the job to Barbara's co-worker.",
	"The man that Barbara gave a presentation to gave the job to Barbara's co-worker.",
	"The man Barbara gave a presentation to gave the job to Barbara's co-worker.",
	"The job disappointed the man that gave Barbara's boss the job.",
	"The man that the job disappointed worked for Poland.",
	"The man the job disappointed worked for Poland.",
	"Barbara's boss accepted the job that a man gave Barbara's sales record.",
	"Barbara's boss accepted the job that a man gave to Barbara's sales record.",
	"Barbara appreciated the man that gave the girl \
	 \that worked for Poland a job?"
	]



relppR_test = [
	"A woman with some job worked.",
	"A woman with no job worked.",
	"The woman with the job got a job.",
	"The woman with the job gave a job to Dr Bean.",
	"A woman who didn't have a job gave a job to Dr Bean.",
	"The woman with the job gave a job to a co-worker."
	]

to_inf_test = [
	"Barbara wanted to become sales manager.",
	"Did Barbara want to become sales manager?",
	"Did a woman want to become sales manager?",
	"A woman wanted to.",
	"A woman wanted to have a job.",
	"Did Tadeusz want to become sales manager?",
	"Did Tadeusz become sales manager?",
	-- "Did a woman want to get to the top?",
	"Barbara wanted to work.",
	"A woman wanted to work.",
	"A woman didn't want to work."
	]


-- lf0 = Rel "worked" [ Const(ents!!17) ]
-- lf00 = (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] ) 
-- -- lf000 = (Exists (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] )) (Const(ents)!!17)
-- 
-- lf1 = (Equi  (Rel "married" [ Const(ents!!9), Const(ents!!1) ]) (Neg (Rel "married" [ Const(ents!!8), Const(ents!!17)]) ) )
-- 
-- lf2 = (Conj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )
-- 
-- lf3 = Rel "married" [ Const (ents !! 8), Const (ents !! 17)]
-- lf4 = (Impl  (Rel "married" [ Const (ents !! 9), Const        (ents !! 1)]) (Rel "married" [ Const (ents !! 8), Const (ents !!    17)])  )
-- lf5 = (Conj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )
-- lf6 = (Disj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )
-- 
-- lf70 = ( \x -> ( Conj [ (Rel "boss" [x]), (Rel "have" [x, Const (ents !! 8)]) ] ) ) (Const (ents !! 12) )
-- lf71 = ( \x -> ( Conj [ (Rel "boss" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) ) (Const (ents !! 12) )
-- lf72 = ( \x -> ( Conj [ (Rel "boss" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) ) (Const (ents !! 12) )
-- lf73 = \x -> Conj [ (Rel "boss" [x]), (Rel "have" [x, Const (ents !! 17)]) ]
-- lf74 = ( \x -> ( Conj [ (Rel "boss" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) )
-- lf75 = \x -> Impl (Rel "boss" [x]) (Rel "have" [x, Const (ents !! 17)])

-- vim: set ts=8 sts=2 sw=2 noet:
