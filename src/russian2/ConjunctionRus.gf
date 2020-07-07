--# -path=.:../abstract:../common:../../prelude

concrete ConjunctionRus of Conjunction =
  CatRus ** open ResRus, Coordination, Prelude in {

  flags optimize=all_subs ;  coding=utf8 ;

  lincat
    [Adv] = {s1,s2 : Str} ;
    [AP] = {s1,s2 : Number => Gender => Animacy => Case => Str ; isPost : Bool} ;
    [NP] = {s1,s2,prep1,prep2 : Case => Str ; a : Agr} ;
    [S] = {s1,s2 : Str} ;
    [RS] = {s1,s2 : Agr => Str} ;

  lin
    -- : Adv -> Adv -> ListAdv ;     -- here, there
    BaseAdv = twoSS ;

    -- : Adv -> ListAdv -> ListAdv ; -- here, there, everywhere
    ConsAdv = consrSS comma ;

    -- : AP -> AP -> ListAP ;       -- red, white
    BaseAP x y = twoTable4 Number Gender Animacy Case x y
                  ** {isPost = orB x.isPost y.isPost} ;

    -- ConsAP : AP -> ListAP -> ListAP ;   -- red, white, blue
    ConsAP x xs = consrTable4 Number Gender Animacy Case comma x xs
                  ** {isPost = orB x.isPost xs.isPost} ;

    -- : S -> S -> ListS ;      -- John walks, Mary runs
    BaseS = twoSS ;

    -- : S -> ListS -> ListS ;  -- John walks, Mary runs, Bill swims
    ConsS = consrSS comma ;

    -- : RS -> RS -> ListRS ;       -- who walks, whom I know
    BaseRS = twoTable Agr ;

    -- : RS -> ListRS -> ListRS ;   -- who wals, whom I know, who is here
    ConsRS = consrTable Agr comma ;

    ConjAdv = conjunctDistrSS ;

    ConjAP conj xs = conjunctDistrTable4 Number Gender Animacy Case conj xs
                       ** {isPost = xs.isPost} ;

    ConjS = conjunctDistrSS ;
    ConjRS = conjunctDistrTable Agr ;

    -- : NP -> NP -> ListNP ;      -- John, Mary
    BaseNP x y = {
      s1 = x.s ;
      s2 = y.s ;
      prep1 = x.prep ;
      prep2 = y.prep ;
      a = y.a
    } ;

    -- : NP -> ListNP -> ListNP ;  -- John, Mary, Bill
    ConsNP x xs = {
      s1 = \\c => x.s ! c ++ comma ++ xs.s1 ! c ;
      s2 = xs.s2 ;
      prep1 = \\c => x.prep ! c ++ comma ++ xs.prep1 ! c ;
      prep2 = xs.prep2 ;
      a = conjAgr x.a xs.a ;
      anim = conjAnim x.anim xs.anim
    } ;

    -- : Conj -> ListNP -> NP ;     -- she or we
    ConjNP conj xs = {
      s = \\c => conj.s1 ++ xs.s1 ! c ++ conj.s2 ++ xs.s2 ! c ;
      prep = \\c => conj.s1 ++ xs.prep1 ! c ++ conj.s2 ++ xs.prep2 ! c ;
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
    conjPerson : Person -> Person -> Person = \_,p -> p ;
    conjAgr : Agr -> Agr -> Agr
      = \a1,a2 ->
        let a1rec = case a1 of {Ag g n p => {g=g; n=n; p=p} } in
        let a2rec = case a2 of {Ag g n p => {g=g; n=n; p=p} } in
        Ag (conjGender a1rec.g a2rec.g) (conjNumber a1rec.n a2rec.n) (conjPerson a1rec.p a2rec.p);

}

