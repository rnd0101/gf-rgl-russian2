concrete StructuralRus of Structural = CatRus **
  open ParadigmsRus, ResRus, (X = ConstructX), Prelude in {

lin
  i_Pron = personalPron (Ag MSg P1) ;
  we_Pron = personalPron (Ag GPl P1) ;
  youSg_Pron = personalPron (Ag MSg P2) ;
  youPl_Pron = personalPron (Ag GPl P2) ;
  youPol_Pron = youPl_Pron ;
  he_Pron = personalPron (Ag MSg P3) ;
  she_Pron = personalPron (Ag FSg P3) ;
  it_Pron = personalPron (Ag NSg P3) ;
  they_Pron = personalPron (Ag GPl P3) ;

  above_Prep = {s="над" ; c=Ins; hasPrep=True} ;
  after_Prep = {s="после" ; c=Gen; hasPrep=True };
  before_Prep = {s="перед" ; c=Ins; hasPrep=True};
  behind_Prep = {s="за" ; c=Ins; hasPrep=True };
  between_Prep = {s="между" ; c=Ins; hasPrep=True};
  by8agent_Prep = {s=["с помощью"] ; c=Gen; hasPrep=True};
  by8means_Prep = {s=["с помощью"] ; c=Gen; hasPrep=True};
  during_Prep = {s=["в течение"] ; c=Gen; hasPrep=True};
  for_Prep = {s="для" ; c=Gen ; hasPrep=True};
  from_Prep = {s="от" ; c=Gen ; hasPrep=True} ;
  in8front_Prep = {s="перед" ; c=Ins; hasPrep=True};
  in_Prep = {s="в" ; c=Loc ; hasPrep=True} ;
  on_Prep = {s="на" ; c=Loc ; hasPrep=True};
  part_Prep = {s="" ; c=Nom ; hasPrep=False }; -- missing in Russian???
  possess_Prep = {s="" ; c=Gen ; hasPrep=False};
  through_Prep = {s="через" ; c=Acc ; hasPrep=True};
  to_Prep = {s="к" ; c=Dat ; hasPrep=True} ;
  under_Prep = {s="под" ; c=Ins ; hasPrep=True};
  or_Conj = mkConj "или" Sg ;
  and_Conj = mkConj "и" Pl ;

  less_CAdv = X.mkCAdv "менее" "чем" ;
  more_CAdv = X.mkCAdv "более" "чем" ;

  every_Det = {
    s = \\g => (adjFormsAdjective (guessAdjectiveForms "каждый")).s ! GSg g;
    g = Masc ;
    c = Nom ;
    size = Num1 ;
  } ;
  someSg_Det   = {
    s = \\g => (adjFormsAdjective (guessAdjectiveForms "некоторый")).s ! GSg g;
    g = Masc ;
    c = Nom ;
    size = Num1 ;
  } ;
  somePl_Det = {
    s = \\g => (adjFormsAdjective (guessAdjectiveForms "некоторый")).s ! GPl;
    g = Masc ;
    c = Nom ;
    size = NumAll ;
  } ;

  few_Det = { -- numeral! TODO: мало ? немного ?
    s = \\g => (adjFormsAdjective (guessAdjectiveForms "немногий")).s ! GSg g;
    g = Masc ;
    c = Nom ;
    size = Num5 ;
  } ;

  only_Predet = adjFormsAdjective (noShorts only_Pron) ;       -- ** { g = PNoGen; c = Nom; size = nom} ;  -- TODO:
  --most_Predet   = bolshinstvoSgDet ** {n = Sg; g = (PGen Neut); c= Gen; size = plg}
  all_Predet = adjFormsAdjective (noShorts all_Pron) ;         -- ** { g = PNoGen; c = Nom; size = nom} ;  -- TODO:

  yes_Utt = ss ["Да"] ;
}
