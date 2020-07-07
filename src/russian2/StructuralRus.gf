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
--  n = Sg ; g = PNoGen ; c = Nom ;
    size = Num1 ;
  } ;
  someSg_Det   = {
    s = (adjFormsAdjective (guessAdjectiveForms "некоторый")).s ! Sg;
--  n = Sg ; g = PNoGen ; c = Nom ;
    size = Num1 ;
  } ;
  somePl_Det = {
    s = (adjFormsAdjective (guessAdjectiveForms "некоторый")).s ! Pl;
    size = Num1 ;
  } ;

  few_Det = { -- numeral! TODO: мало ? немного ?
    s = (adjFormsAdjective (guessAdjectiveForms "немногий")).s ! Sg;
--  n = Sg ; g = PNoGen ; c = Nom ;
    size = Num5 ;
  } ;

  only_Predet = adjFormsAdjective (noShorts only_Pron) ;       -- ** { g = PNoGen; c = Nom; size = nom} ;  -- TODO: ?
  --most_Predet   = bolshinstvoSgDet ** {n = Sg; g = (PGen Neut); c= Gen; size = plg}
  all_Predet = adjFormsAdjective (noShorts all_Pron) ;         -- ** { g = PNoGen; c = Nom; size = nom} ;  -- TODO: ?
}
