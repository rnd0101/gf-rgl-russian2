concrete SentenceRus of Sentence = CatRus ** open Prelude, TenseRus, ParamRus, Coordination, (R=ResRus) in {
flags optimize=all_subs ; coding=utf8 ;
lin
  -- : Adv -> S -> S ;            -- then I will go home
  AdvS adv s = {s=\\m => adv.s ++ s.s ! m} ;
  -- : Adv -> S -> S ;            -- next week, I will go home
  ExtAdvS adv s = {s=\\m => adv.s ++ comma ++ s.s ! m} ;   -- TODO: what is the case for this? embed in commas?

  -- : Temp -> Pol -> Cl -> S ;   -- she had not slept - она не спала
  UseCl temp pol cl = {
    s = table {
      Infinitive => let parts = R.verbAgr cl.verb Infinitive temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ cl.adv ++ parts.p2 ++ cl.compl ;
      Ind => let parts = R.verbAgr cl.verb Ind temp.t cl.a pol.p in
--        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ cl.adv ++ parts.p2 ++ cl.compl ;
          temp.s ++ cl.adv ++ pol.s ++ parts.p1 ++ parts.p2 ++ cl.subj ++ cl.compl ;
      Sbjv => let parts = R.verbAgr cl.verb Sbjv temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ cl.adv ++ parts.p2 ++ cl.compl ;
      Imperative => let parts = R.verbAgr cl.verb Imperative temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ cl.adv ++ parts.p2 ++ cl.compl
      }
    } ;

  -- : Temp -> Pol -> RCl -> RS ;  -- that had not slept
  UseRCl temp pol rcl = {
    s = \\gn,anim,cas =>
      let parts = R.verbAgr rcl.verb Ind temp.t rcl.a pol.p in
      let a=genNumAgrP3 gn in
      temp.s ++ parts.p1 ++ rcl.subj ! gn ! anim ! cas ++ pol.s ++ rcl.adv ! a ++ parts.p2 ++ rcl.compl ! a ;
    c = Nom
    } ;

  -- : Temp -> Pol -> ClSlash -> SSlash ; -- (that) she had not seen
  UseSlash temp pol cls = {
    s = table {
      Infinitive => let parts = R.verbAgr cls.verb Infinitive temp.t cls.a pol.p in
        temp.s ++ parts.p1 ++ cls.subj ++ pol.s ++ cls.adv ++ parts.p2 ++ cls.compl ;
      Ind => let parts = R.verbAgr cls.verb Ind temp.t cls.a pol.p in
        temp.s ++ parts.p1 ++ cls.subj ++ pol.s ++ cls.adv ++ parts.p2 ++ cls.compl ;
      Sbjv => let parts = R.verbAgr cls.verb Sbjv temp.t cls.a pol.p in
        temp.s ++ parts.p1 ++ cls.subj ++ pol.s ++ cls.adv ++ parts.p2 ++ cls.compl ;
      Imperative => let parts = R.verbAgr cls.verb Imperative temp.t cls.a pol.p in
        temp.s ++ parts.p1 ++ cls.subj ++ pol.s ++ cls.adv ++ parts.p2 ++ cls.compl
      } ;
    c=cls.c
  } ;

  -- : NP -> VPSlash -> ClSlash ;      -- (whom) he sees
  SlashVP np vps = {
    subj=np.s ! Nom ; -- ????????
    compl=vps.compl ! np.a ;  -- ??
    adv=vps.adv ! np.a ;  -- ??
    verb=vps.verb ;
    a=np.a ;
    c=vps.c
  } ;

  -- : Cl -> Prep -> ClSlash ;         -- (with whom) he walks
  SlashPrep cl prep = {
    subj=cl.subj ;
    compl=cl.compl ;
    adv=cl.adv ;
    verb=cl.verb ;
    a=cl.a ;
    c=prep
    } ;

  -- NP -> VS -> SSlash -> ClSlash ; -- (whom) she says that he loves
  SlashVS np vs ss = {
    subj=np.s ! Nom  ; -- ????????
    compl=embedInCommas ("что" ++ ss.s ! Ind) ;  -- ?? that?
    adv=[];  -- ??
    verb=vs ;
    a=np.a ;
    c=ss.c
  } ;

  -- : ClSlash -> Adv -> ClSlash ;     -- (whom) he sees today
  AdvSlash cls adv = cls ** {
--    subj=cls.subj ++ adv.s    -- two variants? TODO: check
    adv=cls.adv ++ adv.s
    } ;

  -- : VP -> Imp ;             -- love yourselves
  ImpVP vp = {
    s = \\polarity, gn =>
      let pol = case polarity of {Neg => PNeg; Pos => PPos} in
      let a = Ag gn P2 in
      let parts = R.verbAgr vp.verb Imperative Pres a pol.p in
          parts.p1 ++ pol.s ++ parts.p2 ++ vp.adv ! a ++ vp.compl ! a
    } ;

  -- : NP -> VP -> Cl ;         -- John walks - Иван гуляет
  PredVP np vp = {
    subj=np.s ! Nom ;
    adv=[] ;
    verb=vp.verb ;
    compl=vp.compl ! np.a ;
    a=np.a
    } ;

  -- : SC -> VP -> Cl ;         -- that she goes is good - что она идёт есть хорошо
  PredSCVP sc vp = {
    subj=sc.s ;
    adv=[] ;
    verb=vp.verb ;
    compl=vp.compl ! Ag (GSg Neut) P3 ;  -- ???
    a=Ag (GSg Neut) P3   -- ???
    } ;

  -- : S -> SC ;               -- that she goes - что она идёт
  EmbedS s = {s = "что" ++ s.s ! Ind} ;

  -- : Temp -> Pol -> QCl -> QS ;  -- who had not slept
  UseQCl temp pol cl = {
    s = table {_ =>
      let parts = R.verbAgr cl.verb Ind temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ cl.adv ++ parts.p2 ++ cl.compl
      }
    } ;

  -- : QS -> SC                -- who goes
  EmbedQS qs = {s = qs.s ! QIndir} ;

}
