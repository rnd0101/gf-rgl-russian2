resource ParadigmsRus = open CatRus, ResRus, (R=ResRus), Prelude in {

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

------------------------------
-- Nouns

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