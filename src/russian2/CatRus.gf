--# -path=.:../abstract:../common:../../prelude

concrete CatRus of Cat = CommonX ** open ResRus, Prelude in {
flags coding=utf8 ; optimize=all ;

  lincat
    Num, Numeral, Card, Digits = Determiner ;
    Ord =  {s : AdjForms => Str} ;

    N = ResRus.NounForms ;
    A = ResRus.AdjForms ;
    CN = ResRus.Noun ;
    Pron = ResRus.PronForms ;

  linref
    N = \s -> s.snom ;
    A = \s -> s.msnom ;

}
