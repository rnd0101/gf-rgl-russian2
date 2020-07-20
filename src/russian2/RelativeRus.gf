concrete RelativeRus of Relative = CatRus ** open
  ParadigmsRus,
  ResRus,
  Prelude in {

lin
  -- TODO: RelCl    : Cl -> RCl ;            -- such that John loves her
  -- : RP -> ClSlash -> RCl ; -- whom John loves
  RelSlash rp cls = let rp_as_adj = rp.poss ** {preferShort=PrefFull;  sf,sm,sn,sp,comp = []} in {
    subj=(adjFormsAdjective rp_as_adj).s ;
    adv=\\a=>cls.adv ;  -- TODO: this should be after subj in this case
    verb=cls.verb ;
    compl=\\a=>cls.compl ;
    a=cls.a
    } ;

  -- RelVP : RP -> VP -> RCl ;      -- who loves John
  RelVP rp vp =
    let rp_as_adj = rp.poss ** {preferShort=PrefFull;  sf,sm,sn,sp,comp = []} in {
    subj=(adjFormsAdjective rp_as_adj).s ;
    adv=\\a=>[] ;
    verb=vp.verb ;
    compl=vp.compl ;
    a=rp.a
    } ;

  -- : RP ;                      -- which
  IdRP = lin RP (doKotoryjPron "который" (Ag (GSg Neut) P3) Inanimate) ;

  -- Prep -> NP -> RP -> RP ;  -- the mother of whom
  FunRP prep np rp = (prependIP (np.s ! Nom ++ prep.s) rp) ;   -- TODO: This is wrong... RP should be in agreement, but with records it's a bit hard...

}
