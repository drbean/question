incomplete concrete CuspI of Cusp = open Syntax, ParadigmsEng, ExtraEng, LexCusp in {

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
  V3	= Syntax.V3;
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
  Be_someone np	= mkComp np;
  Be_vp comp	= mkVP comp;
  Look_bad verb adj	= mkVP verb adj;
  Happening action	=	mkVP action;
  Changing action patient	= mkVP action patient;
  Causative causal patient predicate	= mkVP causal patient predicate;
  Intens attitude predicate	= mkVP attitude predicate;
  Positing posit event	= mkVP posit event;
  Informing posit patient event	= mkVP posit patient event;
  Triangulating agent recipient patient = mkVP agent recipient patient; 
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

  Yes	= LexCusp.yes_Utt;
  No	= LexCusp.no_Utt;
  NoAnswer	= LexCusp.no_answer_Utt;

  Entity pn	= mkNP pn;
  General role = mkNP role;
  Kind ap cn	= mkCN ap cn;
  Ofpos n2 np	= mkCN n2 np;
  Apos np	= mkDet (GenNP np);
  Item det noun	= mkNP det noun;

  a_Det	= LexCusp.a_Det;
  zero_Det	= LexCusp.zero_Det;
  the_Det	= LexCusp.the_Det;
  thePlural_Det = LexCusp.thePlural_Det;

  who_WH	= LexCusp.who_WH;
  what_WH	= LexCusp.what_WH;

  about_prep	= LexCusp.about_prep;
  at_prep	= LexCusp.at_prep;
  in_prep	= LexCusp.in_prep;
  of_prep	= LexCusp.of_prep;
  on_prep	= LexCusp.on_prep;
  over_prep	= LexCusp.over_prep;
  to_prep	= LexCusp.to_prep;
  up_prep	= LexCusp.up_prep;

  become	= become_V2;
  can	= LexCusp.can_VV;
  get	= get_V2;
  know_V2	= LexCusp.know_V2;
  know_VS	= LexCusp.know_VS;
  like	= like_V2;
  need	= LexCusp.need_V2;
  -- need_V	= LexCusp.need_VV;
  prove	= prove_V2;
  say	= say_VS;
  tell	= tell_V2S;

  abdicate	= mkV2 abdicate_V;
  agree	= mkV2 agree_V;
  allow	= mkV2V allow_V noPrep to_prep;
  appear	= mkVA appear_V;
  base	= mkV3 base_V noPrep on_prep;
  boost	= mkV2 boost_V;
  call	= mkV3 call_V;
  cause	= mkV2 cause_V;
  consult	= LexCusp.consult_V;
  consider	= mkV2 consider_V;
  cope	= LexCusp.cope_V;
  deal	= LexCusp.deal_V;
  enable	= mkV2 enable_V;
  encourage	= mkV2V encourage_V noPrep to_prep;
  facilitate	= mkV2 facilitate_V;
  feel	= mkVA feel_V;
  feel_S	= mkVS feel_V;
  -- find	= mkV2A find_V noPrep;
  give	= mkV3 give_V;
  happen	= LexCusp.happen_V;
  have	= mkV2 have_V;
  help	= mkV2V help_V noPrep to_prep;
  identify	= mkV2 identify_V;
  investigate	= mkV2 investigate_V;
  listen	= mkV2 listen_V;
  look_A	= mkVA look_V;
  look_at	= mkV2 look_V at_prep;
  make	= mkV2 make_V;
  occur	= LexCusp.occur_V;
  offer	= mkV2 offer_V;
  pick	= mkV2 pick_V up_prep;
  prevent	= mkV2 prevent_V;
  provide	= mkV2 provide_V;
  raise	= mkV2 raise_V;
  receive	= mkV2 receive_V;
  reduce	= mkV2 reduce_V;
  report	= mkV2 report_V;
  stand	= mkV2 stand_V;
  suggest	= mkVS suggest_V;
  take	= mkV2 take_V;
  talk	= mkV3 talk_V to_prep about_prep;
  tend	= mkVV tend_V;
  think	= mkVS think_V;
  train	= mkV2 train_V;
  use	= mkV2V use_V noPrep to_prep;
  work_V	= LexCusp.work_V;

  assertive	= mkAP assertive_A;
  bad	= mkAP bad_A;
  best_placed	= mkAP best_placed_A;
  brief	= mkAP brief_A;
  common	= mkAP common_A;
  critically_important	= mkAP critically_important_A;
  day_to_day	= mkAP day_to_day_A;
  difficult	= mkAP difficult_A;
  effective	= mkAP effective_A;
  face_to_face	= mkAP face_to_face_A;
  good	= mkAP good_A;
  helpless	= mkAP helpless_A;
  high	= mkAP high_A;
  latter	= mkAP latter_A;
  little	= mkAP little_A;
  main	= mkAP main_A;
  managerial	= mkAP managerial_A;
  more	= mkAP more_A;
  most	= mkAP most_A;
  other	= mkAP other_A;
  own	= mkAP own_A;
  particular	= mkAP particular_A;
  poor	= mkAP poor_A;
  practical	= mkAP practical_A;
  psychological	= mkAP psychological_A;
  severe	= mkAP severe_A;
  simple	= mkAP simple_A;
  social	= mkAP social_A;
  stressful	= mkAP stressful_A;
  structured	= mkAP structured_A;
  three	= mkAP three_A;
  timely	= mkAP timely_A;
  two_way	= mkAP two_way_A;
  unsupported	= mkAP unsupported_A;
  useful	= mkAP useful_A;
  vulnerable	= mkAP vulnerable_A;
  wrong	= mkAP wrong_A;

  action	= mkCN action_N;
  approachability	= mkNP approachability_N;
  area	= mkCN area_N;
  assessment	= mkNP assessment_N;
  awareness	= mkNP awareness_N;
  business	= mkCN business_N;
  cause_of	= mkN2 cause_N of_prep;
  characteristic	= mkCN characteristic_N;
  climate	= mkCN climate_N;
  combination	= mkCN combination_N;
  comment	= mkCN comment_N;
  communication	= mkNP communication_N;
  company	= mkCN company_N;
  consultation	= mkCN consultation_N;
  control_over	= mkN2 control_N over_prep;
  delegation	= mkNP delegation_N;
  depression	= mkNP depression_N;
  difference	= mkCN difference_N;
  difficulty	= mkCN difficulty_N;
  element	= mkCN element_N;
  example	= mkCN example_N;
  experience	= mkCN experience_N;
  feeling	= mkCN feeling_N;
  flexibility	= mkNP flexibility_N;
  framework	= mkCN framework_N;
  group	= mkCN group_N;
  health	= mkNP health_N;
  hotspot	= mkCN hotspot_N;
  idea	= mkCN idea_N;
  individual	= mkCN individual_N;
  key	= mkCN key_N;
  kind	= mkCN kind_N;
  lack_of	= mkN2 lack_of_N of_prep;
  level	= mkCN level_N;
  luck	= mkCN luck_N;
  management	= mkNP management_N;
  manager	= mkCN manager_N;
  meeting	= mkCN meeting_N;
  message	= mkCN message_N;
  mind	= mkCN mind_N;
  minute	= mkCN minute_N;
  model	= mkCN model_N;
  one	= mkCN one_N;
  openness	= mkNP openness_N;
  option	= mkCN option_N;
  overview	= mkCN overview_N;
  people	= mkCN people_N;
  performance	= mkNP performance_N;
  placement	= mkNP placement_N;
  plan	= mkCN plan_N;
  position	= mkCN position_N;
  problem	= mkCN problem_N;
  responsibility	= mkNP responsibility_N;
  risk	= mkCN risk_N;
  sense_of	= mkN2 sense_of_N of_prep;
  situation	= mkCN situation_N;
  skill	= mkCN skill_N;
  staff	= mkNP staff_N;
  strategy	= mkCN strategy_N;
  study	= mkCN study_N;
  thing	= mkCN thing_N;
  time	= mkNP time_N;
  truth	= mkCN truth_N;
  way	= mkCN way_N;
  work	= mkNP work_N;
  workload	= mkCN workload_N;

  bradshaw	= mkPN bradshaw_N;
  c	= mkPN c_N;
  control	= mkPN control_N;
  cusp	= mkPN cusp_N;
  gourlay	= mkPN gourlay_N;
  in_equilibrium	= mkPN in_equilibrium_N;
  men	= mkNP zero_Det men_N;
  p	= mkPN p_N;
  pressure	= mkPN pressure_N;
  s	= mkPN s_N;
stress = mkPN stress_N;
  support	= mkPN support_N;
  u	= mkPN u_N;
  uncertainty	= mkPN uncertainty_N;
  women	= mkNP zero_Det women_N;

}

-- vim: set ts=8 sts=2 sw=2 noet:
