resource ParamRus = ParamX, CommonX [Temp] ** open Prelude in {
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
    digit : pattern Str = #("0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9") ;
    stress_schema : pattern Str = #("a'"|"a"|"b'"|"b"|"c''"|"c'"|"c"|"d'"|"d"|"e"|"f''"|"f'"|"f") ;
    adj_stress_schema : pattern Str = #("b/c''"|"a/c''"|"a/b'"|"a/c'"|"b/a'"|"b/b'"|"b/c'"|"b/c"|"b/a"|"b/b"|"a/a'"|"a/a"|"a/c"|"a/b"|"a'"|"b'"|"a"|"b"|"c") ;

  param
    Gender        = Masc | Fem | Neut ;  -- род
    Animacy       = Animate | Inanimate ;  -- одушевлённый / неодушевлённый
    Voice         = Act | Pass ;  -- залог
    Aspect        = Imperfective | Perfective ;  -- вид / аспект
    Reflexivity   = Reflexive | NonReflexive ;  -- возвратность
    Transitivity  = Transitive | Intransitive ;  -- возвратность
    Mood          = Infinitive | Sbjv | Imperative | Ind ;  -- SBJV and COND will be treated as same for now

    GenNum   = GSg Gender | GPl ; -- The plural never makes a gender distinction
    NumSize  = Num1 | NumAll | Num2_4 | Num5 ;   -- Num1 - Sg, NumAll - Pl, Num2_4 - "Dual"
    Agr      = Ag GenNum Person ;

    Case     = Nom | Gen | Dat | Acc | Ins | Pre  -- падеж, "малые падежи":
              | Loc | Ptv | VocRus ;  -- "minor cases", usually Loc = Pre, Ptv = Gen, VocRus = Nom
    ShortFormPreference = PrefShort | PrefFull ;
  oper
    -- GenNum helpers and coercions
    MSg        = GSg Masc ;
    FSg        = GSg Fem ;
    NSg        = GSg Neut ;
    gennum : Gender -> Number -> GenNum
      = \g,n -> case n of {Sg => GSg g ; Pl => GPl} ;
    numGenNum : GenNum -> Number
      = \gn -> case gn of {GSg _ => Sg ; GPl => Pl} ;
    agrGenNum : Agr -> GenNum
      = \a -> case a of {Ag gn _ => gn} ;

    DeclType     = Predef.Ints 8 ;        -- Declension type

    NounFormsBase : Type = {
      snom, sgen, sdat, sacc, sins, sprep,
      pnom, pgen, pdat, pacc, pins, pprep : Str ;
      g : Gender ;
      a : Animacy
    } ;

    AdjForms : Type = {
      msnom, fsnom, nsnom, pnom,  -- pvoc = pnom
      msgen, fsgen, pgen,         -- nsgen = msgen ; ploc = pprep = pgen = pptv (?)
      msdat,                      -- nsdat = msdat ; fsdat = fsgen
      fsacc,                      -- amsacc = msgen, imsacc = msnom, nsacc = nsnom
      msins, fsins, pins,         -- nsins = msins, pdat = msins ; there is also variant fsins == fsgen
      msprep,                     -- nsprep = msprep, fsprep = fsgen, msloc = msprep
      sm, sf, sn, sp,             -- short forms
      comp                        -- comparative variants
      : Str ;
      preferShort : ShortFormPreference
    } ;

    PronForms : Type = {
      msnom, fsnom, nsnom, pnom,  -- pvoc = pnom
      msgen, fsgen, pgen,         -- nsgen = msgen = msptv = nsptv; fsgen = fsptv; ploc = pprep = pgen = pptv
      msdat,                      -- nsdat = msdat, fsdat = fsgen
      fsacc,                      -- amsacc = msgen, imsacc = msnom, nsacc = nsnom, pacc = pgen
      msins, fsins, pins,         -- nsins = msins, pdat = msins ; there is also variant fsins == fsgen
      msprep                      -- nsprep = msprep, fsprep = fsgen, msloc = msprep
                                  -- unlike adjective forms, short forms are not here
      : Str ;
    } ;

    ConjType     = Predef.Ints 16 ;        -- Conjugation type

}
