resource ResRus = ParamX ** open Prelude in {
flags coding=utf8 ; optimize=all ;

-- parameters

param
  -- Mostly follows https://en.wikipedia.org/wiki/List_of_glossing_abbreviations
  -- see theory.txt

  -- For nouns:

  Gender     = Masc | Fem | Neut ;  -- род
  -- Number  = Sg | Pl ;  -- число, from ParamX
  Case       = Nom | Gen | Dat | Acc | Ins | Pre  -- падеж, "малые падежи":
              | Loc | Ptv | VocRus ;  -- "minor cases", usually Loc = Pre, Ptv = Gen, VocRus = Nom
  Animacy    = Animate | Inanimate ;  -- одушевлённый / неодушевлённый
  -- Person  = P1 | P2 | P3 ;  -- лицо, from ParamX

  -- For adjectives (mostly)

  {-
  Kind -- разряд прилагательного. The only permanent feature of adjective. Can be dynamic though
     Qualitative   -- качественные, какой? Only these can have short form, 3 comparison degrees
     | Possessive  -- притяжательные, чей? No short form
     | Relative    -- относительные, какой? No short form, can't be more or less of this attribute
  -}

  Voice      = Act | Pass | Refl ;  -- залог
  Aspect     = Imperfective | Perfective ;  -- вид / аспект
  AfterPrep  = Yes | No ;  -- to variate pronouns starting with vowels.
  Possessive = NonPoss | Poss Agr ;   -- TODO: is this needed?  притяжательность
  ClForm     = ClIndic Tense Anteriority | ClCond  | ClIndf | ClImp | ClImm ;
  Agr        = Ag Gender Number Person ; -- The plural never makes a gender distinction

-- TODO: dual gender nouns. See [KING1]

-- The AfterPrep parameter is introduced in order to describe
-- the variations of the third person personal pronoun forms
-- depending on whether they come after a preposition or not.

-- TODO: ++ BIND ++ gluing ? See [LISTENMAA1]

-- also: "над ним" - "надо мной"

-- TODO: cleanup
-- Declension forms depend on Case, Animacy , Gender:
-- "большие дома" - "больших домов" (big houses - big houses'),
-- Animacy plays role only in the Accusative case (Masc Sg and Plural forms):
-- Accusative Animate = Genetive, Accusaive Inanimate = Nominative
-- "я люблю большие дома-"я люблю больших мужчин"
-- (I love big houses - I love big men);
-- and on Number: "большой дом - "большие дома"
-- (a big house - big houses).

-- phonology
-- TBD

---------------
-- Nouns -- Существительные
---------------

-- novel idea (for RGL): lexical items stored as records rather than tables. See [???]
-- advantages:
-- - easier to make exceptions to paradigms (by ** {})
-- - easier to keep the number of forms minimal
-- - easier to see what is happening than with lots of anonymous arguments to mkN, mkA, mkV

-- so this is the lincat of N

oper
  NounFormsBase : Type = {
    snom, sgen, sdat, sacc, sins, sprep,
    pnom, pgen, pdat, pacc, pins, pprep : Str ;
    g : Gender
  } ;


  NounForms : Type = {
    snom, sgen, sdat, sacc, sins, sprep, sloc, sptv, svoc,
    pnom, pgen, pdat, pacc, pins, pprep : Str ;
    g : Gender
  } ;

-- But traditional tables make agreement easier to handle in syntax
-- so this is the lincat of CN

  Noun : Type = {
    s : Number => Case => Str ;
    g : Gender
  } ;

-- this is used in UseN

  nounFormsNoun : NounForms -> Noun
    = \forms -> {
      s = table {
        Sg => table {
          Nom => forms.snom ;
          Gen => forms.sgen ;
          Dat => forms.sdat ;
          Acc => forms.sacc ;
          Ins => forms.sins ;
          Pre => forms.sprep ;
          Loc => forms.sloc ;
          Ptv => forms.sptv ;
          VocRus => forms.svoc
        } ;
        Pl => table {
          Nom => forms.pnom ;
          Gen => forms.pgen ;
          Dat => forms.pdat ;
          Acc => forms.pacc ;
          Ins => forms.pins ;
          Pre => forms.pprep ;
          Loc => forms.pprep ;
          Ptv => forms.pgen ;
          VocRus => forms.pnom
        }
      } ;
      g = forms.g
    } ;

  DeclensionType : Type = Str -> NounForms ;  -- тип склонения

  vowel : pattern Str = #("а"|"е"|"ё"|"о"|"у"|"ы"|"э"|"ю"|"я") ;

  guessNounForms : Str -> NounForms
    = \s -> case s of {
      stem + ("к" | "х" | "г")        => (declBAK s) ** {g = Masc} ;
      stem + ("ж" | "ш" | "ч" | "щ")  => (declSTAZH s) ** {g = Masc} ;
      stem + "ц"                      => (declKONEC s) ** {g = Masc} ;
      stem + "ь"                      => (declVIHR6 stem) ** {g = Masc} ;
      stem                            => (declSPOR stem) ** {g = Masc}
    } ;

  noMinorCases : NounFormsBase -> NounForms
    = \base -> base ** {
      sloc = base.sprep ;
      sptv = base.sgen ;
      svoc = base.snom ;
      ploc = base.pprep ;
      pptv = base.pgen ;
      pvoc = base.pnom
    } ;

  declSPOR : DeclensionType  -- СПОР - сущ ru m ina 1a
    = \spor -> noMinorCases {
      snom  = spor ;
      pnom  = spor + "ы" ;
      sgen  = spor + "а" ;
      pgen  = spor + "ов" ;
      sdat  = spor + "у" ;
      pdat  = spor + "ам" ;
      sacc  = spor ;
      pacc  = spor + "ы" ;
      sins  = spor + "ом" ;
      pins  = spor + "ами" ;
      sprep = spor + "е" ;
      pprep = spor + "ах" ;
      g = Masc
  } ;

  declVIHR6 : DeclensionType  -- ВИХРЬ - сущ ru m ina 2a
    = \vihr -> noMinorCases {
      snom  = vihr + "ь" ;
      pnom  = vihr + "и" ;
      sgen  = vihr + "я" ;
      pgen  = vihr + "ей" ;
      sdat  = vihr + "ю" ;
      pdat  = vihr + "ям" ;
      sacc  = vihr + "ь" ;
      pacc  = vihr + "и" ;
      sins  = vihr + "ем" ;
      pins  = vihr + "ями" ;
      sprep = vihr + "е" ;
      pprep = vihr + "ях" ;
      g = Masc
  } ;

  declBAK : DeclensionType  -- БАК - сущ ru m ina 3a
    = \bak -> noMinorCases {
      snom  = bak ;
      pnom  = bak + "и" ;
      sgen  = bak + "а" ;
      pgen  = bak + "ов" ;
      sdat  = bak + "у" ;
      pdat  = bak + "ам" ;
      sacc  = bak ;
      pacc  = bak + "и" ;
      sins  = bak + "ом" ;
      pins  = bak + "ами" ;
      sprep = bak + "е" ;
      pprep = bak + "ах" ;
      g = Masc
  } ;

  declSTAZH : DeclensionType  -- СТАЖ - сущ ru m ina 4a
    = \stazh -> noMinorCases {
      snom  = stazh ;
      pnom  = stazh + "и" ;
      sgen  = stazh + "а" ;
      pgen  = stazh + "ей" ;
      sdat  = stazh + "у" ;
      pdat  = stazh + "ам" ;
      sacc  = stazh ;
      pacc  = stazh + "и" ;
      sins  = stazh + "ем" ;
      pins  = stazh + "ами" ;
      sprep = stazh + "е" ;
      pprep = stazh + "ах" ;
      g = Masc
  } ;

  removeMobileVowel : Str -> Str
    = \s -> (Predef.tk 2 s) + (Predef.dp 1 s) ;

  declKONEC : DeclensionType  -- КОНЕЦ - сущ ru m ina 5*b
    = \konec ->
      let konec1 = removeMobileVowel konec in
      noMinorCases {
        snom  = konec ;
        pnom  = konec1 + "ы" ;
        sgen  = konec1 + "а" ;
        pgen  = konec1 + "ев" ;
        sdat  = konec1 + "у" ;
        pdat  = konec1 + "ам" ;
        sacc  = konec ;
        pacc  = konec1 + "ы" ;
        sins  = konec1 + "ем" ;
        pins  = konec1 + "ами" ;
        sprep = konec1 + "е" ;
        pprep = konec1 + "ах" ;
      g = Masc
  } ;


  Determiner : Type = {  -- определяемое слово
    s : Gender => Animacy => Case => Str ;
    size : NumSize
  } ;

---------------------------
-- Adjectives -- Прилагательные

  Adjective : Type = {s : Gender => Number => Case => Str} ;

  AdjForms : Type = {
    msnom, fsnom, nsnom, pnom,  -- pvoc = pnom
    msgen, fsgen, pgen,         -- nsgen = msgen ; ploc = pprep = pgen = pptv (?)
    msdat, fsdat,               -- nsdat = msdat
    fsacc,                      -- amsacc = msgen, imsacc = msnom, nsacc = nsnom
    msins, fsins, pins,         -- nsins = msins, pdat = msins ; there is also variant fsins == fsgen
    msprep,                     -- nsprep = msprep, fsprep = fsgen, msloc = msprep
    sm, sf, sn, sp              -- short forms
    : Str ;
  } ;

---------------------
-- Verbs -- Глаголы

  VerbForms : Type = {          ---- TODO more forms to add
    inf
    : Str
  } ;

---------------------------
-- Pronouns -- Местоимения

  PronForms : Type = {
    nom, gen, dat, acc, ins, prep : Str ;
    a : Agr
  } ;

  -- From [RUSGRAM]:
  -- personal      -- личные
  -- possessive    -- притяжательные
  -- reflexive     -- возвратные
  -- indefinite    -- неопределённые
  -- demonstrative -- указательные
  -- interrogative -- вопросительные
  -- relative      -- относительные
     -- TODO: animacy - see [KHOLODILOVA1]
  -- reciprocal    -- взаимные
  -- determinative -- определительные
  -- negative      -- отрицательные
  -- Also [RUWIKT]:
  -- exclamative   -- восклицательные

  personalPron : Agr -> PronForms
    = \a -> {a = a} **
      case a of {
        Ag _ Sg P1 => {
          nom, voc = "я" ;
          gen, acc, ptv = "меня" ;
          dat, prep, loc = "мне" ;
          ins = variants {"мной" ; "мною"}
        } ;
        Ag _ Sg P2 => {
          nom, voc = "ты" ;
          gen, acc, ptv = "тебя" ;
          dat, prep, loc = "тебе" ;
          ins = variants {"тобой" ; "тобою"}
        } ;
        Ag Masc Sg P3 => {
          nom, voc = "он" ;
          gen, acc, ptv = "его" ;   -- TODO: n
          dat = "ему" ;   -- TODO: n
          ins = "им" ;   -- TODO: n
          prep, loc = "нём"
        } ;
        Ag Fem Sg P3 => {
          nom, voc = "она" ;
          gen, ptv = variants { "её"; "ей" } ;           -- TODO: n
          dat = "ей" ;                     -- TODO: n
          acc = "её" ;           -- TODO: n
          ins = variants { "ей"; "ею" } ;   -- TODO: n
          prep, loc = "ней"
        } ;
        Ag Neut Sg P3 => {  -- TODO: same as Masc, how to combine?
          nom, voc = "оно" ;
          gen, acc, ptv = "его" ;   -- TODO: n
          dat = "ему" ;   -- TODO: n
          ins = "им" ;   -- TODO: n
          prep, loc = "нём"
        } ;
        Ag _ Pl P1 => {
          nom, voc = "мы" ;
          gen, acc, ptv = "нас" ;
          dat = "нам" ;
          ins = "нами" ;
          prep, loc = "нас"
        } ;
        Ag _ Pl P2 => {
          nom, voc = "вы" ;
          gen, acc, ptv = "вас" ;
          dat = "вам" ;
          ins = "вами" ;
          prep, loc = "вас"
        } ;
        Ag _ Pl P3 => {
          nom, voc = "они" ;
          gen, acc, ptv = "их" ;   -- TODO: n
          dat = "им" ;   -- TODO: n
          ins = "ими" ;   -- TODO: n
          prep, loc = "них"
        }
      } ;

-- Possessive pronouns are more like adjectives

  AdjlikePronForms : Type = {
    msnom, fsnom, nsnom, pnom,  -- pvoc = pnom
    msgen, fsgen, pgen,         -- nsgen = msgen = msptv = nsptv; fsgen = fsptv; ploc = pprep = pgen = pptv
    msdat,                      -- nsdat = msdat, fsdat = fsgen
    fsacc,                      -- amsacc = msgen, imsacc = msnom, nsacc = nsnom, pacc = pgen
    msins, fsins, pins,         -- nsins = msins, pdat = msins ; there is also variant fsins == fsgen
    msprep                      -- nsprep = msprep, fsprep = fsgen, msloc = msprep
                                -- unlike adjective forms, short forms are not here
    : Str ;
  } ;

  doPossessivePronSgP1P2 : Str -> AdjlikePronForms
    = \mo -> {
      msnom = mo + "й" ;
      fsnom = mo + "я" ;
      nsnom = mo + "ё" ;
      pnom = mo + "и" ;
      msgen = mo + "его" ;
      fsgen = mo + "ей" ;
      pgen  = mo + "их" ;
      msdat = mo + "ему" ;
      fsacc = mo + "ю" ;
      msins = mo + "им" ;
      fsins = mo + "ей" ;
      pins  = mo + "ими" ;
      msprep = mo + "ём"
    } ;

  doPossessivePronPlP1P2 : Str -> AdjlikePronForms
    = \nash -> {
      msnom = nash ;
      fsnom = nash + "а" ;
      nsnom = nash + "е" ;
      pnom = nash + "и" ;
      msgen = nash + "его" ;
      fsgen = nash + "ей" ;
      pgen  = nash + "их" ;
      msdat = nash + "ему" ;
      fsacc = nash + "у" ;
      msins = nash + "им" ;
      fsins = nash + "ей" ;
      pins  = nash + "ими" ;
      msprep = nash + "ем"
    } ;

  doPossessivePronP3 : Str -> AdjlikePronForms
    = \ego -> {
      msnom,
      fsnom,
      nsnom,
      pnom,
      msgen,
      fsgen,
      pgen,
      msdat,
      fsacc,
      msins,
      fsins,
      pins,
      msprep = ego
    } ;

  possessivePron : Agr -> AdjlikePronForms
    = \a -> {a = a} **
      case a of {
        Ag _ Sg P1 => doPossessivePronSgP1P2 "мо" ;
        Ag _ Sg P2 => doPossessivePronSgP1P2 "тво" ;
        Ag (Masc|Neut) Sg P3 => doPossessivePronP3 "его" ;
        Ag Fem Sg P3 => doPossessivePronP3 "её" ;
        Ag _ Pl P1 => doPossessivePronPlP1P2 "наш" ;
        Ag _ Pl P2 => doPossessivePronPlP1P2 "ваш" ;
        Ag _ Pl P3 => doPossessivePronP3 "их"    -- TODO: "ихний" variant
      } ;

  Pronoun = { s : Case => Str ; a : Agr } ;

  pronFormsPronoun : PronForms -> Pronoun
    = \forms -> {
      s = table {
        (Nom | VocRus) => forms.nom ;
        (Gen | Ptv)    => forms.gen ;
        Dat            => forms.dat ;
        Acc            => forms.acc ;
        Ins            => forms.ins ;
        (Pre | Loc)    => forms.prep
      } ;
      a = forms.a
    } ;

---------------
-- Numerals -- Числительные
---------------


--------------------------------
-- combining nouns with numerals

param
  NumSize = Num1 | Num2_4 | Num5 ;   -- Num2_4 - "Dual"

-- TODO From po-file Forms:
-- (n%10==1 && n%100!=11 ? Num1 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? Num2_4 : Num5 );

-- oper
--   numSizeForm : (Number => Case => Str) -> NumSize -> Case -> Str ;  -- TODO:
--   numSizeAgr : Gender -> NumSize -> Person -> Agr ; -- TODO
--   numSizeNumber : NumSize -> Number ; -- TODO

oper -- TODO:
  ComplementCase : Type = {s : Str ; c : Case ; hasPrep : Bool} ;


}
