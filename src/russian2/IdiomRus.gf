--# -path=.:../abstract:../common:../../prelude

concrete IdiomRus of Idiom = CatRus ** open Prelude, TenseRus, ResRus, MorphoRus in {
flags optimize=all_subs ;  coding=utf8 ;

lin
  -- : VP -> Cl ;        -- it is hot
  ImpersCl vp = let a = Ag (GSg Neut) P3 in {subj="" ; compl=vp.compl ! a ; verb=vp.verb ; adv=vp.adv ! a ; a=a } ;

  -- : VP -> Cl ;        -- one sleeps
  GenericCl vp = let a = Ag (GSg Masc) P2 in  {subj="ты" ; compl=vp.compl ! a; verb=vp.verb ; adv=vp.adv ! a; a=a} ;

  -- TODO: CleftNP   : NP  -> RS -> Cl ; -- it is I who did it
  -- TODO: CleftAdv  : Adv -> S  -> Cl ; -- it is here she slept

  -- : NP -> Cl ;        -- there is a house
  ExistNP np = {subj=np.s ! Nom ; compl="" ; verb=to_exist ; adv=[] ; a=np.a} ;  -- TODO: Different order!

  -- TODO: ExistIP   : IP -> QCl ;       -- which houses are there
  -- TODO: ExistNPAdv : NP -> Adv -> Cl ;    -- there is a house in Paris
  -- TODO: ExistIPAdv : IP -> Adv -> QCl ;   -- which houses are there in Paris
  -- TODO: ProgrVP   : VP -> VP ;        -- be sleeping
  -- TODO: ImpPl1    : VP -> Utt ;       -- let's go
  -- : NP -> VP -> Utt ; -- let John walk
  ImpP3 np vp =
    let a = Ag (GSg Neut) P3 in
    let pol = PPos in
    let parts = verbAgr vp.verb Ind Pres a pol.p in
    let p1 = "пусть" in {
      s = p1 ++ pol.s ++ vp.adv ! a ++ np.s ! Nom ++ parts.p2 ++ vp.compl ! a
      } ;

  -- TODO: SelfAdvVP : VP -> VP ;        -- is at home himself
  -- TODO: SelfAdVVP : VP -> VP ;        -- is himself at home
  -- TODO: SelfNP    : NP -> NP ;        -- the president himself (is at home)
}
