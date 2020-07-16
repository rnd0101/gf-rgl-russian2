concrete VerbRus of Verb = CatRus ** open ResRus, Prelude in {

lin
  -- : V   -> VP ;        -- sleep
  UseV v = {
    verb = v ;
    compl = \\_ => []
    } ;

  -- : V2 -> VP ;         -- be loved
  PassV2 v2 = {
    verb = passivate v2 ;
    compl = agree v2.c
  } ;

  -- TODO: ComplVV  : VV  -> VP -> VP ;  -- want to run
  -- TODO: ComplVS  : VS  -> S  -> VP ;  -- say that she runs
  -- TODO: ComplVQ  : VQ  -> QS -> VP ;  -- wonder who runs
  -- TODO: ComplVA  : VA  -> AP -> VP ;  -- they become red

  -- SlashV2a : V2 -> VPSlash ;  -- love (it)
  SlashV2a v = {verb=v ; compl=\\_ => [] ; c=v.c} ;

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

  -- TODO: UseComp  : Comp -> VP ;            -- be warm

  -- TODO: AdvVP    : VP -> Adv -> VP ;        -- sleep here
  -- TODO: ExtAdvVP : VP -> Adv -> VP ;        -- sleep , even though ...
  -- TODO: AdVVP    : AdV -> VP -> VP ;        -- always sleep

  -- TODO: AdvVPSlash : VPSlash -> Adv -> VPSlash ;  -- use (it) here
  -- TODO: AdVVPSlash : AdV -> VPSlash -> VPSlash ;  -- always use (it)

  -- TODO: VPSlashPrep : VP -> Prep -> VPSlash ;  -- live in (it)

  -- TODO: CompAP   : AP  -> Comp ;            -- (be) small
  -- TODO: CompNP   : NP  -> Comp ;            -- (be) the man
  -- TODO: CompAdv  : Adv -> Comp ;            -- (be) here
  -- TODO: CompCN   : CN  -> Comp ;            -- (be) a man/men

  -- TODO: UseCopula : VP ;                    -- be
}
