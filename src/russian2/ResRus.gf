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

-- Mnemonics for cases: (add to lexicon as well)
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

  Noun2Forms = NounForms ** {c2 : ComplementCase} ;
  Noun3Forms = NounForms ** {c2,c3 : ComplementCase} ;

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

  guessNounForms : Str -> NounForms
    = \word ->
    let nfb : NounFormsBase =
    case word of {
      _ + "уть"                            => makeNoun word Masc Inanimate (Z 8 No B) ;
      _ + "ий"                             => makeNoun word Masc Inanimate (Z 7 No A) ;
      _ + "ия"                             => makeNoun word Fem Inanimate (Z 7 No A) ;
      _ + "ие"                             => makeNoun word Neut Inanimate (Z 7 No A) ;
      _ + "ье"                             => makeNoun word Neut Inanimate (Z 6 Ast A) ;
      _ + "тель"                           => makeNoun word Masc Inanimate (Z 2 No A) ;
      _ + "ь"                              => makeNoun word Fem Inanimate (Z 8 No A) ;
      _ + "и"                              => makeNoun word Neut Inanimate Z0 ;
      _ + #consonant + ("к"|"х"|"г") + "а" => makeNoun word Fem Inanimate (Z 3 Ast A) ;
      _ + ("к" | "х" | "г")                => makeNoun word Masc Inanimate (Z 3 No A) ;
      _ + ("к" | "х" | "г") + "а"          => makeNoun word Fem Inanimate (Z 3 No A) ;
      _ + "ца"                             => makeNoun word Fem Animate (Z 5 No A) ;
      _ + "й"                              => makeNoun word Masc Inanimate (Z 6 No A) ;
      _ + ("ж" | "ш" | "ч" | "щ")          => makeNoun word Masc Inanimate (Z 4 No A) ;
      _ + "ша"                             => makeNoun word Fem Animate (Z 4 No A) ;
      _ + ("ж" | "ш" | "ч" | "щ") + "а"    => makeNoun word Fem Inanimate (Z 4 No A) ;
      _ + "ц"                              => makeNoun word Masc Inanimate (Z 5 Ast A) ;
      _ + "о"                              => makeNoun word Neut Inanimate (Z 1 No A) ;
      _ + "а"                              => makeNoun word Fem Inanimate (Z 1 No A) ;
      _                                    => makeNoun word Masc Inanimate (Z 1 No A)
    } in
    noMinorCases nfb ;

  -- TODO: gender can help identify cases more precisely
  guessLessNounForms : Str -> Gender -> Animacy -> NounForms
    = \word, g, a ->
    let nfb : NounFormsBase =
    case word of {
      _ + "уть"                            => makeNoun word g a (Z 8 No B) ;
      _ + "ий"                             => makeNoun word g a (Z 7 No A) ;
      _ + "ия"                             => makeNoun word g a (Z 7 No A) ;
      _ + "ие"                             => makeNoun word g a (Z 7 No A) ;
      _ + "ье"                             => makeNoun word g a (Z 6 Ast A) ;
      _ + "тель"                           => makeNoun word g a (Z 2 No A) ;
      _ + "ь"                              => makeNoun word g a
                                               (case g of {Fem => (Z 8 No A); _ => (Z 2 No A)});
      _ + "и"                              => makeNoun word g a Z0 ;
      _ + #consonant + ("к"|"х"|"г") + "а" => makeNoun word g a (Z 3 Ast A) ;
      _ + ("к" | "х" | "г")                => makeNoun word g a (Z 3 No A) ;
      _ + ("к" | "х" | "г") + "а"          => makeNoun word g a (Z 3 No A) ;
      _ + "ца"                             => makeNoun word g a (Z 5 No A) ;
      _ + "й"                              => makeNoun word g a (Z 6 No A) ;
      _ + ("ж" | "ш" | "ч" | "щ")          => makeNoun word g a (Z 4 No A) ;
      _ + "ша"                             => makeNoun word g a (Z 4 No A) ;
      _ + ("ж" | "ш" | "ч" | "щ") + "а"    => makeNoun word g a (Z 4 No A) ;
      _ + "ц"                              => makeNoun word g a (Z 5 Ast A) ;
      _ + "о"                              => makeNoun word g a (Z 1 No A) ;
      _ + "а"                              => makeNoun word g a (Z 1 No A) ;
      _                                    => makeNoun word g a (Z 1 No A)
    } in
    noMinorCases nfb ;

  noMinorCases : NounFormsBase -> NounForms
    = \base -> base ** {
      sloc = base.sprep ;
      sptv = base.sgen ;
      svoc = base.snom ;
    } ;

  mkNAltPl : NounForms -> NounForms -> NounForms
    = \sgn, pln -> sgn ** {
      pnom =  pln.pnom ;
      pgen =  pln.pgen ;
      pdat =  pln.pdat ;
      pacc =  pln.pacc ;
      pins =  pln.pins ;
      pprep=  pln.pprep
    } ;

  mkNplus : NounForms -> NounForms
    = \nf -> nf ;

  mkN2plus : Noun2Forms -> Noun2Forms
    = \nf -> nf ;

  Determiner : Type = {  -- определяемое слово
    s : Gender => Animacy => Case => Str ;
    size : NumSize
  } ;

  mkFun : NounForms -> ComplementCase -> Noun2Forms = \f, p -> f ** {c2 = p} ;
  mkFun2 : NounForms -> ComplementCase -> ComplementCase -> Noun3Forms = \f, p2, p3 -> f ** {c2=p2; c3=p3} ;

---------------------------
-- Adjectives -- Прилагательные

  Adjective : Type = {s : Gender => Number => Animacy => Case => Str} ;

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

  guessAdjectiveForms : Str -> AdjForms  -- stub. TODO: properly
    = \word ->
      let stem = Predef.tk 2 word in
      {
        msnom=stem  +"ый" ;
        fsnom=stem  +"ая" ;
        nsnom=stem  +"ое" ;
        pnom=stem   +"ых" ;
        msgen=stem  +"ого" ;
        fsgen=stem  +"ой" ;
        pgen=stem   +"ых" ;
        msdat=stem  +"ому" ;
        fsdat=stem  +"ой" ;
        fsacc=stem  +"ая" ;
        msins=stem  +"ым" ;
        fsins=stem  +"ой" ;
        pins=stem   +"ыми" ;
        msprep=stem +"ом" ;
        sm=stem     +"" ;
        sf=stem     +"а" ;
        sn=stem     +"о" ;
        sp=stem     +"ы" ;
    } ;

---------------------
-- Verbs -- Глаголы

-- Note 1. Passive voice can be formed only for transitive imperfective verbs
-- Passive has no P1, P2, imperative,
-- Reflexive verbs are to provides as as separate lexical entries.
-- Note 2. Imperative Sg P2 of reflexive verbs, can be сь as well as ся, but because there is no passive forms
--

  VerbForms : Type = {
    inf,
    prsg1, prsg2, prsg3, prpl1, prpl2, prpl3,
    futsg1, futsg2, futsg3, futpl1, futpl2, futpl3,
    psgm, psgf, psgn, ppl,
    isg2, ipl1, ipl2 : Str ;
    asp : Aspect ;
    refl : Reflexivity ;
    tran : Transitivity
  } ;

  Verb : Type = {
    s : Voice => Tense => Agr => Str ;
    refl : Reflexivity ;
    tran : Transitivity
  } ;

  -- From old Rus RG:
  -- VerbForm = VFORM Voice VerbConj ;
  -- VerbConj =  VIND GenNum VTense | VIMP Number Person | VINF | VSUB GenNum ;
  -- VTense   = VPresent Person | VPast | VFuture Person ;
  -- GenNum = GSg Gender | GPl ;
  
  guessVerbForms : Str -> VerbForms  -- stub. TODO: properly
    = \word ->
      let stem_info = stemFromVerb word in  -- remove sya as well
      let stem = stem_info.p1 in
      let r = stem_info.p2 in
      {
        inf=word;  -- TODO: reflexive!
        prsg1=stem  + "ю";     -- only imperf
        prsg2=stem  + "ешь";
        prsg3=stem  + "ет";
        prpl1=stem  + "ем";
        prpl2=stem  + "ете";
        prpl3=stem  + "ют";
        futsg1=stem + "ю";     -- only perf
        futsg2=stem + "ешь";
        futsg3=stem + "ет";
        futpl1=stem + "ем";
        futpl2=stem + "ете";
        futpl3=stem + "ют";
        psgm=stem   + "л";
        psgf=stem   + "ла";
        psgn=stem   + "ло";
        ppl=stem    + "ли";
        isg2=stem   + "й";
        ipl1=stem   + "емте";    -- ???
        ipl2=stem   + "йте";
        asp=Imperfective;
        refl=r;
        tran=case r of {Reflexive => Intransitive; NonReflexive => Transitive };   -- TODO: fix non-refl
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
