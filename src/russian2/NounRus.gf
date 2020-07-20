concrete NounRus of Noun = CatRus ** open ResRus, ParamRus, Coordination, Prelude in {
flags coding=utf8 ; optimize=all ;

lin

---------------
-- Noun phrases

  -- : Det -> CN -> NP ;   -- the man
  DetCN det cn =
    let n = numSizeNumber det.size in {
      -- TODO: fix some cases in README
      s=\\cas => det.s ! cn.g ! cn.anim ! cas ++ sizeNumCase cn.s det.size ;
      a=Ag (gennum det.g n) P3
      } ;

  -- : PN -> NP ;          -- John
  UsePN pn = {s=\\cas => (nounFormsNoun pn).s ! Sg ! cas ; a=Ag (gennum pn.g Sg) P3} ;   -- Does NP need animacy?

  -- : Pron -> NP ;
  UsePron pron = lin NP (pronFormsPronoun pron) ;

  -- : Predet -> NP -> NP ; -- only the man
  PredetNP predet np = np ** {s=\\cas => predet.s ! (agrGenNum np.a) ! Inanimate ! cas ++ np.s ! cas} ;

  -- : NP -> V2  -> NP ;    -- the man seen
  PPartNP np v2 = np ** {
    s = \\cas => np.s ! cas ++ (shortPastPassPart v2 (agrGenNum np.a))
    } ;

  -- : NP -> Adv -> NP ;    -- Paris today
  AdvNP np adv = np ** {s=\\cas=>np.s ! cas ++ adv.s} ;

  -- TODO: ExtAdvNP: NP -> Adv -> NP ;    -- boys, such as ..
  -- TODO: RelNP   : NP -> RS  -> NP ;    -- Paris, which is here

  -- : Det -> NP ;        -- these five
  DetNP det = {
    s=\\c => det.s ! det.g ! Inanimate ! c ;
    a=Ag (gennum det.g (numSizeNumber det.size)) P3
    } ;

  -- : CN -> NP ;           -- (beer)
  MassNP cn = {
    s = \\c => cn.s ! Sg ! c ;   -- can it be plural-only? eg квасцы
    a = Ag (gennum cn.g Sg) P3
    } ;

  -- : N2 -> NP -> CN ;    -- mother of the king - мать короля
  ComplN2 n2 np = {
    s=\\n,cas=> (nounFormsNoun n2).s ! n ! cas ++ n2.c2.s ++ np.s ! n2.c2.c ; -- Number => Case => Str ;
    g=n2.g ;
    anim=n2.a
    } ;
  -- TODO: ComplN3 : N3 -> NP -> N2 ;    -- distance from this city (to Paris)

--------------
-- Determiners
  -- : Numeral -> Card  ;  -- fifty-one
  NumNumeral n = n ;
  -- : Card -> Num
  NumCard c = c ;
  -- : Digits -> Card ;  -- 51
  NumDigits n = {s = \\_,_,_ => n.s ; n = n.n ; size = n.size } ;

  -- : Quant -> Num -> Det ;  -- these five
  DetQuant quant num = {
    s=\\g,a,c => num.s ! g ! a ! c ++ quant.s ! (gennum g (numSizeNumber num.size)) ! a ! c ;
    g=quant.g ;
    c=quant.c ;
    size=num.size
    } ;

  -- TODO:  DetQuantOrd : Quant -> Num -> Ord -> Det ;  -- these five best

  -- : Num  -- mark as singular
  NumSg = {s = \\_,_,_ => [] ; size = Num1 } ;
  -- : Num  -- mark as plural
  NumPl = {s = \\_,_,_ => [] ; size = NumAll } ;

  -- : A -> Ord ;
  OrdSuperl a = long_superlative a ;

  -- : Pron -> Quant ;    -- my (house)
  PossPron pron = {s=mkPronTable pron.poss ; short=\\a=>[] ; g=Neut; c=Nom; preferShort=PrefFull} ;

  -- : AdN -> Card -> Card
  AdNum adn card = card ** {
    s=\\g,a,c => adn.s ++ card.s ! g ! a ! c
    } ;

---------------
-- Common nouns

  -- : AP -> CN -> CN ;   -- big house - большой дом
  AdjCN ap cn = cn ** {s = \\n,c => preOrPost (notB ap.isPost) (ap.s ! (gennum cn.g n) ! cn.anim ! c) (cn.s ! n ! c)} ;

  -- : N -> CN
  UseN n = nounFormsNoun n ;

  -- : N2 -> CN ;
  UseN2 n = nounFormsNoun n ;

  -- : N3 -> N2 ; -- distance (from this city)
  Use2N3 n3 = lin N2 n3 ** { compl1 = n3.compl2 } ;

  -- : N3 -> N2 ; -- distance (to Paris)
  Use3N3 n3 = lin N2 n3 ;

  -- : CN -> RS -> CN ;   -- house that John bought
  RelCN cn rs = cn ** {s = \\n,c => cn.s ! n ! c ++ embedInCommas (rs.s ! gennum cn.g n ! cn.anim ! c)} ;

  -- : CN -> SC -> CN ;   -- question where she sleeps
  SentCN cn sc = cn ** {s = \\n,c => cn.s ! n ! c ++ sc.s}; -- SC type will change???

  -- : CN -> Adv -> CN ;   -- house on the hill
  AdvCN cn adv = cn ** {s = \\n,c => cn.s ! n ! c ++ adv.s};

-------------
-- Apposition
  -- : CN -> NP -> CN ;    -- city Paris (, numbers x and y)
  ApposCN cn np = cn ** {s=\\n,cas => cn.s ! n ! cas ++ np.s ! cas} ;

--------------------------------------
-- Possessive and partitive constructs

  -- : CN -> NP -> CN ;     -- house of Paris, house of mine
  PossNP cn np = cn ** {
    s=\\n,cas => np.s ! Gen ++ cn.s ! n ! cas ;   -- TODO: possessive pronouns P1, P2
    } ;

  -- : CN -> NP -> CN ;     -- glass of wine - стакан чаю (чая)
  PartNP cn np = cn ** {
    s=\\n,cas => cn.s ! n ! cas ++ np.s ! Ptv ;   -- also Gen
    } ;

  -- : Det -> NP -> NP ;    -- three of them, some of the boys
  CountNP det np = {
    s=\\cas => det.s ! Neut ! Inanimate ! cas ++ selectCase np.s from2 ;
    a=np.a
    } ;

---------------------------------------------------
-- Conjoinable determiners and ones with adjectives

  -- TODO: AdjDAP : DAP -> AP -> DAP ;    -- the large (one)
  -- TODO: DetDAP : Det -> DAP ;          -- this (or that)

---------------------------------------------------
-- Backwards compatibility
  --  : Quant ;       -- the (house), the (houses)
  DefArt = {s = \\gn,anim,cas=>[] ; short=\\a=>[] ; c=Nom; g = Neut; size = Num1 ; preferShort=PrefFull};
  --  : Quant ;       -- a (house), (houses)
  IndefArt = {s = \\gn,anim,cas=>[] ; short=\\a=>[] ; c=Nom; g = Neut; size = Num1 ; preferShort=PrefFull};

}
