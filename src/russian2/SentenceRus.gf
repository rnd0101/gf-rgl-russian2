concrete SentenceRus of Sentence = CatRus ** open Prelude, ParamRus, (R=ResRus) in {
flags optimize=all_subs ; coding=utf8 ;
lin
  -- : Adv -> S -> S ;            -- then I will go home
  AdvS a s = {s=\\m => a.s ++ s.s ! m} ;

  -- : Temp -> Pol -> Cl -> S ;   -- she had not slept - она не спала
  UseCl temp pol cl = {
    s = table {
      Infinitive => temp.s ++ cl.subj ++ pol.s ++ cl.verb.inf ++ cl.compl ;
      Ind        => temp.s ++ cl.subj ++ pol.s ++ R.verbAgr cl.verb Ind temp.t cl.a pol.p ++ cl.compl ;
      Sbjv       => temp.s ++ cl.subj ++ pol.s ++ R.verbAgr cl.verb Sbjv temp.t cl.a pol.p ++ cl.compl ;
      Imperative => temp.s ++ cl.subj ++ pol.s ++ R.verbAgr cl.verb Imperative temp.t cl.a pol.p ++ cl.compl
      }
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
