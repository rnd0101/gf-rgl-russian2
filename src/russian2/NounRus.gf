concrete NounRus of Noun = CatRus ** open ResRus, Prelude in {
flags coding=utf8 ; optimize=all ;

lin
  NumSg = {s = \\_,_,_ => [] ; size = Num1 } ;
  NumPl = {s = \\_,_,_ => [] ; size = NumAll } ;

  -- : AP -> CN  -> CN ;   -- big house - большой дом
  AdjCN ap cn = {
    s = \\n,c => preOrPost (notB ap.isPost) (ap.s ! (gennum cn.g n) ! cn.a ! c) (cn.s ! n ! c) ;
    g = cn.g ;
    a = cn.a
    } ;

  -- : N -> CN
  UseN n = nounFormsNoun n ;

  -- : N2 -> CN ;
  UseN2 n = nounFormsNoun n ;

  -- : N3 -> N2 ; -- distance (from this city)
  Use2N3 n3 = lin N2 n3 ** { compl1 = n3.compl2 } ;

  -- : N3 -> N2 ; -- distance (to Paris)
  Use3N3 n3 = lin N2 n3 ;

  -- : A -> Ord ;
  OrdSuperl a = long_superlative a ;

  -- : Pron -> NP ;
  UsePron pron = lin NP (pronFormsPronoun pron) ;

  -- : CN -> RS -> CN ;   -- house that John bought
  RelCN cn rs = {
    s = \\n,c => cn.s ! n ! c ++ rs.s ! Ind ! Ag (gennum cn.g n) P3 ; -- RS case ignored???
    g = cn.g ;
    a = cn.a
    } ;

  -- : CN -> SC -> CN ;   -- question where she sleeps
  SentCN cn sc = {
    s = \\n,c => cn.s ! n ! c ++ sc.s ; -- SC type will change???
    g = cn.g ;
    a = cn.a
    } ;

  -- : CN -> Adv -> CN ;   -- house on the hill
  AdvCN cn adv = {
    s = \\n,c => cn.s ! n ! c ++ adv.s ;
    g = cn.g ;
    a = cn.a
    } ;

  -- : CN -> NP ;           -- (beer)
  MassNP cn = {
    s = \\c => cn.s ! Sg ! c ;   -- can it be plural-only? eg квасцы
    a = Ag (gennum cn.g Sg) P3
    } ;

  -- : Pron -> Quant ;    -- my (house)
  PossPron pron = {
    s=mkPronTable pron.poss ;
    preferShort=PrefFull
    } ;
}
