concrete SentenceRus of Sentence = CatRus ** open Prelude, ResRus in {
flags optimize=all_subs ; coding=utf8 ;
lin
    -- : Adv -> S -> S ;            -- then I will go home
    AdvS a s = {s=\\m => a.s ++ s.s ! m} ;

    -- : Temp -> Pol -> Cl -> S ;   -- she had not slept - она не спала
    UseCl temp pol cl = {
      s = table {
        Infinitive => temp.s ++ cl.subj ++ pol.s ++ cl.verb.inf ++ cl.compl ;
        Ind        => temp.s ++ cl.subj ++ pol.s ++ verbAgr cl.verb Ind temp.t cl.a pol.p ++ cl.compl ;
        Sbjv       => temp.s ++ cl.subj ++ pol.s ++ verbAgr cl.verb Sbjv temp.t cl.a pol.p ++ cl.compl ;
        Imp        => temp.s ++ cl.subj ++ pol.s ++ verbAgr cl.verb Imp temp.t cl.a pol.p ++ cl.compl
        }
      } ;

    -- : NP -> VP -> Cl ;         -- John walks
    PredVP np vp = {
      subj=np.s ! Nom ;    -- ???
      compl=vp.compl ! np.a ;
      verb=vp.verb ;
      a=np.a
      } ;
}