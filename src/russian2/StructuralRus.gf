concrete StructuralRus of Structural = CatRus **
  open ParadigmsRus, ResRus, Prelude in {

lin
    i_Pron = personalPron (Ag Masc Sg P1) ;
    we_Pron = personalPron (Ag Masc Pl P1) ;
    youSg_Pron = personalPron (Ag Masc Sg P2) ;
    youPl_Pron = personalPron (Ag Masc Pl P2) ;
    youPol_Pron = youPl_Pron ;
    he_Pron = personalPron (Ag Masc Sg P3) ;
    she_Pron = personalPron (Ag Fem Sg P3) ;
    it_Pron = personalPron (Ag Neut Sg P3) ;
    they_Pron = personalPron (Ag Masc Pl P3) ;

    to_Prep = {s="к" ; c = Dat ; hasPrep=True} ;
    from_Prep = {s="от" ; c = Gen ; hasPrep=True} ;

    every_Det = {
      s = (adjFormsAdjective (guessAdjectiveForms "каждый")).s ! Sg;
--      n = Sg ;
--      g = PNoGen ;
--      c = Nom ;
      size = Num1 ;
    } ;
}
