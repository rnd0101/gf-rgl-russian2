resource ParamRus = ParamX ** open Prelude in {
  -- Mostly follows https://en.wikipedia.org/wiki/List_of_glossing_abbreviations
  -- see theory.txt

  -- For nouns:

  -- Move to ParamRus

  -- Number  = Sg | Pl ;  -- число, from ParamX

  -- Person  = P1 | P2 | P3 ;  -- лицо, from ParamX

  -- For adjectives (mostly)

  {-
  Kind -- разряд прилагательного. The only permanent feature of adjective. Can be dynamic though
     Qualitative   -- качественные, какой? Only these can have short form, 3 comparison degrees
     | Possessive  -- притяжательные, чей? No short form
     | Relative    -- относительные, какой? No short form, can't be more or less of this attribute
  -}



-- TODO: dual gender nouns. See [KING1]

-- The AfterPrep parameter is introduced in order to describe
-- the variations of the third person personal pronoun forms
-- depending on whether they come after a preposition or not.

-- TODO: ++ BIND ++ gluing ? See [LISTENMAA1]

-- also: "над ним" - "надо мной"

-- TODO: cleanup
-- Declension forms depend on Case, Animacy , Gender:
-- Also can be: "Adjective declension" - can be handled by adjective forms (?)
-- "большие дома" - "больших домов" (big houses - big houses'),
-- Animacy plays role only in the Accusative case (Masc Sg and Plural forms):
-- Accusative Animate = Genetive, Accusaive Inanimate = Nominative
-- "я люблю большие дома-"я люблю больших мужчин"
-- (I love big houses - I love big men);
-- and on Number: "большой дом - "большие дома"
-- (a big house - big houses).


-- phonology

  oper

    consonant : pattern Str = #("б"|"в"|"г"|"д"|"ж"|"з"|"й"|"к"|"л"|"м"|"н"|"п"|"р"|"с"|"т"|"ф"|"х"|"ц"|"ч"|"ш"|"щ") ;
    consonant_minus : pattern Str = #("б"|"в"|"г"|"д"|"з"|"й"|"к"|"л"|"м"|"н"|"п"|"р"|"с"|"т"|"ф"|"х") ; -- шжчщц
    vowel : pattern Str = #("а"|"е"|"ё"|"и"|"о"|"у"|"ы"|"э"|"ю"|"я") ;
    vowel_but_i : pattern Str = #("а"|"е"|"ё"|"о"|"у"|"ы"|"э"|"ю"|"я") ;

  param
    Gender     = Masc | Fem | Neut ;  -- род
    Animacy    = Animate | Inanimate ;  -- одушевлённый / неодушевлённый
    AlterType    = No | Ast | Deg  ;    -- Alternation: eg 1a, 1*a, 1°a
    StressSchema = A | A' | B | B' | C | C' | C'' | D | D' | E | F | F' | F'' ;
    ZCirc        = NoC | ZC1 | ZC2 | ZC12 ;
    ZIndex       = Z0 | Z DeclType AlterType StressSchema | ZC DeclType AlterType StressSchema ZCirc ;
    Stressedness = Stressed | Unstressed ;

    Voice      = Act | Pass | Refl ;  -- залог
    Aspect     = Imperfective | Perfective ;  -- вид / аспект
    AfterPrepPron  = AfterPrep | NotAfterPrep ;  -- to variate pronouns starting with vowels.
    Possessive = NonPoss | Poss Agr ;   -- TODO: is this needed?  притяжательность
    ClForm     = ClIndic Tense Anteriority | ClCond  | ClIndf | ClImp | ClImm ;
    Agr        = Ag Gender Number Person ; -- The plural never makes a gender distinction

    Case       = Nom | Gen | Dat | Acc | Ins | Pre  -- падеж, "малые падежи":
              | Loc | Ptv | VocRus ;  -- "minor cases", usually Loc = Pre, Ptv = Gen, VocRus = Nom
  oper
    DeclType     = Predef.Ints 8 ;        -- Declension type

    NounFormsBase : Type = {
      snom, sgen, sdat, sacc, sins, sprep,
      pnom, pgen, pdat, pacc, pins, pprep : Str ;
      g : Gender ;
      a : Animacy
    } ;
}
