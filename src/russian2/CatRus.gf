concrete CatRus of Cat = CommonX ** open ResRus, Prelude in {
flags coding=utf8 ; optimize=all ;
  lincat
    N, PN = ResRus.NounForms ;
    N2 = ResRus.Noun2Forms ;
    N3 = ResRus.Noun3Forms ;

    A, Ord = ResRus.AdjForms ;
    A2 = ResRus.AdjForms ** {c : ComplementCase} ;

    Pron = ResRus.PronounForms ;

    V  = ResRus.VerbForms ;
    V2 = ResRus.VerbForms ** {c : ComplementCase} ;

    CN = ResRus.Noun ;

    NP = {
      s : Case => Str ;
      -- , prep : Case => Str   -- what for is this neeeded?
      a : Agr } ;
    VP = {verb : ResRus.VerbForms ; compl : AgrTable} ; ---- more fields probably needed (adverbials?)
    VPSlash = {verb : ResRus.VerbForms ; compl : AgrTable ; c : ComplementCase} ; ----

    AP = ResRus.Adjective ** {isPost : Bool} ;

    S = {s : Mood => Str} ;
    Cl = {subj,compl : Str ; verb : VerbForms ; a : Agr} ;
    Imp = {s: Polarity => GenNum => Str} ;
    Comp = {s : AgrTable} ;

    Det = Determiner ;
    Predet, Quant = ResRus.Adjective ;
    -- Num, Numeral, Card, Digits = NumDet ;

    Num = {
      s : Gender => Animacy => Case => Str ;
      size: NumSize
      } ;
    Numeral, Card = {
      s : Gender => Animacy => Case => Str ;
      size: NumSize
      } ;
    Digits = {
      s : Str ;
      size: NumSize
    } ; ----


    -- TODO: below copy-paste, sort out (eg, clitics are not needed?)

    QS  = {s : Str} ; ---- TODO: indirect questions
    QCl = {subj,compl : Str ; verb : VerbForms ; a : Agr} ; -- = Cl ---- check if enough

    RS  = {s : Mood => Agr => Str ; c : Case} ;
    RCl = {subj,compl : AgrTable ; verb : VerbForms} ; ---- RAgr with composite RP
    RP  = AdjForms ;

    Prep = ResRus.ComplementCase ; -- {s : Str ; c : Case ; hasPrep : Bool} ;
    Conj = {s1,s2 : Str ; n : Number} ;

  linref
    N = \s -> s.snom ;
    PN = \s -> s.snom ;
    N2 = \s -> s.snom ++ s.c2.s ;   -- TODO
    N3 = \s -> s.snom ++ s.c2.s ++ s.c3.s ;   -- TODO
    A = \s -> case s.preferShort of {PrefShort => s.sm ; _ => s.msnom} ;
    A2 = \s -> case s.preferShort of {PrefShort => s.sm ; _ => s.msnom} ++ s.c.s ;  -- ?
    V = \s -> s.inf ;
    V2 = \s -> s.inf ;
    Ord = \s -> s.nsnom ;
    S = \s -> s.s ! Ind ;
    VP = \s -> s.verb.inf ++ s.compl ! Ag (GSg Neut) P3;      -- Are these useful?
    VPSlash = \s -> s.verb.inf ++ s.compl ! Ag (GSg Neut) P3 ++ s.c.s ; -- Are these useful?
}
