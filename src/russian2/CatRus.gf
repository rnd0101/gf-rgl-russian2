concrete CatRus of Cat = CommonX ** open ResRus, Prelude in {
flags coding=utf8 ; optimize=all ;
  lincat
    N, PN = ResRus.NounForms ;
    N2 = ResRus.Noun2Forms ;
    N3 = ResRus.Noun3Forms ;

    A, Ord = ResRus.AdjForms ;
    A2 = ResRus.AdjForms ** {c : ComplementCase} ;

    Pron = ResRus.PronounForms ;

    V = ResRus.VerbForms ;
    V2 = ResRus.VerbForms ** {c : ComplementCase} ;
    V3 = ResRus.VerbForms ** {c : ComplementCase ; c2 : ComplementCase} ;
    VV = {v : ResRus.VerbForms ; modal : AgrTable} ;
    V2V, V2S, V2Q = ResRus.VerbForms ** {c : ComplementCase} ;

    CN = ResRus.Noun ;

    NP = {
      s : Case => Str ;
      -- , prep : Case => Str   -- what for is this neeeded?
      a : Agr } ;
    VP = {
      adv : AgrTable ;  -- modals are in position of adverbials ones numgen gets fixed
      verb : ResRus.VerbForms ;
      compl : AgrTable
      } ;
    VPSlash = {
      adv : AgrTable ;  -- modals are in position of adverbials ones numgen gets fixed
      verb : ResRus.VerbForms ;
      compl : AgrTable ;
      c : ComplementCase
      } ; ----

    AP = ResRus.Adjective ** {isPost : Bool} ;

    S = {s : Mood => Str} ;
    Cl = {
      subj,compl,adv : Str ;
      verb : VerbForms ;
      a : Agr
      } ;
    ClSlash = {
      subj,compl,adv : Str ;
      verb : VerbForms ;
      a : Agr ;
      c : ComplementCase
      } ;
    Imp = {s: Polarity => GenNum => Str} ;
    Comp = {s : AgrTable ; adv : Str ; cop : CopulaType } ;

    Det = Determiner ;
    Predet = ResRus.Adjective ;
    Quant, IQuant = ResRus.Adjective ** {g: Gender; c: Case} ;
    Num, Numeral, Card = NumDet ;
    Digits = {s : Str ; size: NumSize} ; ---- TODO:

    QS  = {s : QForm => Str} ;
    QCl = {
      subj,compl,adv : Str ;
      verb : VerbForms ;
      a : Agr
      } ;

    IP = ResRus.IPronounForms ;
    IComp = {s : AgrTable ; adv : Str ; cop : CopulaType } ;
    IDet = {
      s : DetTable ;
      g : Gender ;
      size : NumSize ;
      c : Case
    } ;
    RS  = {s : Mood => Agr => Str ; c : Case} ;
    RCl = {subj,compl : AgrTable ; verb : VerbForms} ; ---- RAgr with composite RP
    RP  = AdjForms ;

    Prep = ResRus.ComplementCase ;
    Conj = {s1,s2 : Str ; n : Number} ;

  linref
    N = \s -> s.snom ;
    PN = \s -> s.snom ;
    N2 = \s -> s.snom ++ s.c2.s ;   -- TODO
    N3 = \s -> s.snom ++ s.c2.s ++ s.c3.s ;   -- TODO
    A = \s -> case s.preferShort of {PrefShort => s.sm ; _ => s.msnom} ;
    A2 = \s -> case s.preferShort of {PrefShort => s.sm ; _ => s.msnom} ++ s.c.s ;  -- ?
    V = \s -> s.inf ;
    V2 = \s -> s.inf ++ s.c.s ;
    V2V = \s -> s.inf ++ s.c.s ;
    V3 = \s -> s.inf ++ s.c.s ++ s.c2.s ;
    Ord = \s -> s.nsnom ;
    S = \s -> s.s ! Ind ;
    VP = \s -> s.adv ! Ag (GSg Neut) P3 ++ s.verb.inf ++ s.compl ! Ag (GSg Neut) P3 ;      -- Are these useful?
    Comp = \s -> copula.inf ++ s.s ! Ag (GSg Neut) P3 ++ s.adv ;
    IComp = \s -> s.s ! Ag (GSg Neut) P3 ++ s.adv ++ copula.inf;
    VPSlash = \s -> s.adv ! Ag (GSg Neut) P3 ++ s.verb.inf ++ s.compl ! Ag (GSg Neut) P3 ++ s.c.s ; -- Are these useful?
    Cl = \s -> s.subj ++ s.adv ++ s.verb.inf ++ s.compl ;
    QCl = \s -> s.subj ++ s.adv ++ s.verb.inf ++ s.compl ;
    IP = \s -> s.nom ;
}
