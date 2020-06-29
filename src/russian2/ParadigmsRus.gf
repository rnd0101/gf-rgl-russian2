resource ParadigmsRus = open CatRus, ResRus, (R=ResRus), ParamRus, ZaliznyakAlgo, Prelude in {

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
    mkN : Str -> Gender -> Animacy -> ZIndex -> N
      = \word, g, a, z -> lin N (noMinorCases (makeNoun word g a z)) ;
    mkN : Str -> Gender -> Animacy -> Str -> N
      = \word, g, a, zi -> lin N (noMinorCases (makeNoun word g a (parseIndex zi))) ;
  } ;

  mkN2 = overload {
    mkN2 : N -> N2
      = \n -> lin N2 (mkFun n nullPrep) ;
    mkN2 : N -> Prep -> N2
      = \n, p -> lin N2 (mkFun n p) ;
    mkN2 : Str -> Gender -> Animacy -> Str -> Prep -> N2
      = \word, g, a, zi, p -> lin N2 (mkFun (noMinorCases (makeNoun word g a (parseIndex zi))) p)   ;
  } ;

  nullPrep : Prep = lin Prep {s=[]; c=Gen; hasPrep=False} ;

  mkN3 = overload {
    mkN3 : N -> Prep -> Prep -> N3
      = \n, p2, p3 -> lin N3 (mkFun2 n p2 p3) ;
    mkN3 : Str -> Gender -> Animacy -> Str -> Prep -> Prep -> N3
      = \word, g, a, zi, p2, p3 -> lin N3 (mkFun2 (noMinorCases (makeNoun word g a (parseIndex zi))) p2 p3) ;
  } ;

---------------------
-- Adjectives

-------------------------
-- Verbs

  mkV = overload {
    mkV : Str -> V
      = \inf -> lin N (guessVerbForms inf) ** {lock_V=<>}
  } ;

  mkV2 = overload {
    mkV2 : VerbForms -> VerbForms ** {c : ComplementCase}
      = \vf -> vf ** {c={s=[] ; c=Acc ; hasPrep=False}} ;
    mkV2 : VerbForms -> Case -> VerbForms ** {c : ComplementCase}
      = \vf, c -> vf ** {c={s=[] ; c=c ; hasPrep=False}} ;
    mkV2 : VerbForms -> ComplementCase -> VerbForms ** {c : ComplementCase}
      = \vf, c -> vf ** {c=c} ;
    } ;

------------------------
-- Adverbs, prepositions, conjunctions, ...

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;

  mkConj : Str -> Conj
    = \s -> lin Conj {s1 = [] ; s2 = s} ;

}