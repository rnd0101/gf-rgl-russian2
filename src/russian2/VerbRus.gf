concrete VerbRus of Verb = CatRus ** open ResRus, Prelude in {

lin
  -- : V -> VP ;        -- sleep
  UseV v = {
    adv = [] ;
    verb = v ;
    compl = \\_ => []
    } ;

  -- : V2 -> VP ;         -- be loved
  PassV2 v2 = {
    adv = [] ;
    verb = passivate v2 ;
    compl = agree v2.c    -- TODO:
  } ;

  -- TODO: ComplVV  : VV  -> VP -> VP ;  -- want to run
  -- TODO: ComplVS  : VS  -> S  -> VP ;  -- say that she runs
  -- TODO: ComplVQ  : VQ  -> QS -> VP ;  -- wonder who runs
  -- TODO: ComplVA  : VA  -> AP -> VP ;  -- they become red

  -- SlashV2a : V2 -> VPSlash ;  -- love (it)
  SlashV2a v = {adv=[] ; verb=v ; compl=\\_ => [] ; c=v.c} ;

  -- TODO: Slash2V3 : V3  -> NP -> VPSlash ;  -- give it (to her)
  -- TODO: Slash3V3 : V3  -> NP -> VPSlash ;  -- give (it) to her

  -- TODO: SlashV2V : V2V -> VP -> VPSlash ;  -- beg (her) to go
  -- TODO: SlashV2S : V2S -> S  -> VPSlash ;  -- answer (to him) that it is good
  -- TODO: SlashV2Q : V2Q -> QS -> VPSlash ;  -- ask (him) who came
  -- TODO: SlashV2A : V2A -> AP -> VPSlash ;  -- paint (it) red

  -- TODO: ComplSlash : VPSlash -> NP -> VP ; -- love it
  ComplSlash vps np = vps ** {
    compl=\\a => vps.compl ! a ++ vps.c.s ++ np.s ! vps.c.c      -- hasPrep ignored?!
    } ;

  -- TODO: SlashVV    : VV  -> VPSlash -> VPSlash ;       -- want to buy
  -- TODO: SlashV2VNP : V2V -> NP -> VPSlash -> VPSlash ; -- beg me to buy

  -- TODO: ReflVP   : VPSlash -> VP ;         -- love himself
  ReflVP vps = vps ** {
    compl=\\a => vps.compl ! a ++ vps.c.s ++ sam.s ! vps.c.c
    } ;

  -- : Comp -> VP ;            -- be warm
  UseComp comp = {
    adv=comp.adv ;
    compl=comp.s ;
    verb=copula
    } ;

  -- : VP -> Adv -> VP ;        -- sleep here
  AdvVP vp adv = vp ** {compl=\\a => vp.compl ! a ++ adv.s} ;

  -- TODO: ExtAdvVP : VP -> Adv -> VP ;        -- sleep , even though ...
  -- : AdV -> VP -> VP ;        -- always sleep
  AdVVP adv vp = vp ** {adv=adv.s ++ vp.adv} ;

  -- TODO: AdvVPSlash : VPSlash -> Adv -> VPSlash ;  -- use (it) here
  -- TODO: AdVVPSlash : AdV -> VPSlash -> VPSlash ;  -- always use (it)

  -- TODO: VPSlashPrep : VP -> Prep -> VPSlash ;  -- live in (it)

  -- TODO: CompAP   : AP  -> Comp ;            -- (be) small
  -- TODO: CompNP   : NP  -> Comp ;            -- (be) the man
  CompNP np = {s=\\a=>np.s ! Ins ; adv=[]} ;

  -- : Adv -> Comp ;            -- (be) here
  CompAdv adv = {s=\\a=>[] ; adv=adv.s} ;
  -- TODO: CompCN   : CN  -> Comp ;            -- (be) a man/men

  -- TODO: UseCopula : VP ;                    -- be
}
