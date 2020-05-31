--# -path=.:../abstract:../common:../../prelude

concrete CatRus of Cat = CommonX ** open ResRus, Prelude in {
flags coding=utf8 ; optimize=all ;

-- Numeral

  lincat
    Num, Numeral, Card, Digits = Determiner ;
    Ord =  {s : AdjForms => Str} ;
}
