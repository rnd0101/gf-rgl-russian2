resource MorphoRus = ResRus ** open Prelude in {
flags coding=utf8 ;
oper
  to_exist = guessVerbForms "существовать" ;
  everybody = pronFormsPronoun vse ;
  everything = pronFormsPronoun vse_ina ;
  what_sg = doChPron "ч" (Ag (GSg Neut) P3) Inanimate ;
  what_pl = doChPron "ч" (Ag GPl P3) Inanimate ;
  something = pronFormsPronoun (appendToIP what_sg (BIND ++ "-то"));
  who_sg = doKPron "к" (Ag (GSg Masc) P3) Animate ;
  who_pl = doKPron "к" (Ag GPl P3) Animate ;
  someone = pronFormsPronoun (appendToIP who_sg (BIND ++ "-то")) ;
}
