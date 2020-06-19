resource ResRus = ParamRus ** open Prelude, ZaliznyakAlgo in {
flags coding=utf8 ; optimize=all ;

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

-- Mnemonics for cases: (add to lexican as well)
-- Nom есть (кто? что?)
-- Gen нет (кого? чего?)
-- Dat дать (кому? чему?)
-- Acc вижу (кого? что?)
-- Ins горжусь (кем? чем?)
-- Pre думать (о ком? о чём?)
-- Loc нахожусь (где? на чём? в чём?)  -- add if different from Pre
-- Ptv налей (чего?)                   -- add variant if different from Gen
-- VocRus "здравствуй, {}!"            -- add variant if different from Nom

  NounForms : Type = {
    snom, sgen, sdat, sacc, sins, sprep, sloc, sptv, svoc,
    pnom, pgen, pdat, pacc, pins, pprep : Str ;
    g : Gender ;
    a : Animacy
  } ;

-- But traditional tables make agreement easier to handle in syntax
-- so this is the lincat of CN

  Noun : Type = {
    s : Number => Case => Str ;
    g : Gender ;
    a : Animacy
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
      g = forms.g ;
      a = forms.a
    } ;

  DeclensionType : Type = Str -> NounForms ;  -- тип склонения

  vowel_but_i : pattern Str = #("а"|"е"|"ё"|"о"|"у"|"ы"|"э"|"ю"|"я") ;

  -- TODO:
  --  - more cases can be identified with gender provided (right now automatic below is not good)
  --  - and even more with Zaliznyak code (this gives eg where stress is put on stem or ending, etc)
  --  - base step type (soft/hard) can help to describe in a more compact way
  --  - animacy can influence acc sg/pl, those are gen sg/pl, and not nom-sg / pl

  guessNounForms : Str -> NounForms
    = \s ->
    let butLast = Predef.tk 1 s in
    let butTwolast = Predef.tk 2 s in
    case s of {
      stem + "уть"                            => noMinorCases (makeNoun butLast Masc Inanimate (Z 8 No B)) ;
      stem + "ий"                             => noMinorCases (makeNoun butLast Masc Inanimate (Z 7 No A)) ;
      stem + "ия"                             => noMinorCases (makeNoun butLast Fem Inanimate (Z 7 No A)) ;
      stem + "ие"                             => noMinorCases (makeNoun butLast Neut Inanimate (Z 7 No A)) ;
      stem + "ье"                             => noMinorCases (makeNoun butLast Neut Inanimate (Z 6 Ast A)) ;
      stem + "тель"                           => noMinorCases (makeNoun butLast Masc Inanimate (Z 2 No A)) ;
      stem + "ь"                              => noMinorCases (makeNoun stem Fem Inanimate (Z 8 No A)) ;
      stem + "и"                              => noMinorCases (makeNoun stem Neut Inanimate Z0) ;
      stem + #consonant + ("к" | "х" | "г") + "а" => noMinorCases (makeNoun butLast Fem Inanimate (Z 3 Ast A)) ;
      stem + ("к" | "х" | "г")                => noMinorCases (makeNoun s Masc Inanimate (Z 3 No A)) ;
      stem + ("к" | "х" | "г") + "а"          => noMinorCases (makeNoun butLast Fem Inanimate (Z 3 No A)) ;
      stem + "ца"                             => noMinorCases (makeNoun butLast Fem Animate (Z 5 No A)) ;
      stem + "й"                              => noMinorCases (makeNoun butLast Masc Inanimate (Z 6 No A)) ;
      stem + ("ж" | "ш" | "ч" | "щ")          => noMinorCases (makeNoun s Masc Inanimate (Z 4 No A)) ;
      stem + "ша"                             => noMinorCases (makeNoun butLast Fem Animate (Z 4 No A)) ;
      stem + ("ж" | "ш" | "ч" | "щ") + "а"    => noMinorCases (makeNoun butLast Fem Inanimate (Z 4 No A)) ;
      stem + "ц"                              => noMinorCases (makeNoun s Masc Inanimate (Z 5 Ast A)) ;
      stem + "о"                              => noMinorCases (makeNoun butLast Neut Inanimate (Z 1 No A)) ;
      stem + "а"                              => noMinorCases (makeNoun butLast Fem Inanimate (Z 1 No A)) ;
      stem                                    => noMinorCases (makeNoun stem Masc Inanimate (Z 1 No A))
    } ;

  noMinorCases : NounFormsBase -> NounForms
    = \base -> base ** {
      sloc = base.sprep ;
      sptv = base.sgen ;
      svoc = base.snom ;
      --ploc = base.pprep ;
      --pptv = base.pgen ;
      --pvoc = base.pnom
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
