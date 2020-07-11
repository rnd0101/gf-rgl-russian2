concrete NounRus of Noun = CatRus ** open ResRus, Prelude in {
flags coding=utf8 ; optimize=all ;

lin
  NumSg = {s = \\_,_,_ => [] ; size = Num1 } ;
  NumPl = {s = \\_,_,_ => [] ; size = NumAll } ;

  -- : AP -> CN  -> CN ;   -- big house - большой дом
  AdjCN ap cn = {
    s = \\n,c => preOrPost (notB ap.isPost) (ap.s ! n ! cn.g ! cn.a ! c) (cn.s ! n ! c) ;
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

}
