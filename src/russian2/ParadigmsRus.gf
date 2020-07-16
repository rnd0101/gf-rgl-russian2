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

  short : ShortFormPreference
    = PrefShort ;
  full : ShortFormPreference
    = PrefFull ;

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
    mkN : Str -> Gender -> Animacy -> Z.ZNIndex -> N
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
    mkPN : Str -> Gender -> Animacy -> Z.ZNIndex -> PN
      = \word, g, a, z -> lin PN (noMinorCases (Z.makeNoun word g a z)) ;
    mkPN : Str -> Gender -> Animacy -> Str -> PN
      = \word, g, a, zi -> lin PN (noMinorCases (Z.makeNoun word g a (Z.parseIndex zi))) ;
  } ;

---------------------
-- Adjectives

  mkA = overload {
    mkA : Str -> A
      = \nom -> lin A (guessAdjectiveForms nom) ;
    mkA : Str -> Str -> A
      = \nom, comp -> lin A ((guessAdjectiveForms nom) ** {comp=comp}) ;
    mkA : Str -> Str -> Str -> A
      = \nom, comp, zi ->
        let af = Z.makeAdjective nom (Z.parseAdjIndex zi) PrefFull in
        let comp' = case (Predef.length comp) of {0 => af.comp; _ => comp} in
        lin A (af ** {comp=comp'}) ;
    mkA : Str -> Str -> Str -> ShortFormPreference -> A
      = \nom, comp, zi, sfp ->
        let af = Z.makeAdjective nom (Z.parseAdjIndex zi) sfp in
        let comp' = case (Predef.length comp) of {0 => af.comp; _ => comp} in
        lin A (af ** {comp=comp'}) ;
  } ;

-- Two-place adjectives need a preposition and a case as extra arguments.

  -- TODO: ? mkA2 : A -> Str -> Case -> A2 ;  -- "делим на"
  mkA2 : A -> Prep -> A2
    = \a,p -> lin A2 (a ** {c = p}) ;

  mkOrd = overload {
    mkOrd : (nom : Str) -> Ord
      = \nom -> lin Ord (guessAdjectiveForms nom) ;
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
    mkV2 : V -> Str -> Case -> V2
      = \vf, prep, c -> lin V2 (vf ** {c={s=prep ; c=c ; hasPrep=True}}) ;
    } ;

------------------------
-- Adverbs, prepositions, conjunctions, ...

  mkAdv : Str -> Adv
    = \s -> lin Adv (makeAdverb s) ;

  mkConj : Str -> Number -> Conj
    = \s, n -> lin Conj {s1 = [] ; s2 = s ; n = n} ;

  mkInterj : Str -> Interj
    = \s -> lin Interj {s = s} ;

}