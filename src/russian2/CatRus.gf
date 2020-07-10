
concrete CatRus of Cat = CommonX ** open ResRus, ParamRus, Prelude in {
flags coding=utf8 ; optimize=all ;
  lincat
    Num, Numeral, Card, Digits = Determiner ;

    N, PN = ResRus.NounForms ;
    N2 = ResRus.Noun2Forms ;
    N3 = ResRus.Noun3Forms ;
    A, Ord = ResRus.AdjForms ;
    CN = ResRus.Noun ;
    Pron = ResRus.PronounForms ;

  -- TODO: below copy-paste, sort out (eg, clitics are not needed)
    S   = {s : Str} ;
    Cl  = {subj,clit,compl : Str ; verb : VerbForms ; a : Agr} ;
    Comp = {s : Agr => Str} ;

--    Cl    = {s : ResFin.Tense => Anteriority => Polarity => SType => Str} ;
--    ClSlash = {s : ResFin.Tense => Anteriority => Polarity => Str ; c2 : Compl} ;
--    Imp   = {s : Polarity => Agr => Str} ;

    QS  = {s : Str} ; ---- TODO: indirect questions
    QCl = {subj,clit,compl : Str ; verb : VerbForms ; a : Agr} ; -- = Cl ---- check if enough

    RS  = {s : Agr => Str} ;
    RCl = {subj,clit,compl : Agr => Str ; verb : VerbForms} ; ---- RAgr with composite RP
    RP  = AdjForms ;

    VP = {verb : VerbForms ; clit,compl : Agr => Str} ; ---- more fields probably needed
    VPSlash = {verb : VerbForms ; clit,compl : Agr => Str ; c : ComplementCase} ; ----
    V  = ResRus.VerbForms ;
    V2 = ResRus.VerbForms ** {c : ComplementCase} ;

    AP = ResRus.Adjective ** {isPost : Bool} ;
    A2 = ResRus.AdjForms ** {c : ComplementCase} ;

    NP = {s, prep : Case => Str ; a : Agr } ;
    Det = Determiner ; -- {s : Gender => Case => Str ; size : NumSize} ; -- can contain a numeral, therefore NumSize
    Predet, Quant = ResRus.Adjective ;

    Prep = ResRus.ComplementCase ; -- {s : Str ; c : Case ; hasPrep : Bool} ;
    Conj = {s1,s2 : Str ; n : Number} ;


  linref
  --  N = \s -> s.snom ;
    N = \s -> s.snom ++ s.sgen ++ s.sdat ++ s.sacc ++ s.sins ++ s.sprep
      ++ s.pnom ++ s.pgen ++ s.pdat ++ s.pacc ++ s.pins ++ s.pprep ;
    PN = \s -> s.snom ++ s.sgen ++ s.sdat ++ s.sacc ++ s.sins ++ s.sprep ;
    N2 = \s -> s.snom ++ s.c2.s;   -- TODO
    N3 = \s -> s.snom ++ s.c2.s  ++ s.c3.s;   -- TODO
    A = \s -> s.msnom ;
    V = \s -> s.inf ;
    V2 = \s -> s.inf ;

}
