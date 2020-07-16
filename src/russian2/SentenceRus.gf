concrete SentenceRus of Sentence = CatRus ** open Prelude, TenseRus, ParamRus, (R=ResRus) in {
flags optimize=all_subs ; coding=utf8 ;
lin
  -- : Adv -> S -> S ;            -- then I will go home
  AdvS a s = {s=\\m => a.s ++ s.s ! m} ;

  -- : Temp -> Pol -> Cl -> S ;   -- she had not slept - она не спала
  UseCl temp pol cl = {
    s = table {
      Infinitive => let parts = R.verbAgr cl.verb Infinitive temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ parts.p2 ++ cl.compl ;
      Ind => let parts = R.verbAgr cl.verb Ind temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ parts.p2 ++ cl.compl ;
      Sbjv => let parts = R.verbAgr cl.verb Sbjv temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ parts.p2 ++ cl.compl ;
      Imperative => let parts = R.verbAgr cl.verb Imperative temp.t cl.a pol.p in
        temp.s ++ parts.p1 ++ cl.subj ++ pol.s ++ parts.p2 ++ cl.compl
      }
    } ;

  -- : VP -> Imp ;             -- love yourselves
  ImpVP vp = {
    s = \\polarity, gn =>
      let pol = case polarity of {Neg => PNeg; Pos => PPos} in
      let a = Ag gn P2 in
      let parts = R.verbAgr vp.verb Imperative Pres a pol.p in
          parts.p1 ++ pol.s ++ parts.p2 ++ vp.compl ! a
    } ;

  -- : NP -> VP -> Cl ;         -- John walks - Иван гуляет
  PredVP np vp = {
    subj=np.s ! Nom ;
    compl=vp.compl ! np.a ;
    verb=vp.verb ;
    a=np.a
    } ;

  -- : SC -> VP -> Cl ;         -- that she goes is good - что она идёт есть хорошо
  PredSCVP sc vp = {
    subj=sc.s ;
    compl=vp.compl ! Ag (GSg Neut) P3 ;  -- ???
    verb=vp.verb ;
    a=Ag (GSg Neut) P3   -- ???
    } ;

  -- : S -> SC ;               -- that she goes - что она идёт
  EmbedS s = {s = "что" ++ s.s ! Ind} ;

}
