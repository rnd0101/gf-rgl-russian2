--# -path=.:../abstract:../common:../../prelude

concrete AdverbRus of Adverb = CatRus ** open ResRus, Prelude in {
flags coding=utf8 ;

lin
  -- : A -> Adv ;               -- warmly
  PositAdvAdj a = {s = a.sn} ;  -- only qual

  -- : CAdv -> A -> NP -> Adv ; -- more warmly than John - более тепло чем Иван
  ComparAdvAdj cadv a np = {
    s = cadv.s ++ a.sn ++ "чем" ++ np.s ! Nom -- ???
    } ;
  -- : CAdv -> A -> S  -> Adv ; -- more warmly than he runs - более тепло чем он бежал
  ComparAdvAdjS cadv a s = {
    s = cadv.s ++ a.sn ++ "чем" ++ s.s
    } ;

  -- : Prep -> NP -> Adv ;        -- in the house - в доме
  PrepNP p np = ss (p.s ++ np.s ! p.c) ;

  -- : AdA -> Adv -> Adv ;             -- very quickly - очень быстро
  AdAdv = cc2 ;

  -- : Subj -> S -> Adv ;              -- when she sleeps - когда она спит
  SubjS = cc2 ;

  -- : CAdv -> AdN ;                  -- less (than five) - менее (пяти)
  AdnCAdv cadv = {s = cadv.s ++ cadv.p} ;
}