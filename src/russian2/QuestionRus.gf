--# -path=.:../abstract:../common:../../prelude

concrete QuestionRus of Question = CatRus ** open ResRus, Prelude in {
flags optimize=all_subs ; coding=utf8 ;

lin
  -- : Cl -> QCl ;            -- does John walk
  QuestCl cl = cl ** {qf=QDir} ;

{-
  -- : IP -> VP -> QCl ;      -- who walks
  QuestVP ip vp = notYet "" ;
  -- {s = \\b,clf,qf  => (predVerbPhrase kto spit).s!b!clf  } ;

  -- : IP -> ClSlash -> QCl ; -- whom does John love
  QuestSlash Kto yaGovoruO = notYet "" ;
--    let {  kom = Kto.s ! (mkPronForm yaGovoruO.c No NonPoss) ; o = yaGovoruO.s2 } in
--    {s =  \\b,clf,_ => o ++ kom ++ yaGovoruO.s ! b ! clf
--    } ;

  -- : IAdv -> Cl -> QCl ;    -- why does John walk
  QuestIAdv kak tuPozhivaesh = notYet "" ;
--    {s = \\b,clf,q => kak.s ++ tuPozhivaesh.s!b!clf } ;

  -- : IComp -> NP -> QCl ;   -- where is John
  QuestIComp kak tuPozhivaesh = notYet "" ;
--    {s = \\b,clf,q => let ne = case b of {Neg => ""; Pos => []}
--     in
--     kak.s ++ ne ++tuPozhivaesh.s! PF Nom No NonPoss } ;

-}

{-
    QuestSlash
    QuestIAdv
    QuestIComp


    PrepIP p ip = {s = p.s ++ ip.s ! PF Nom No NonPoss} ;

    AdvIP ip adv = {
      s = \\c => ip.s ! c ++ adv.s ;
       n = ip.n; p=ip.p; g=ip.g; anim=ip.anim; pron=ip.pron
      } ;

    IdetCN kakoj okhotnik =
    {s = \\pf => case kakoj.c of {
       Nom =>
        kakoj.s ! AF (extCase pf) okhotnik.anim (gennum okhotnik.g kakoj.n) ++
         okhotnik.nounpart ! NF kakoj.n (extCase pf) nom ++ okhotnik.relcl ! kakoj.n ! extCase pf ;
       _ =>
        kakoj.s ! AF (extCase pf) okhotnik.anim (gennum okhotnik.g kakoj.n) ++
        okhotnik.nounpart ! NF kakoj.n kakoj.c plg } ++ okhotnik.relcl ! kakoj.n ! kakoj.c ;
     n = kakoj.n ;
     p = P3 ;
     pron = False;
     g = kakoj.g ;
     anim = okhotnik.anim
    } ;

-- 1.4 additions 17/6/2008 by AR

    IdetIP kakoj = let anim = Inanimate in
    {s = \\pf => kakoj.s ! AF (extCase pf) anim (pgNum kakoj.g kakoj.n) ;
     n = kakoj.n ;
     p = P3 ;
     pron = False;
     g = kakoj.g ;
     anim = anim
    } ;

    IdetQuant kakoj pyat = -- okhotnik =
    {s = \\af =>
           kakoj.s ! pyat.n ! af ++
           pyat.s ! genAF af ! animAF af ! caseAF af ;
     n = pyat.n ;
     g = kakoj.g ;
     c = kakoj.c
    } ;

    AdvIAdv i a = {s = i.s ++ a.s} ;

    CompIAdv a = a ;
    CompIP ip = {s = ip.s ! PF Nom No NonPoss} ;
-}

}
