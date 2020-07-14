concrete NounRus of Noun = CatRus ** open ResRus, ParamRus, Prelude in {
flags coding=utf8 ; optimize=all ;

lin
  NumSg = {s = \\_,_,_ => [] ; size = Num1 } ;
  NumPl = {s = \\_,_,_ => [] ; size = NumAll } ;

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

  -- : A -> Ord ;
  OrdSuperl a = long_superlative a ;

  -- : Pron -> NP ;
  UsePron pron = lin NP (pronFormsPronoun pron) ;

  -- : CN -> RS -> CN ;   -- house that John bought
  RelCN cn rs = cn ** {s = \\n,c => cn.s ! n ! c ++ rs.s ! Ind ! Ag (gennum cn.g n) P3}; -- RS case ignored???

  -- : CN -> SC -> CN ;   -- question where she sleeps
  SentCN cn sc = cn ** {s = \\n,c => cn.s ! n ! c ++ sc.s}; -- SC type will change???

  -- : CN -> Adv -> CN ;   -- house on the hill
  AdvCN cn adv = cn ** {s = \\n,c => cn.s ! n ! c ++ adv.s};

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

  -- : Det -> NP ;        -- these five
  DetNP det = {
    s=\\c => det.s ! det.g ! Inanimate ! c ;
    a=Ag (gennum det.g (numSizeNumber det.size)) P3
    } ;

  -- : Det -> CN -> NP ;   -- the man
  DetCN det cn =
    let n = numSizeNumber det.size in {
      s=\\cas => det.s ! cn.g ! cn.anim ! cas ++ cn.s ! n ! cas ;
      a=Ag (gennum det.g n) P3
      } ;

}
