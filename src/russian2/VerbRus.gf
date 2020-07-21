concrete VerbRus of Verb = CatRus ** open ResRus, Prelude, Coordination in {

lin
  -- : V -> VP ;        -- sleep
  UseV v = {
    adv = \\a=>[] ;
    verb = v ;
    compl = \\_ => []
    } ;

  -- : V2 -> VP ;         -- be loved
  PassV2 v2 = {
    adv = \\a=>[] ;
    verb = passivate v2 ;
    compl = agree v2.c    -- TODO:
  } ;

  -- : VV -> VP -> VP ;  -- want to run
  ComplVV vv vp = vp ** {
    verb=concatVebForms vv.v vp.verb.inf ;
    adv=\\a=>vv.modal ! a ++ vp.adv ! a
    } ;

  -- : VS -> S -> VP ;  -- say that she runs
  ComplVS vs s = {
    verb = vs ;
    adv=\\a=>[] ;
    compl=\\A=>comma ++ "что" ++ s.s ! Ind
    } ;

  -- : VQ -> QS -> VP ;  -- wonder who runs
  ComplVQ vq qs = {
    verb = vq ;
    adv=\\a=>[] ;
    compl=\\A=>comma ++ "что" ++ qs.s ! QDir
    } ;


  -- : VA -> AP -> VP ;  -- they become red
  ComplVA va ap = {
    verb=va ;
    adv=\\a=>[] ;
    compl=case ap.preferShort of {
      PrefFull => (\\a => ap.s ! agrGenNum a ! Inanimate ! Ins) ;
      PrefShort => ap.short
      }
    } ;

  -- SlashV2a : V2 -> VPSlash ;  -- love (it)
  SlashV2a v = {adv=\\a=>[] ; verb=v ; compl=\\_ => [] ; c=v.c} ;

  -- : V3 -> NP -> VPSlash ;  -- give it (to her)
  Slash2V3 v3 np = {
    adv=\\a=>[] ;
    verb=v3 ;
    compl=\\a=> v3.c.s ++ np.s ! v3.c.c;
    c=v3.c2
    } ;

  -- : V3  -> NP -> VPSlash ;  -- give (it) to her
  Slash3V3 v3 np = {
    adv=\\a=>[] ;
    verb=v3 ;
    compl=\\a=> v3.c2.s ++ np.s ! v3.c2.c;
    c=v3.c
    } ;

  -- : V2V -> VP -> VPSlash ;  -- beg (her) to go
  SlashV2V v2v vp = vp ** {
    verb=concatVebForms v2v vp.verb.inf ;
    c=v2v.c
    } ;

  -- : V2S -> S  -> VPSlash ;  -- answer (to him) that it is good
  SlashV2S v2s s = {
    adv=\\a=>[] ;
    verb=v2s ;
    compl=\\a=> embedInCommas ("что" ++ s.s ! Ind) ;
    c=v2s.c
    } ;
  -- : V2Q -> QS -> VPSlash ;  -- ask (him) who came
  SlashV2Q v2q qs = {
    adv=\\a=>[] ;
    verb=v2q ;
    compl=\\a=>qs.s ! QDir;
    c=v2q.c
    } ;

  -- : V2A -> AP -> VPSlash ;  -- paint (it) red
  SlashV2A v2a ap = {
    adv=\\a=>[] ;
    verb=v2a ;
    compl=case ap.preferShort of {
      PrefFull => (\\a => ap.s ! agrGenNum a ! Inanimate ! v2a.c.c) ;   -- TODO: Check acc dep on animacy
      PrefShort => ap.short
      } ;
    c=v2a.c
    } ;

  -- : VPSlash -> NP -> VP ; -- love it
  ComplSlash vps np = vps ** {
    compl=\\a => vps.compl ! a ++ vps.c.s ++ np.s ! vps.c.c      -- hasPrep?
    } ;

  -- : VV -> VPSlash -> VPSlash ;       -- want to buy
  SlashVV vv vps = vps ** {
    verb=concatVebForms vv.v vps.verb.inf ;
    adv=\\a=>vv.modal ! a ++ vps.adv ! a
    } ;
  -- : V2V -> NP -> VPSlash -> VPSlash ; -- beg me to buy
  SlashV2VNP v2v np vps = vps ** {
    verb=concatVebForms v2v vps.verb.inf ;
    compl=\\a=>vps.compl ! a ++ vps.c.s ++ np.s ! vps.c.c;   -- hasPrep?
    c=v2v.c
    } ;

  -- : VPSlash -> VP ;         -- love himself
  ReflVP vps = vps ** {
    compl=\\a => vps.compl ! a ++ vps.c.s ++ sam.s ! vps.c.c
    } ;

  -- : Comp -> VP ;            -- be warm
  UseComp comp = {
    adv=\\a=>comp.adv ;
    compl=comp.s ;
    verb=selectCopula comp.cop
    } ;

  -- : VP -> Adv -> VP ;        -- sleep here
  AdvVP vp adv = vp ** {compl=\\a => vp.compl ! a ++ adv.s} ;

  -- TODO: ExtAdvVP : VP -> Adv -> VP ;        -- sleep , even though ...
  -- : AdV -> VP -> VP ;        -- always sleep
  AdVVP adv vp = vp ** {adv=\\a => adv.s ++ vp.adv ! a} ;

  -- : VPSlash -> Adv -> VPSlash ;  -- use (it) here
  AdvVPSlash vps adv = vps ** {compl=\\a => vps.compl ! a ++ adv.s} ;

  -- : AdV -> VPSlash -> VPSlash ;  -- always use (it)
  AdVVPSlash adv vps = vps ** {adv=\\a=>adv.s ++ vps.adv ! a} ;

  -- : VP -> Prep -> VPSlash ;  -- live in (it)
  VPSlashPrep vp prep = vp ** {c=prep} ;
  -- : AP -> Comp ;            -- (be) small
  CompAP ap = case ap.preferShort of {
    PrefFull => {s=\\a=>ap.s ! agrGenNum a ! Inanimate ! Ins ; adv=[] ; cop=InsCopula} ;
    PrefShort => {s=ap.short ; adv=[] ; cop=EllCopula}
    };

  -- : NP -> Comp ;            -- (be) the man
  CompNP np = {s=\\a=>np.s ! Ins ; adv=[] ; cop=InsCopula} ;

  -- : Adv -> Comp ;            -- (be) here
  CompAdv adv = {s=\\a=>[] ; adv=adv.s ; cop=NomCopula} ;
  -- : CN -> Comp ;             -- (be) a man/men
  CompCN cn = {s=\\a=>cn.s ! numGenNum (agrGenNum a) ! Ins ; adv=[] ; cop=InsCopula} ;

  -- : VP ;                     -- be
  UseCopula = {adv=\\a=>[] ; verb=copulaIns ; compl=\\a=>[]} ;
}
