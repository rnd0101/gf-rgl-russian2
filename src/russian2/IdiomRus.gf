--# -path=.:../abstract:../common:../../prelude

concrete IdiomRus of Idiom = CatRus ** open Prelude, TenseRus, ResRus, Coordination, MorphoRus in {
flags optimize=all_subs ;  coding=utf8 ;

lin
  -- : VP -> Cl ;        -- it is hot
  ImpersCl vp = let a = Ag (GSg Neut) P3 in {subj="" ; compl=vp.compl ! a ; verb=vp.verb ; adv=vp.adv ! a ; a=a } ;

  -- : VP -> Cl ;        -- one sleeps
  GenericCl vp = let a = Ag (GSg Masc) P2 in  {subj="ты" ; compl=vp.compl ! a; verb=vp.verb ; adv=vp.adv ! a; a=a} ;

  -- : NP -> RS -> Cl ; -- it is I who did it
  CleftNP np rs = {
    subj=np.s ! Nom ;
    adv="это" ;
    verb=nullVerb ;   -- ???
    compl=embedInCommas (rs.s ! agrGenNum np.a ! Animate ! Nom) ;  -- TODO: here or in subj???
    a=np.a
    } ;
  -- : Adv -> S -> Cl ; -- it is here she slept
  CleftAdv adv s = {
    subj="это" ++ adv.s ++ comma ++ s.s ! Ind ;  -- TODO: Check what is expressed by this? Why comma?
    adv=[] ;
    verb=nullVerb ;   -- ???
    compl=[] ;
    a=Ag (GSg Neut) P3
    } ;

  -- : NP -> Cl ;        -- there is a house
  ExistNP np = {subj=np.s ! Nom ; compl="" ; verb=to_exist ; adv=[] ; a=np.a} ;  -- TODO: Different order!

  -- : IP -> QCl ;       -- which houses are there
  ExistIP ip = {
    subj=ip.nom ; -- gen?
    adv=[] ;
    verb=to_exist;
    compl=[];
    a=ip.a
    } ;
  -- TODO: ExistNPAdv : NP -> Adv -> Cl ;    -- there is a house in Paris
  -- TODO: ExistIPAdv : IP -> Adv -> QCl ;   -- which houses are there in Paris
  -- : VP -> VP ;        -- be sleeping
  ProgrVP vp = vp ;
  -- : VP -> Utt ;       -- let's go
  ImpPl1 vp =
    let a = Ag GPl P1 in
    let pol = PPos in
    let parts = verbAgr vp.verb Infinitive Pres a pol.p in
    let p1 = "давайте" in {
      s = p1 ++ pol.s ++ vp.adv ! a ++ parts.p2 ++ vp.compl ! a
      } ;
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
