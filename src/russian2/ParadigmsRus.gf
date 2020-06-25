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
  } ;

---------------------
-- Adjectives

-------------------------
-- Verbs

------------------------
-- Adverbs, prepositions, conjunctions, ...

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;

  mkConj : Str -> Conj
    = \s -> lin Conj {s1 = [] ; s2 = s} ;

}