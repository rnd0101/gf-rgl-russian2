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

  immutableNounForms : Str -> Gender -> Animacy -> NounForms
    = \s, g, a -> noMinorCases (immutableNounCases s g a ) ;

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

  mkFun : NounForms -> ComplementCase -> Noun2Forms = \f, p -> f ** {c2 = p} ;
  mkFun2 : NounForms -> ComplementCase -> ComplementCase -> Noun3Forms = \f, p2, p3 -> f ** {c2=p2; c3=p3} ;

  ellNoun : NounForms -> NounForms
   = \n -> noMinorCases (immutableNounCases "" n.g n.a) ;

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
        <Ind, Past> => verbPastAgree vf a "";
        <Ind, Pres> => verbPresAgree vf a "";
        <Ind, Fut> => verbFutAgree vf a "";
        <Ind, Cond> => verbPastAgree vf a "бы" ;
        <Sbjv, _> => verbPastAgree vf a "бы" ;
        <Imperative, _> => verbImperativeAgree vf a "" ;
        <Infinitive, _> => <"",vf.inf>
      } ;

  selectCase : (Case => Str) -> ComplementCase -> Str
    = \np,prep -> prep.s ++ np ! prep.c ;  -- TODO: NP - pronoun special treatment

  from2 = {s="из"; c=Gen; hasPrep=True} ;

---------------------------
-- Adjectives -- Прилагательные

  AdjTable = GenNum => Animacy => Case => Str ;

  Adjective : Type = {
    s : AdjTable ;
    short : AgrTable ;
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
      short = adjFormsToShort forms ;
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

  makeAdjectiveForms : Str -> Str -> Str -> ShortFormPreference -> AdjForms
    = \nom, comp, zi, spf ->
        let af = makeAdjective nom (parseAdjIndex zi) spf in
        let comp' = case (Predef.length comp) of {0 => af.comp; _ => comp} in
        af ** {comp=comp'} ;

  makeAdjectiveFromNoun : Noun -> Adjective
    = \n -> {
       s = \\gn,anim,cas=> n.s ! numGenNum gn ! cas ;
       short=\\a=>[] ;
       preferShort=PrefFull
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
    pppsm, pppsf, pppsn, pppsp,   -- past passive participle. Here only short forms
    prtr, ptr  -- present and past transgressives (converbs)
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
      let stem_info = infStemFromVerb word in  -- remove reflexive postfix as well
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
        pppsm=stem  + "н";
        pppsf=stem  + "на";
        pppsn=stem  + "но";
        pppsp=stem  + "ны";
        prtr=stem   + "я" ;
        ptr=stem    + "в" ;  -- there is a variant "-вши" also
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
      prtr="" ;
      ptr=""  ;
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
      prtr=vf.prtr ++ BIND ++ post.prtr ;
      ptr=vf.ptr ++ BIND ++ "шись" ;
      asp=vf.asp ;
      refl=vf.refl ;
      tran=vf.tran
      } ;

  concatVebForms : VerbForms -> Str -> VerbForms
    = \vf,s -> {
      inf=vf.inf ++ s ;
      prsg1=vf.prsg1 ++ s ;
      prsg2=vf.prsg2 ++ s ;
      prsg3=vf.prsg3 ++ s ;
      prpl1=vf.prpl1 ++ s ;
      prpl2=vf.prpl2 ++ s ;
      prpl3=vf.prpl3 ++ s ;
      futsg1=vf.futsg1 ++ s ;
      futsg2=vf.futsg2 ++ s ;
      futsg3=vf.futsg3 ++ s ;
      futpl1=vf.futpl1 ++ s ;
      futpl2=vf.futpl2 ++ s ;
      futpl3=vf.futpl3 ++ s ;
      psgm=vf.psgm ++ s ;
      psgf=vf.psgf ++ s ;
      psgn=vf.psgn ++ s ;
      ppl=vf.ppl ++ s ;
      isg2=vf.isg2 ++ s ;
      ipl1=vf.ipl1 ++ s ;
      ipl2=vf.ipl2 ++ s ;
      pppsm=vf.pppsm ++ s ;
      pppsf=vf.pppsf ++ s ;
      pppsn=vf.pppsn ++ s ;
      pppsp=vf.pppsp ++ s ;
      prtr=vf.prtr ++ s ;
      ptr=vf.ptr ++ s ;
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

  copula : VerbForms
    = {
      inf="быть";
      prsg1="—";
      prsg2="—";
      prsg3="есть";
      prpl1="—";
      prpl2="—";
      prpl3="—";   -- also "суть"
      futsg1="буду";
      futsg2="будешь";
      futsg3="будет";
      futpl1="будем";
      futpl2="будете";
      futpl3="будут";
      psgm="был";
      psgf="была";
      psgn="было";
      ppl ="были";
      isg2="будь";
      ipl1="давайте будем";
      ipl2="будьте";
      pppsm="";
      pppsf="";
      pppsn="";
      pppsp="";
      prtr="будучи";
      ptr="быв";
      asp=Imperfective;
      refl=NonReflexive;
      tran=Intransitive
    } ;

  -- normal copula require Nom in Pres. So this is Ins-friendly substitute.
  -- TODO: Provide also Nom-based as idiomatic (?)
  copulaIns : VerbForms
    = copula ** {
      prsg1="являюсь" ;
      prsg2="являешься" ;
      prsg3="является" ;
      prpl1="являемся" ;
      prpl2="являетесь" ;
      prpl3="являются"
    } ;

  copulaEll : VerbForms
    = copula ** {
      prsg1="" ;
      prsg2="" ;
      prsg3="" ;
      prpl1="" ;
      prpl2="" ;
      prpl3=""
    } ;

  selectCopula : CopulaType -> VerbForms
    = \cop -> case cop of {
       NomCopula => copula ;
       EllCopula => copulaEll ;
       InsCopula => copulaIns
    } ;

  can : VerbForms
    = {
      inf="мочь";
      prsg1="могу";
      prsg2="можешь";
      prsg3="может";
      prpl1="можем";
      prpl2="можете";
      prpl3="могут";
      futsg1="смогу";  -- from the perfective counterpart, only for aux verb use here
      futsg2="сможешь";
      futsg3="сможет";
      futpl1="сможем";
      futpl2="сможете";
      futpl3="смогут";
      psgm="мог";
      psgf="могла";
      psgn="могло";
      ppl ="могли";
      isg2="будь способен";  -- some improvisation here
      ipl1="давайте будем способны";
      ipl2="будьте способны";
      pppsm="";
      pppsf="";
      pppsn="";
      pppsp="";
      prtr="";
      ptr="могши";
      asp=Imperfective;
      refl=NonReflexive;
      tran=Intransitive
    } ;

  want : VerbForms
    = {
      inf="хотеть";
      prsg1="хочу";
      prsg2="хочешь";
      prsg3="хочет";
      prpl1="хотим";
      prpl2="хотите";
      prpl3="хотят";
      futsg1="захочу";  -- from the perfective counterpart, only for aux verb use here
      futsg2="захочешь";
      futsg3="захочет";
      futpl1="захотим";
      futpl2="захотите";
      futpl3="захотят";
      psgm="хотел";
      psgf="хотела";
      psgn="хотело";
      ppl ="хотели";
      isg2="хоти";    -- *
      ipl1="давайте будем хотеть";
      ipl2="хотите";  -- *
      pppsm="";
      pppsf="";
      pppsn="";
      pppsp="";
      prtr="хотя";
      ptr="хотев";
      asp=Imperfective;
      refl=NonReflexive;
      tran=Transitive
    } ;


  nullVerb : VerbForms
    = {
      inf,
      prsg1, prsg2, prsg3, prpl1, prpl2, prpl3,
      futsg1, futsg2, futsg3, futpl1, futpl2, futpl3,
      psgm, psgf, psgn, ppl,
      isg2, ipl1, ipl2,
      pppsm, pppsf, pppsn, pppsp,
      prtr, ptr ="";
      asp=Imperfective;
      refl=NonReflexive;
      tran=Intransitive
    } ;

  adjFormsToShort : AdjForms -> AgrTable
    = \af -> table {
      Ag (GSg Fem) _ => af.sf ;
      Ag (GSg Masc) _ => af.sm ;
      Ag (GSg Neut) _ => af.sn ;
      Ag GPl _ => af.sp
    } ;

---------------------------
-- Pronouns -- Местоимения

  PronounForms : Type = {
    nom, gen, dat, acc, ins, prep : Str ;
    poss : PronForms ;
    a : Agr
  } ;

  IPronounForms : Type = PronounForms ** {anim : Animacy} ;

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

  selectPronCase : PronounForms -> Case -> Str
    = \forms,cas -> case cas of {
      (Nom | VocRus) => forms.nom ;
      (Gen | Ptv)    => forms.gen ;
      Dat            => forms.dat ;
      Acc            => forms.acc ;
      Ins            => forms.ins ;
      (Pre | Loc)    => forms.prep
    } ;

  pronFormsPronoun : PronounForms -> Pronoun
    = \forms -> {
      s = \\cas => selectPronCase forms cas ;
      poss = mkPronTable forms.poss ;
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

  vse : PronounForms = {
    nom="все" ; gen="всех" ; dat="всем" ; acc="всех" ; ins="всеми" ; prep="всех" ;
    poss=all_Pron ;
    a=Ag GPl P3
    } ;

  vse_ina : PronounForms = {
    nom="всё" ; gen="всего" ; dat="всему" ; acc="всё" ; ins="всем" ; prep="всём" ;
    poss=all_Pron ;
    a=Ag (GSg Neut) P3
    } ;

  doChPron : Str -> Agr -> Animacy -> IPronounForms  -- что, ничто
    = \ch, a, anim -> {  -- "ч", "нич"
      a = a ;
      anim=anim ;
      nom, voc = ch + "то" ;
      gen, acc, ptv = ch + "его" ;
      dat = ch + "ему" ;
      prep, loc = ch + "ём" ;
      ins = ch + "ем" ;
      poss = {
        msnom = ch + "ей" ;
        fsnom = ch + "ья" ;
        nsnom = ch + "ьё" ;
        pnom = ch + "ьи" ;
        msgen = ch + "ьего" ;
        fsgen = ch + "ьей" ;
        pgen  = ch + "ьих" ;
        msdat = ch + "ьему" ;
        fsacc = ch + "ью" ;
        msins = ch + "ьим" ;
        fsins = ch + "ьей" ;
        pins  = ch + "ьими" ;
        msprep = ch + "ьём"
      }
    } ;

  doKPron : Str -> Agr -> Animacy -> IPronounForms  -- кто, никто
    = \ch, a, anim ->   -- "к", "ник"
      let subPoss = (Predef.tk 1 ch) + "ч" in {
      a = a ;
      anim=anim ;
      nom, voc = ch + "то" ;
      gen, acc, ptv = ch + "ого" ;
      dat = ch + "ому" ;
      prep, loc = ch + "ом" ;
      ins = ch + "ем" ;
      poss = (doChPron subPoss a anim).poss
    } ;

  doKotoryjPron : Str -> Agr -> Animacy -> IPronounForms
    = \w, a, anim ->   -- "который", "некоторый"
      let stem = (Predef.tk 2 w) in {
      a = a ;
      anim=anim ;
      nom, voc = stem + "ое" ;
      gen, acc, ptv = stem + "ого" ;
      dat = stem + "ому" ;
      prep, loc = stem + "ом" ;
      ins = stem + "ым" ;
      poss = guessAdjectiveForms w
    } ;

  prependIP : Str -> IPronounForms -> IPronounForms
    = \s,ip -> ip ** {
      nom=s ++ ip.nom ;
      gen=s ++ ip.gen ;
      dat=s ++ ip.dat ;
      acc=s ++ ip.acc ;
      ins=s ++ ip.ins ;
      prep=s ++ ip.prep ;
      poss={
        msnom = s ++ ip.poss.msnom ;
        fsnom = s ++ ip.poss.fsnom ;
        nsnom = s ++ ip.poss.nsnom ;
        pnom  = s ++ ip.poss.pnom ;
        msgen = s ++ ip.poss.msgen ;
        fsgen = s ++ ip.poss.fsgen ;
        pgen  = s ++ ip.poss.pgen ;
        msdat = s ++ ip.poss.msdat ;
        fsacc = s ++ ip.poss.fsacc ;
        msins = s ++ ip.poss.msins ;
        fsins = s ++ ip.poss.fsins ;
        pins  = s ++ ip.poss.pins ;
        msprep= s ++ ip.poss.msprep ;
      }
    } ;

  appendToIP : IPronounForms -> Str -> IPronounForms
    = \ip,s -> ip ** {
      nom=ip.nom ++ s;
      gen=ip.gen ++ s;
      dat=ip.dat ++ s;
      acc=ip.acc ++ s;
      ins=ip.ins ++ s;
      prep=ip.prep ++ s;
      poss={
        msnom = ip.poss.msnom ++ s;
        fsnom = ip.poss.fsnom ++ s;
        nsnom = ip.poss.nsnom ++ s;
        pnom  = ip.poss.pnom ++ s;
        msgen = ip.poss.msgen ++ s;
        fsgen = ip.poss.fsgen ++ s;
        pgen  = ip.poss.pgen ++ s;
        msdat = ip.poss.msdat ++ s;
        fsacc = ip.poss.fsacc ++ s;
        msins = ip.poss.msins ++ s;
        fsins = ip.poss.fsins ++ s;
        pins  = ip.poss.pins ++ s;
        msprep= ip.poss.msprep ++ s;
      }
    } ;

  nounToNounForm : Noun -> NounForms
    = \n -> {
      snom=n.s ! Sg ! Nom ;
      sgen=n.s ! Sg ! Gen ;
      sdat=n.s ! Sg ! Dat ;
      sacc=n.s ! Sg ! Acc ;
      sins=n.s ! Sg ! Ins ;
      sprep=n.s ! Sg ! Pre ;
      sloc=n.s ! Sg ! Loc ;
      sptv=n.s ! Sg ! Ptv ;
      svoc=n.s ! Sg ! VocRus ;
      pnom=n.s ! Pl ! Nom ;
      pgen=n.s ! Pl ! Gen ;
      pdat=n.s ! Pl ! Dat ;
      pacc=n.s ! Pl ! Acc ;
      pins=n.s ! Pl ! Ins ;
      pprep=n.s ! Pl ! Pre ;
      ploc=n.s ! Pl ! Loc ;
      pptv=n.s ! Pl ! Ptv ;
      pvoc=n.s ! Pl ! VocRus ;
      g=n.g ;
      a=n.anim
    } ;

  caseTableToRecord : (Case => Str) -> Agr -> Animacy -> IPronounForms
    = \ct,a,anim -> {
      nom=ct ! Nom ;
      gen=ct ! Gen ;
      dat=ct ! Dat ;
      acc=ct ! Acc ;
      ins=ct ! Ins ;
      prep=ct ! Pre ;
      poss={
        msnom = [] ;
        fsnom = [] ;
        nsnom = [] ;
        pnom  = [] ;
        msgen = [] ;
        fsgen = [] ;
        pgen  = [] ;
        msdat = [] ;
        fsacc = [] ;
        msins = [] ;
        fsins = [] ;
        pins  = [] ;
        msprep= [] ;
      } ;
      a=a ;
      anim=anim
    } ;

  that_forms = {
    msnom, sm = "тот" ;
    fsnom, sf = "та" ;
    nsnom, sn = "то" ;
    pnom, sp = "те" ;
    msgen = "того" ;
    fsgen = "той" ;
    pgen  = "тех" ;
    msdat = "тому" ;
    fsacc = "ту" ;
    msins = "тем" ;
    fsins = "той" ;
    pins  = "тех" ;
    msprep = "том" ;
    preferShort = PrefFull ;
    comp = []
    } ;

  this_forms = {
    msnom, sm = "этот" ;
    fsnom, sf = "эта" ;
    nsnom, sn = "это" ;
    pnom, sp = "эти" ;
    msgen = "этого" ;
    fsgen = "этой" ;
    pgen  = "этих" ;
    msdat = "этому" ;
    fsacc = "эту" ;
    msins = "этим" ;
    fsins = "этой" ;
    pins  = "этих" ;
    msprep = "этом" ;
    preferShort = PrefFull ;
    comp = []
    } ;

---------------
-- Numerals -- Числительные
---------------

param DForm = unit | teen | ten | hund ;
param Place = attr | indep ;
oper
  mille : NumSize => Str = table {
    Num1 => "тысяча" ;
    Num2_4 => "тысячи" ;   -- NumAll ?
    _     => "тысяч"
    } ;
  sizeNumCase : (Number => Case => Str) -> NumSize -> Str
    = \nt,size -> case size of {
      Num1 => nt ! Sg ! Nom ;
      Num2_4 => nt ! Sg ! Gen ;   --?
      Num5 => nt ! Pl ! Gen ;
      NumAll => nt ! Pl ! Nom
    } ;

---------------
-- Adverbs -- Наречия

  Adverb = { s : Str ; } ;

  makeAdverb : Str -> Adverb
    = \word -> {s=word} ;

--------------------------------
-- combining nouns with numerals

oper
  DetTable = Gender => Animacy => Case => Str ;

  NumDet : Type = {
    s : DetTable ;
    size : NumSize
    } ;

  -- Number from size to be used in agreement after numeral has been applied
  numSizeNumber : NumSize -> Number
    = \ns -> case ns of {Num1 => Sg ; NumAll | Num2_4 | Num5 => Pl} ;

  -- The following two used in tandem to form the word, controlled by numeral
  numSizeNum : NumSize -> Number
    = \ns -> case ns of {Num1 | Num2_4 => Sg ; Num5 | NumAll => Pl} ;
  numSizeCase : NumSize -> Case
    = \ns -> case ns of {Num1 | NumAll => Nom ; Num2_4 | Num5 => Gen} ;

oper -- TODO:
  ComplementCase : Type = {s : Str ; c : Case ; hasPrep : Bool} ;


----------------
-- Clauses

}
