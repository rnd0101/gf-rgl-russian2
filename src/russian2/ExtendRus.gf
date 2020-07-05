--# -path=.:../common:../abstract

concrete ExtendRus of Extend =
  CatRus ** ExtendFunctor - [iFem_Pron,youFem_Pron]
  with (Grammar=GrammarRus)
  ** open Prelude, ResRus in {

  lin
    iFem_Pron = personalPron (Ag Fem Sg P1) ;
    youFem_Pron = personalPron (Ag Fem Sg P2) ;
 } ;
