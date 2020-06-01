concrete NounRus of Noun = CatRus ** open ResRus, Prelude in {
flags coding=utf8 ; optimize=all ;

lin
  NumPl = {s = \\_,_ => [] ; size = Num2_4} ; ---- size
  NumSg = {s = \\_,_ => [] ; size = Num1} ;

  UsePron pron = {
    s = table {
      Nom | Voc => pron.nom ;
	    Gen | Ptv => pron.gen ;
      Dat | Loc => pron.dat ;
      Acc => pron.acc ;
      Ins => pron.ins
      Prep => pron.prep
    } ;
    a = pron.a ;
  } ;

  UseN n = nounFormsNoun n ;
}

nom, gen, dat, acc, ins, prep, loc, ptv, voc