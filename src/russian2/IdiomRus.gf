--# -path=.:../abstract:../common:../../prelude

concrete IdiomRus of Idiom = CatRus ** open Prelude, ResRus, MorphoRus in {
flags optimize=all_subs ;  coding=utf8 ;

lin
  -- : VP -> Cl ;        -- it is hot
  ImpersCl vp = {subj="" ; compl="" ; verb=vp.verb ; a=Ag (GSg Neut) P3 } ;

  -- TODO: GenericCl : VP -> Cl ;        -- one sleeps
  -- TODO: CleftNP   : NP  -> RS -> Cl ; -- it is I who did it
  -- TODO: CleftAdv  : Adv -> S  -> Cl ; -- it is here she slept

  -- : NP -> Cl ;        -- there is a house
  ExistNP np = {subj=np.s ! Nom ; compl="" ; verb=to_exist ; a=np.a} ;

  -- TODO: ExistIP   : IP -> QCl ;       -- which houses are there
  -- TODO: ExistNPAdv : NP -> Adv -> Cl ;    -- there is a house in Paris
  -- TODO: ExistIPAdv : IP -> Adv -> QCl ;   -- which houses are there in Paris
  -- TODO: ProgrVP   : VP -> VP ;        -- be sleeping
  -- TODO: ImpPl1    : VP -> Utt ;       -- let's go
  -- TODO: ImpP3     : NP -> VP -> Utt ; -- let John walk
  -- TODO: SelfAdvVP : VP -> VP ;        -- is at home himself
  -- TODO: SelfAdVVP : VP -> VP ;        -- is himself at home
  -- TODO: SelfNP    : NP -> NP ;        -- the president himself (is at home)
}
