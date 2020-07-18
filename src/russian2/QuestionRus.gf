--# -path=.:../abstract:../common:../../prelude

concrete QuestionRus of Question = CatRus ** open ResRus, Prelude in {
flags optimize=all_subs ; coding=utf8 ;

lin
  -- : Cl -> QCl ;            -- does John walk
  QuestCl cl = cl ** {qf=QDir} ;

  -- : IP -> VP -> QCl ;      -- who walks
  QuestVP ip vp = {
    subj=ip.nom ;
    adv=[] ;
    verb=vp.verb ;
    compl=vp.compl ! ip.a ;
    a=ip.a
    } ;

  -- : IP -> ClSlash -> QCl ; -- whom does John love
  QuestSlash ip cls = cls ** {
    subj=cls.c.s ++ selectPronCase ip cls.c.c ++ cls.subj ;   -- cls.subj ???
    a=ip.a
    } ;

  -- : IAdv -> Cl -> QCl ;    -- why does John walk
  QuestIAdv iadv cl = cl ** {
    subj=iadv.s ++ cl.subj
    } ;

  -- : IComp -> NP -> QCl ;   -- where is John
  QuestIComp icomp np = {
    subj=icomp.s ! Ag (GSg Neut) P3 ;  --???
    compl=np.s ! Nom ;  --???
    adv=icomp.adv ;
    verb=selectCopula icomp.cop ;
    a=np.a
    } ;

  -- : Prep -> IP -> IAdv ;  -- with whom
  PrepIP prep ip = {s = prep.s ++ ip.nom} ;

  -- : IP -> Adv -> IP
  AdvIP ip adv = prependIP adv.s ip ** {a=ip.a} ;

  -- : IAdv -> Adv -> IAdv ;    -- where in Paris
  AdvIAdv = cc2 ;

  -- CompIAdv  : IAdv -> IComp ;          -- where (is it)

  -- : IP -> IComp ;          -- who (is it)
  CompIP ip = {
    s=\\a=>ip.nom ;   -- ???
    adv=[] ;
    cop=EllCopula   -- ???
  } ;

  -- : IDet -> CN -> IP ;       -- which five songs
  -- Hmmm. size should influence case later, but it's lost here?!
  IdetCN idet cn = caseTableToRecord (\\cas => idet.s ! cn.g ! cn.anim ! cas ++ cn.s ! numSizeNumber idet.size ! cas)
    (Ag (gennum idet.g (numSizeNumber idet.size)) P3) cn.anim ;

  -- : IDet -> IP ;       -- which five
  IdetIP idet = caseTableToRecord (\\cas => idet.s ! idet.g ! Inanimate ! cas)
    (Ag (gennum idet.g (numSizeNumber idet.size)) P3) Inanimate ;

  -- : IQuant -> Num -> IDet ;  -- which (five)
  IdetQuant iq num = {
    s=\\n,a,cas => iq.s ! numSizeNumber num.size ! a ! cas ++ num.s ! iq.g ! a ! cas ;
    size=num.size ;
    g=iq.g ;
    c=iq.c
    } ;

}
