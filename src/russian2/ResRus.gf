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
    anim : Animacy
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
      anim = forms.a
    } ;

  guessNounForms : Str -> NounForms
    = \word ->
    let nfb : NounFormsBase =
    case word of {
      _ + "уть"                            => makeNoun word Masc Inanimate (ZN 8 No B NoC) ;
      _ + "ий"                             => makeNoun word Masc Inanimate (ZN 7 No A NoC) ;
      _ + "ия"                             => makeNoun word Fem Inanimate (ZN 7 No A NoC) ;
      _ + "ие"                             => makeNoun word Neut Inanimate (ZN 7 No A NoC) ;
      _ + "ье"                             => makeNoun word Neut Inanimate (ZN 6 Ast A NoC) ;
      _ + "тель"                           => makeNoun word Masc Inanimate (ZN 2 No A NoC) ;
      _ + "ь"                              => makeNoun word Fem Inanimate (ZN 8 No A NoC) ;
      _ + "и"                              => makeNoun word Neut Inanimate ZN0 ;
      _ + #consonant + ("к"|"х"|"г") + "а" => makeNoun word Fem Inanimate (ZN 3 Ast A NoC) ;
      _ + ("к" | "х" | "г")                => makeNoun word Masc Inanimate (ZN 3 No A NoC) ;
      _ + ("к" | "х" | "г") + "а"          => makeNoun word Fem Inanimate (ZN 3 No A NoC) ;
      _ + "ца"                             => makeNoun word Fem Animate (ZN 5 No A NoC) ;
      _ + "й"                              => makeNoun word Masc Inanimate (ZN 6 No A NoC) ;
      _ + ("ж" | "ш" | "ч" | "щ")          => makeNoun word Masc Inanimate (ZN 4 No A NoC) ;
      _ + "ша"                             => makeNoun word Fem Animate (ZN 4 No A NoC) ;
      _ + ("ж" | "ш" | "ч" | "щ") + "а"    => makeNoun word Fem Inanimate (ZN 4 No A NoC) ;
      _ + "ц"                              => makeNoun word Masc Inanimate (ZN 5 Ast A NoC) ;
      _ + "о"                              => makeNoun word Neut Inanimate (ZN 1 No A NoC) ;
      _ + "а"                              => makeNoun word Fem Inanimate (ZN 1 No A NoC) ;
      _                                    => makeNoun word Masc Inanimate (ZN 1 No A NoC)
    } in
    noMinorCases nfb ;

  -- TODO: gender can help identify cases more precisely
  guessLessNounForms : Str -> Gender -> Animacy -> NounForms
    = \word, g, a ->
    let nfb : NounFormsBase =
    case word of {
      _ + "уть"                            => makeNoun word g a (ZN 8 No B NoC) ;
      _ + "ий"                             => makeNoun word g a (ZN 7 No A NoC) ;
      _ + "ия"                             => makeNoun word g a (ZN 7 No A NoC) ;
      _ + "ие"                             => makeNoun word g a (ZN 7 No A NoC) ;
      _ + "ье"                             => makeNoun word g a (ZN 6 Ast A NoC) ;
      _ + "тель"                           => makeNoun word g a (ZN 2 No A NoC) ;
      _ + "ь"                              => makeNoun word g a
                                               (case g of {Fem => (ZN 8 No A NoC); _ => (ZN 2 No A NoC)});
      _ + "и"                              => makeNoun word g a ZN0 ;
      _ + #consonant + ("к"|"х"|"г") + "а" => makeNoun word g a (ZN 3 Ast A NoC) ;
      _ + ("к" | "х" | "г")                => makeNoun word g a (ZN 3 No A NoC) ;
      _ + ("к" | "х" | "г") + "а"          => makeNoun word g a (ZN 3 No A NoC) ;
      _ + "ца"                             => makeNoun word g a (ZN 5 No A NoC) ;
      _ + "й"                              => makeNoun word g a (ZN 6 No A NoC) ;
      _ + ("ж" | "ш" | "ч" | "щ")          => makeNoun word g a (ZN 4 No A NoC) ;
      _ + "ша"                             => makeNoun word g a (ZN 4 No A NoC) ;
      _ + ("ж" | "ш" | "ч" | "щ") + "а"    => makeNoun word g a (ZN 4 No A NoC) ;
      _ + "ц"                              => makeNoun word g a (ZN 5 Ast A NoC) ;
      _ + "о"                              => makeNoun word g a (ZN 1 No A NoC) ;
      _ + "а"                              => makeNoun word g a (ZN 1 No A NoC) ;
      _                                    => makeNoun word g a (ZN 1 No A NoC)
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
    s : DetTable ;
    g : Gender ;  -- is this enough? Is noGender case needed?
    c : Case ;
    size : NumSize
    } ;

  mkFun : NounForms -> ComplementCase -> Noun2Forms = \f, p -> f ** {c2 = p} ;
  mkFun2 : NounForms -> ComplementCase -> ComplementCase -> Noun3Forms = \f, p2, p3 -> f ** {c2=p2; c3=p3} ;

  AgrTable = Agr => Str ;

  agree : ComplementCase -> AgrTable
    = \c -> table {
      _ => c.s  -- TODO: implement
    } ;

  verbPastAgree : VerbForms -> Agr -> Str -> TempParts
    = \vf,a,after -> <"", case a of {
      Ag (GSg Fem) _ => vf.psgf ++ after ;
      Ag (GSg Masc) _ => vf.psgm ++ after ;
      Ag (GSg Neut) _ => vf.psgn ++ after ;
      Ag GPl _ => vf.ppl ++ after
    }> ;

  verbPresAgree : VerbForms -> Agr -> Str -> TempParts
    = \vf,a,after -> <"", case a of {
      Ag (GSg _) P1 => vf.prsg1 ++ after ;
      Ag (GSg _) P2 => vf.prsg2 ++ after ;
      Ag (GSg _) P3 => vf.prsg3 ++ after ;
      Ag GPl P1 => vf.prpl1 ++ after ;
      Ag GPl P2 => vf.prpl2 ++ after ;
      Ag GPl P3 => vf.prpl3 ++ after
    }> ;

  verbFutAgree : VerbForms -> Agr -> Str -> TempParts
    = \vf,a,after -> <"", case a of {
      Ag (GSg _) P1 => vf.futsg1 ++ after ;
      Ag (GSg _) P2 => vf.futsg2 ++ after ;
      Ag (GSg _) P3 => vf.futsg3 ++ after ;
      Ag GPl P1 => vf.futpl1 ++ after ;
      Ag GPl P2 => vf.futpl2 ++ after ;
      Ag GPl P3 => vf.futpl3 ++ after
    }> ;

  verbImperativeAgree : VerbForms -> Agr -> Str -> TempParts
    = \vf,a,after -> case a of {
      Ag (GSg _) P1 => <"давайте", vf.inf ++ after> ;  -- ?
      Ag (GSg _) P2 => <"", vf.isg2 ++ after> ;
      Ag (GSg _) P3 => <"пусть", vf.futsg3 ++ after> ;  -- ?
      Ag GPl P1 => <"", vf.ipl1 ++ after> ;
      Ag GPl P2 => <"", vf.ipl2 ++ after> ;
      Ag GPl P3 => <"пусть", vf.futpl3 ++ after>
    } ;

  verbAgr : VerbForms -> Mood -> Tense -> Agr -> Polarity -> TempParts
    = \vf,m,temp,a,pol ->
      case <m, temp> of {
        <Infinitive, _> => <"",vf.inf> ;
        <Ind, Past> => verbPastAgree vf a "";
        <Ind, Pres> => verbPresAgree vf a "";
        <Ind, Fut> => verbFutAgree vf a "";
        <Ind, Cond> => verbPastAgree vf a "бы" ;
        <Sbjv, _> => verbPastAgree vf a "бы" ;
        <Imperative, _> => verbImperativeAgree vf a ""
      } ;

---------------------------
-- Adjectives -- Прилагательные

  AdjTable = GenNum => Animacy => Case => Str ;

  Adjective : Type = {
    s : AdjTable ;
    preferShort : ShortFormPreference
    } ;

  noShorts : PronForms -> AdjForms  -- ???
    = \base -> base ** {
      sm = [] ;
      sf = [] ;
      sn = [] ;
      sp = [] ;
      comp = [] ;
      preferShort = PrefFull
    } ;

  immutableAdjForms = immutableAdjectiveCases ;

  mkAplus : AdjForms -> AdjForms
    = \af -> af ;

  mkAltShort : AdjForms -> AdjForms -> AdjForms
    = \full, short -> full ** {
      sm =  short.sm ;
      sf =  short.sf ;
      sn =  short.sn ;
      sp =  short.sp
    } ;

  adjFormsAdjective : AdjForms -> Adjective
    = \forms -> {
      s = table {
        GSg Fem => table {
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
        GSg Masc => table {
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
        GSg Neut => table {
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
        } ;
        GPl => table {
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
      } ;
      g = forms.g ;
      a = forms.a ;
      preferShort = forms.preferShort
    } ;

  guessAdjectiveForms : Str -> AdjForms
    = \word ->
      let stem = Predef.tk 2 word in
      case word of {
        _ + "шеий"                 => makeAdjective word (ZA 6 No A_ NoC) PrefFull ;
        _ + "цый"                  => makeAdjective word (ZA 5 No A_ NoC) PrefFull ;
        _ + ("к"|"г"|"х") +"ий"    => makeAdjective word (ZA 3 No A_ NoC) PrefFull ;
        _ + ("ш"|"ж"|"ч"|"щ")+"ий" => makeAdjective word (ZA 4 No A_ NoC) PrefFull ;
        _ + #consonant + "ный"     => makeAdjective word (ZA 1 Ast A_ NoC) PrefFull ;
        _ + #consonant + "ний"     => makeAdjective word (ZA 2 Ast A_ NoC) PrefFull ;
        _ + "ый"                   => makeAdjective word (ZA 1 No A_ NoC) PrefFull ;
        _ + "ой"                   => makeAdjective word (ZA 1 No B_ NoC) PrefFull ;
        _ + "ий"                   => makeAdjective word (ZA 2 No A_ NoC) PrefFull ;
        _                          => makeAdjective word (ZA 1 No A_ NoC) PrefFull
    } ;

  the_most = guessAdjectiveForms "самый" ;
  utmost_Adv = makeAdverb "наиболее" ;

  -- [ISACHENKO],p.220 there are three forms in Russian: самый важный; наиболее важный/важен; важнее (всех, всего)
  -- here only first one:
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
      comp  = the_most.comp   ++ af.comp  ;
      g=af.g ;
      a=af.a ;
      preferShort = PrefFull
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
-- we can store the sya-schema and 'BIND++' as necessary.

  VerbForms : Type = {
    inf,
    prsg1, prsg2, prsg3, prpl1, prpl2, prpl3,
    futsg1, futsg2, futsg3, futpl1, futpl2, futpl3,
    psgm, psgf, psgn, ppl,
    isg2, ipl1, ipl2,
    pppsm, pppsf, pppsn, pppsp
    : Str ;
    asp : Aspect ;
    refl : Reflexivity ;
    tran : Transitivity
  } ;

  Verb : Type = {
    s : Voice => Tense => Agr => Str ;
    refl : Reflexivity ;
    tran : Transitivity
  } ;

oper
  guessVerbForms : Str -> VerbForms  -- stub. TODO: properly
    = \word ->
      let stem_info = stemFromVerb word in  -- remove reflexive postfix as well
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
        pppsm=stem   + "н";
        pppsf=stem   + "на";
        pppsn=stem   + "но";
        pppsp=stem   + "ны";
        asp=Imperfective;
        refl=r;
        tran=case r of {Reflexive => Intransitive; NonReflexive => Transitive };   -- TODO: fix non-refl
    } ;

  refl_postfix_schema : VerbForms
    = { -- TODO: make in parallel with guessVerbForms
      inf="ся";
      prsg1="сь";
      prsg2="ся";
      prsg3="ся";
      prpl1="ся";
      prpl2="сь";
      prpl3="ся";
      futsg1="сь";
      futsg2="ся";
      futsg3="ся";
      futpl1="ся";
      futpl2="сь";
      futpl3="ся";
      psgm="ся";
      psgf="сь";
      psgn="сь";
      ppl ="сь";
      isg2="ся";
      ipl1="сь";
      ipl2="сь";
      pppsm="";
      pppsf="";
      pppsn="";
      pppsp="";
      asp=Imperfective; -- these 3 are not-relevant here
      refl=Reflexive;
      tran=Intransitive
    };

  passivateNonReflexive : VerbForms -> VerbForms
    = \vf ->
      let post = refl_postfix_schema in {
      inf=vf.inf ++ BIND ++ post.inf ;
      prsg1=vf.prsg1 ++ BIND ++ post.prsg1 ;
      prsg2=vf.prsg2 ++ BIND ++ post.prsg2 ;
      prsg3=vf.prsg3 ++ BIND ++ post.prsg3 ;
      prpl1=vf.prpl1 ++ BIND ++ post.prpl1 ;
      prpl2=vf.prpl2 ++ BIND ++ post.prpl2 ;
      prpl3=vf.prpl3 ++ BIND ++ post.prpl3 ;
      futsg1=vf.futsg1 ++ BIND ++ post.futsg1 ;
      futsg2=vf.futsg2 ++ BIND ++ post.futsg2 ;
      futsg3=vf.futsg3 ++ BIND ++ post.futsg3 ;
      futpl1=vf.futpl1 ++ BIND ++ post.futpl1 ;
      futpl2=vf.futpl2 ++ BIND ++ post.futpl2 ;
      futpl3=vf.futpl3 ++ BIND ++ post.futpl3 ;
      psgm=vf.psgm ++ BIND ++ post.psgm ;
      psgf=vf.psgf ++ BIND ++ post.psgf ;
      psgn=vf.psgn ++ BIND ++ post.psgn ;
      ppl=vf.ppl ++ BIND ++ post.ppl ;
      isg2=vf.isg2 ++ BIND ++ post.isg2 ;
      ipl1=vf.ipl1 ++ BIND ++ post.ipl1 ;
      ipl2=vf.ipl2 ++ BIND ++ post.ipl2 ;
      pppsm=vf.pppsm;
      pppsf=vf.pppsf;
      pppsn=vf.pppsn;
      pppsp=vf.pppsp;
      asp=vf.asp ;
      refl=vf.refl ;
      tran=vf.tran
      } ;

  passivate : VerbForms -> VerbForms
    = \vf ->
      case vf.refl of {
        Reflexive => vf ;
        NonReflexive => passivateNonReflexive vf
      } ;

  shortPastPassPart : VerbForms -> GenNum -> Str
    = \vf,gn ->
      case gn of {
        GSg Fem => vf.pppsf ;
        GSg Masc => vf.pppsm ;
        GSg Neut => vf.pppsn ;
        GPl => vf.pppsp
        } ;

---------------------------
-- Pronouns -- Местоимения

  -- Pronouns in Russian

  PronounForms : Type = {
    nom, gen, dat, acc, ins, prep : Str ;
    poss : PronForms ;
    a : Agr
  } ;

  PronTable = GenNum => Animacy => Case => Str ;

  nullPron : Pronoun = {
    s=\\cas => [] ;
    poss=\\gn,a,cas => [] ;
    a=Ag (GSg Neut) P3
    } ;

  mkPronTable : PronForms -> PronTable
    = \forms -> table {
      GSg Fem => table {
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
      GSg Masc => table {
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
      GSg Neut => table {
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
      } ;
      GPl => table {
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
    } ;

  Pronoun = {
    s : Case => Str ;
    poss : PronTable ;
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
        Ag (GSg _) P1 => {
          nom, voc = "я" ;
          gen, acc, ptv = "меня" ;
          dat, prep, loc = "мне" ;
          ins = variants {"мной" ; "мною"} ;
          poss = doPossessivePronSgP1P2 "мо"
        } ;
        Ag (GSg _) P2 => {
          nom, voc = "ты" ;
          gen, acc, ptv = "тебя" ;
          dat, prep, loc = "тебе" ;
          ins = variants {"тобой" ; "тобою"} ;
          poss = doPossessivePronSgP1P2 "тво"
        } ;
        Ag (GSg Masc) P3 => {
          nom, voc = "он" ;
          gen, acc, ptv = "его" ;   -- TODO: n
          dat = "ему" ;   -- TODO: n
          ins = "им" ;   -- TODO: n
          prep, loc = "нём" ;
          poss = doPossessivePronP3 "его"
        } ;
        Ag (GSg Fem) P3 => {
          nom, voc = "она" ;
          gen, ptv = variants { "её"; "ей" } ;           -- TODO: n
          dat = "ей" ;                     -- TODO: n
          acc = "её" ;           -- TODO: n
          ins = variants { "ей"; "ею" } ;   -- TODO: n
          prep, loc = "ней" ;
          poss = doPossessivePronP3 "её"
        } ;
        Ag (GSg Neut) P3 => {
          nom, voc = "оно" ;
          gen, acc, ptv = "его" ;   -- TODO: n
          dat = "ему" ;   -- TODO: n
          ins = "им" ;   -- TODO: n
          prep, loc = "нём" ;
          poss = doPossessivePronP3 "его"
        } ;
        Ag GPl P1 => {
          nom, voc = "мы" ;
          gen, acc, ptv = "нас" ;
          dat = "нам" ;
          ins = "нами" ;
          prep, loc = "нас" ;
          poss = doPossessivePronPlP1P2 "наш"
        } ;
        Ag GPl P2 => {
          nom, voc = "вы" ;
          gen, acc, ptv = "вас" ;
          dat = "вам" ;
          ins = "вами" ;
          prep, loc = "вас" ;
          poss = doPossessivePronPlP1P2 "ваш"
        } ;
        Ag GPl P3 => {
          nom, voc = "они" ;
          gen, acc, ptv = "их" ;   -- TODO: n
          dat = "им" ;   -- TODO: n
          ins = "ими" ;   -- TODO: n
          prep, loc = "них" ;
          poss = doPossessivePronP3 "их"
        }
      } ;

-- Possessive pronouns are more like adjectives

  doPossessivePronSgP1P2 : Str -> PronForms
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

  doPossessivePronPlP1P2 : Str -> PronForms
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

  doPossessivePronP3 : Str -> PronForms
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
      poss = nullPron.poss ;
      a = forms.a
    } ;

  doReflexivePron : Str -> Agr -> PronounForms
    -- Nominative is not strictly correct, but also usually not needed
    = \nom,a -> {
      nom=nom ; gen="себя" ; dat="себе" ; acc="себя" ; ins="собой" ; prep="себе" ;
      poss=doPossessivePronSgP1P2 "сво" ;  -- "myself's" to "my own" this may be too artificially put here...
      a=a} ;

  reflexivePron : Agr -> PronounForms
    = \a -> {a = a} **
      case a of {
        Ag (GSg Masc) _ => doReflexivePron "сам" a;
        Ag (GSg Fem) _ => doReflexivePron "сама" a;
        Ag (GSg Neut) _ => doReflexivePron "само" a;
        Ag GPl _ => doReflexivePron "сами" a
        };

  sam = pronFormsPronoun (reflexivePron (Ag (GSg Masc) P3)) ;

  all_Pron = pronoun2AstB "весь" ;
  only_Pron = guessAdjectiveForms "единственный" ;

---------------
-- Numerals -- Числительные
---------------

param DForm = unit | teen | ten | hund ;
param Place = attr | indep ;
-- param Size  = nom | nompl | sgg | plg ;
oper mille : NumSize => Str = table {
  Num1 => "тысяча" ;
  Num2_4 => "тысячи" ;   -- NumAll ?
  _     => "тысяч"} ;

---------------
-- Adverbs -- Наречия

  Adverb = { s : Str ; } ;

  makeAdverb : Str -> Adverb
    = \word -> {s=word} ;

--------------------------------
-- combining nouns with numerals

oper
  DetTable = Gender => Animacy => Case => Str ;

  NumDet : Type = {  -- определяемое слово
    s : DetTable ;
    size : NumSize
    } ;


-- TODO From po-file Forms:
-- (n%10==1 && n%100!=11 ? Num1 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? Num2_4 : Num5 );
--   numSizeForm : (Number => Case => Str) -> NumSize -> Case -> Str ;  -- TODO:
--   numSizeAgr : Gender -> NumSize -> Person -> Agr ; -- TODO

  numSizeNumber : NumSize -> Number
    = \ns -> case ns of {
      Num1 => Sg ;
      NumAll => Pl ;
      Num2_4 => Pl ;
      Num5 => Pl
    } ;

oper -- TODO:
  ComplementCase : Type = {s : Str ; c : Case ; hasPrep : Bool} ;


----------------
-- Clauses

}
