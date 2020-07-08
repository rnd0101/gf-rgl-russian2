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

  Adjective : Type = {s : Number => Gender => Animacy => Case => Str} ;

  noShorts : AdjFormsBase -> AdjForms  -- ???
    = \base -> base ** {
      sm = [] ;
      sf = [] ;
      sn = [] ;
      sp = []
    } ;

  adjFormsAdjective : AdjForms -> Adjective
    = \forms -> {
      s = table {
        Sg => table {
          Fem => table {
            (Inanimate|Animate) => table {
              Nom => forms.fsnom ;
              Gen => forms.fsgen ;
              Dat => forms.fsgen ;
              Acc => forms.fsacc ;
              Ins => forms.fsins ;
              Pre => forms.fsgen ;
              Loc => forms.fsgen ;
              Ptv => forms.fsgen ;
              VocRus => forms.fsnom
            }
          } ;
          Masc => table {
            Inanimate => table {
              Nom => forms.msnom ;
              Gen => forms.msgen ;
              Dat => forms.msdat ;
              Acc => forms.msnom ;
              Ins => forms.msins ;
              Pre => forms.msprep ;
              Loc => forms.msprep ;
              Ptv => forms.msgen ;
              VocRus => forms.msnom
            } ;
            Animate => table {
              Nom => forms.msnom ;
              Gen => forms.msgen ;
              Dat => forms.msdat ;
              Acc => forms.msgen ;
              Ins => forms.msins ;
              Pre => forms.msprep ;
              Loc => forms.msprep ;
              Ptv => forms.msgen ;
              VocRus => forms.msnom
            }
          } ;
          Neut => table {
            (Inanimate | Animate) => table {
              Nom => forms.nsnom ;
              Gen => forms.msgen ;
              Dat => forms.msdat ;
              Acc => forms.nsnom ;
              Ins => forms.msins ;
              Pre => forms.msprep ;
              Loc => forms.msprep ;
              Ptv => forms.msgen ;
              VocRus => forms.nsnom
            }
          }
        } ;
        Pl => table {
          (Fem|Masc|Neut) => table {
            Inanimate => table {
              Nom => forms.pnom ;
              Gen => forms.pgen ;
              Dat => forms.msins ;
              Acc => forms.pnom ;
              Ins => forms.pins ;
              Pre => forms.pgen ;
              Loc => forms.pgen ;
              Ptv => forms.pgen ;
              VocRus => forms.pnom
            } ;
            Animate => table {
              Nom => forms.pnom ;
              Gen => forms.pgen ;
              Dat => forms.msins ;
              Acc => forms.pgen ;
              Ins => forms.pins ;
              Pre => forms.pgen ;
              Loc => forms.pgen ;
              Ptv => forms.pgen ;
              VocRus => forms.pnom
            }
          }
        }
      } ;
      g = forms.g ;
      a = forms.a
    } ;

  guessAdjectiveForms : Str -> AdjForms
    = \word ->
      let stem = Predef.tk 2 word in
      case word of {
        _ + "шеий"                 => makeAdjective word (ZA 6 No A_) ;
        _ + "цый"                  => makeAdjective word (ZA 5 No A_) ;
        _ + ("к"|"г"|"х") +"ий"    => makeAdjective word (ZA 3 No A_) ;
        _ + ("ш"|"ж"|"ч"|"щ")+"ий" => makeAdjective word (ZA 4 No A_) ;
        _ + #consonant + "ный"     => makeAdjective word (ZA 1 Ast A_) ;
        _ + #consonant + "ний"     => makeAdjective word (ZA 2 Ast A_) ;
        _ + "ый"                   => makeAdjective word (ZA 1 No A_) ;
        _ + "ой"                   => makeAdjective word (ZA 1 No B_) ;
        _ + "ий"                   => makeAdjective word (ZA 2 No A_) ;
        _                          => makeAdjective word (ZA 1 No A_)  
    } ;

  the_most = guessAdjectiveForms "самый" ;

  long_superlative : AdjForms -> AdjForms
    = \af -> {
      msnom = the_most.msnom  ++ af.msnom ;
      fsnom = the_most.fsnom  ++ af.fsnom ;
      nsnom = the_most.nsnom  ++ af.nsnom ;
      pnom  = the_most.pnom   ++ af.pnom  ;
      msgen = the_most.msgen  ++ af.msgen ;
      fsgen = the_most.fsgen  ++ af.fsgen ;
      pgen  = the_most.pgen   ++ af.pgen  ;
      msdat = the_most.msdat  ++ af.msdat ;
      fsacc = the_most.fsacc  ++ af.fsacc ;
      msins = the_most.msins  ++ af.msins ;
      fsins = the_most.fsins  ++ af.fsins ;
      pins  = the_most.pins   ++ af.pins  ;
      msprep= the_most.msprep ++ af.msprep;
      sm    = the_most.sm     ++ af.sm    ;
      sf    = the_most.sf     ++ af.sf    ;
      sn    = the_most.sn     ++ af.sn    ;
      sp    = the_most.sp     ++ af.sp    ;
      g=af.g ;
      a=af.a
    } ;

  makeNFFromAF : AdjForms -> Gender -> Animacy -> NounForms
    = \af, g, a ->
      case g of {
        Fem => {
          snom = af.fsnom ;
          pnom = af.pnom ;
          sgen = af.fsgen ;
          pgen = af.pgen ;
          sdat = af.fsgen ;
          pdat = af.msins ;
          sacc = af.fsacc ;
          pacc = case a of {Animate => af.pgen ; Inanimate => af.pnom} ;
          sins = af.fsins ;  -- TODO: there is also variant fsins == fsgen
          pins = af.pins ;
          sprep= af.fsgen ;
          pprep= af.pgen ;
          sloc = af.fsgen ;
          sptv = af.fsgen ;
          svoc = af.fsnom ;
          g=g ;
          a=a
        } ;
        Masc => {
          snom = af.msnom ;
          pnom = af.pnom ;
          sgen = af.msgen ;
          pgen = af.pgen ;
          sdat = af.msdat ;
          pdat = af.msins ;
          sacc = case a of {Animate => af.msgen ; Inanimate => af.msnom} ;
          pacc = case a of {Animate => af.pgen ; Inanimate => af.pnom} ;
          sins = af.msins ;
          pins = af.pins ;
          sprep= af.msprep ;
          pprep= af.pgen ;
          sloc = af.msprep ;
          sptv = af.msgen ;
          svoc = af.msnom ;
          g=g ;
          a=a
        } ;
        Neut => {
          snom = af.nsnom ;
          pnom = af.pnom ;
          sgen = af.msgen ;
          pgen = af.pgen ;
          sdat = af.msdat ;
          pdat = af.msins ;
          sacc = af.nsnom ;
          pacc = case a of {Animate => af.pgen ; Inanimate => af.pnom} ;
          sins = af.msins ;
          pins = af.pins ;
          sprep= af.msprep ;
          pprep= af.pgen ;
          sloc = af.msprep ;
          sptv = af.msgen ;
          svoc = af.nsnom ;
          g=g ;
          a=a
        }
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

  -- Pronouns in Russian

  PronounForms : Type = {
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

  personalPron : Agr -> PronounForms
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

  doPossessivePronSgP1P2 : Str -> AdjFormsBase
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

  doPossessivePronPlP1P2 : Str -> AdjFormsBase
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

  doPossessivePronP3 : Str -> AdjFormsBase
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

  possessivePron : Agr -> AdjFormsBase
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

  pronFormsPronoun : PronounForms -> Pronoun
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


  all_Pron = adjective2AstB "весь" ;
  only_Pron = guessAdjectiveForms "единственный" ;

---------------
-- Numerals -- Числительные
---------------


--------------------------------
-- combining nouns with numerals

param
  NumSize = Num1 | NumAll | Num2_4 | Num5 ;   -- Num1 - Sg, NumAll - Pl, Num2_4 - "Dual"

-- TODO From po-file Forms:
-- (n%10==1 && n%100!=11 ? Num1 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? Num2_4 : Num5 );

-- oper
--   numSizeForm : (Number => Case => Str) -> NumSize -> Case -> Str ;  -- TODO:
--   numSizeAgr : Gender -> NumSize -> Person -> Agr ; -- TODO
--   numSizeNumber : NumSize -> Number ; -- TODO

oper -- TODO:
  ComplementCase : Type = {s : Str ; c : Case ; hasPrep : Bool} ;

}
