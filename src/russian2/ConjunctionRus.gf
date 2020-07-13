--# -path=.:../abstract:../common:../../prelude

concrete ConjunctionRus of Conjunction =
  CatRus ** open ResRus, Coordination, Prelude in {

  flags optimize=all_subs ;  coding=utf8 ;

  lincat
    [Adv] = {s1,s2 : Str} ;
    [AP] = {s1,s2 : GenNum => Animacy => Case => Str ; isPost : Bool; preferShort : ShortFormPreference} ;
    [NP] = {s1,s2  : Case => Str ;
           -- prep1,prep2 : Case => Str ;
           a : Agr} ;
    [S] = {s1,s2 : Mood => Str} ;
    [RS] = {s1,s2 : Mood => Agr => Str ; c : Case} ;

  lin
    -- : Adv -> Adv -> ListAdv ;     -- here, there
    BaseAdv = twoSS ;

    -- : Adv -> ListAdv -> ListAdv ; -- here, there, everywhere
    ConsAdv = consrSS comma ;

    -- : AP -> AP -> ListAP ;       -- red, white
    BaseAP x y = twoTable3 GenNum Animacy Case x y
                 ** {isPost = orB x.isPost y.isPost;
                     preferShort = selectAPForm x.preferShort y.preferShort} ;

    -- ConsAP : AP -> ListAP -> ListAP ;   -- red, white, blue
    ConsAP x xs = consrTable3 GenNum Animacy Case comma x xs
                  ** {isPost = orB x.isPost xs.isPost ;
                      preferShort = selectAPForm x.preferShort xs.preferShort} ;

    -- : S -> S -> ListS ;      -- John walks, Mary runs
    BaseS = twoTable Mood ;

    -- : S -> ListS -> ListS ;  -- John walks, Mary runs, Bill swims
    ConsS = consrTable Mood comma ;

    -- : RS -> RS -> ListRS ;       -- who walks, whom I know
    BaseRS x y = twoTable2 Mood Agr x y ** {c = y.c} ;

    -- : RS -> ListRS -> ListRS ;   -- who walks, whom I know, who is here
    ConsRS xs x = consrTable2 Mood Agr comma xs x ** {c = xs.c} ;

    ConjAdv = conjunctDistrSS ;

    -- : Conj -> ListAP -> AP ;     -- cold and warm
    ConjAP conj xs = conjunctDistrTable3 GenNum Animacy Case conj xs
                       ** {isPost = xs.isPost; preferShort = xs.preferShort} ;

    ConjS conj ss = conjunctDistrTable Mood conj ss ;

    -- : Conj -> ListRS -> RS ;     -- who walks and whose mother runs
    ConjRS conj ss = conjunctDistrTable2 Mood Agr conj ss ** {
      c = ss.c
      } ;

    -- : NP -> NP -> ListNP ;      -- John, Mary
    BaseNP x y = {
      s1 = x.s ;
      s2 = y.s ;
    --  prep1 = x.prep ;
    --  prep2 = y.prep ;
      a = y.a
    } ;

    -- : NP -> ListNP -> ListNP ;  -- John, Mary, Bill
    ConsNP x xs = {
      s1 = \\c => x.s ! c ++ comma ++ xs.s1 ! c ;
      s2 = xs.s2 ;
      --prep1 = \\c => x.prep ! c ++ comma ++ xs.prep1 ! c ;
      --prep2 = xs.prep2 ;
      a = conjAgr x.a xs.a ;
      anim = conjAnim x.anim xs.anim
    } ;

    -- : Conj -> ListNP -> NP ;     -- she or we
    ConjNP conj xs = {
      s = \\c => conj.s1 ++ xs.s1 ! c ++ conj.s2 ++ xs.s2 ! c ;
      --prep = \\c => conj.s1 ++ xs.prep1 ! c ++ conj.s2 ++ xs.prep2 ! c ;
      a = xs.a ; -- TODO: dep. on conj as well?
      anim = xs.anim
    } ;

  oper
    conjGender : Gender -> Gender -> Gender = \_,m -> m ;
    conjAnim : Animacy -> Animacy -> Animacy = \m,n -> case <m,n> of {
      <Inanimate,Inanimate> => Inanimate ;
      _ => Animate
    } ;
    conjNumber : Number -> Number -> Number = \m,n -> case <m,n> of {
      <Sg,Sg> => Sg ;
      _ => Pl
    } ;
    conjGenNum : GenNum -> GenNum -> GenNum = \m,n -> case <m,n> of {
      <GSg Fem,GSg Fem> => FSg ;
      <GSg Masc,GSg Masc> => MSg ;
      <GSg Neut,GSg Neut> => NSg ;
      <GSg _,GSg _> => GPl;  -- TODO: Is this true for animate only or in general?
      _ => GPl
    } ;
    conjAgr : Agr -> Agr -> Agr
      = \a1,a2 ->
        let a1rec = case a1 of {Ag gn p => {gn=gn; p=p} } in
        let a2rec = case a2 of {Ag gn p => {gn=gn; p=p} } in
        Ag (conjGenNum a1rec.gn a2rec.gn) (conjPerson a1rec.p a2rec.p);
    selectAPForm : ShortFormPreference -> ShortFormPreference -> ShortFormPreference
      = \sfp1,sfp2 ->
      case <sfp1,sfp2> of {
        <PrefShort, PrefShort> => PrefShort ;
        _ => PrefFull
        } ;
}
