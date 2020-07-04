resource ParadigmsRus = open CatRus, ResRus, (R=ResRus), ParamRus, (Z=ZaliznyakAlgo), Prelude in {

----------------
-- Parameters

oper
  singular : Number
    = Sg ;
  plural : Number
    = Pl ;

  masculine : Gender
    = Masc ;
  feminine : Gender
    = Fem ;
  neuter : Gender
    = Neut ;

  animate : Animacy
    = Animate ;
  inanimate : Animacy
    = Inanimate ;

  nominative : Case
    = Nom ;
  genitive : Case
    = Gen ;
  dative : Case
    = Dat ;
  accusative : Case
    = Acc ;
  instrumental : Case
    = Ins ;
  prepositional : Case
    = Pre ;

  -- "Minor" cases:

  locative : Case
    = Loc ;
  partitive : Case
    = Ptv ;
  vocative : Case
    = VocRus ;

  positive : Degree
    = Posit ;
  comparative : Degree
    = Compar ;
  superlative : Degree
    = Superl ;

------------------------------
-- Nouns

  mkN = overload {
    mkN : (nom : Str) -> N
      = \nom -> lin N (guessNounForms nom) ;
    mkN : Str -> Gender -> Animacy -> N
      = \nom, g, a -> lin N (guessLessNounForms nom g a) ;
    mkN : Str -> Gender -> Animacy -> Z.ZIndex -> N
      = \word, g, a, z -> lin N (noMinorCases (Z.makeNoun word g a z)) ;
    mkN : Str -> Gender -> Animacy -> Str -> N
      = \word, g, a, zi -> lin N (noMinorCases (Z.makeNoun word g a (Z.parseIndex zi))) ;
    mkN : A -> Gender -> Animacy -> N
      = \a, g, anim -> lin N (makeNFFromAF a g anim) ;
  } ;

  mkN2 = overload {
    mkN2 : N -> N2
      = \n -> lin N2 (mkFun n nullPrep) ;
    mkN2 : N -> Prep -> N2
      = \n, p -> lin N2 (mkFun n p) ;
    mkN2 : Str -> Gender -> Animacy -> Str -> Prep -> N2
      = \word, g, a, zi, p -> lin N2 (mkFun (noMinorCases (Z.makeNoun word g a (Z.parseIndex zi))) p)   ;
  } ;

  nullPrep : Prep = lin Prep {s=[]; c=Gen; hasPrep=False} ;

  mkN3 = overload {
    mkN3 : N -> Prep -> Prep -> N3
      = \n, p2, p3 -> lin N3 (mkFun2 n p2 p3) ;
    mkN3 : Str -> Gender -> Animacy -> Str -> Prep -> Prep -> N3
      = \word, g, a, zi, p2, p3 -> lin N3 (mkFun2 (noMinorCases (Z.makeNoun word g a (Z.parseIndex zi))) p2 p3) ;
  } ;

  mkPN = overload {
    mkPN : N -> PN
      = \n -> lin PN n ;
    mkPN : (nom : Str) -> PN
      = \nom -> lin PN (guessNounForms nom) ;
    mkPN : Str -> Gender -> Animacy -> PN
      = \nom, g, a -> lin PN (guessLessNounForms nom g a) ;
    mkPN : Str -> Gender -> Animacy -> Z.ZIndex -> PN
      = \word, g, a, z -> lin PN (noMinorCases (Z.makeNoun word g a z)) ;
    mkPN : Str -> Gender -> Animacy -> Str -> PN
      = \word, g, a, zi -> lin PN (noMinorCases (Z.makeNoun word g a (Z.parseIndex zi))) ;
  } ;

---------------------
-- Adjectives

  mkA = overload {
    mkA : (nom : Str) -> A
      = \nom -> lin A (guessAdjectiveForms nom) ;
  } ;

-------------------------
-- Verbs

  mkV = overload {
    mkV : Str -> V
      = \inf -> lin V (guessVerbForms inf)
  } ;

  mkV2 = overload {
    mkV2 : V -> V2
      = \vf -> lin V2 (vf ** {c={s=[] ; c=Acc ; hasPrep=False}}) ;
    mkV2 : V -> Case -> V2
      = \vf, c -> lin V2 (vf ** {c={s=[] ; c=c ; hasPrep=False}}) ;
    mkV2 : V -> ComplementCase -> V2
      = \vf, c -> lin V2 (vf ** {c=c}) ;
    } ;

------------------------
-- Adverbs, prepositions, conjunctions, ...

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;

  mkConj : Str -> Conj
    = \s -> lin Conj {s1 = [] ; s2 = s} ;

  mkInterj : Str -> Interj
    = \s -> lin Interj {s = s} ;

}