concrete CatRus of Cat = CommonX - [Temp,Tense]  ** open ResRus, ParamRus, Prelude in {
flags coding=utf8 ; optimize=all ;
  lincat
    Num, Numeral, Card, Digits = Determiner ;

    N, PN = ResRus.NounForms ;
    N2 = ResRus.Noun2Forms ;
    N3 = ResRus.Noun3Forms ;

    A, Ord = ResRus.AdjForms ;
    A2 = ResRus.AdjForms ** {c : ComplementCase} ;

    Pron = ResRus.PronounForms ;

    V  = ResRus.VerbForms ;
    V2 = ResRus.VerbForms ** {c : ComplementCase} ;

    CN = ResRus.Noun ;

    NP = {s, prep : Case => Str ; a : Agr } ;
    VP = {verb : ResRus.VerbForms ; compl : AgrTable} ; ---- more fields probably needed (adverbials?)
    VPSlash = {verb : ResRus.VerbForms ; compl : AgrTable ; c : ComplementCase} ; ----

    AP = ResRus.Adjective ** {isPost : Bool} ;

    Clause = {s : Polarity => ClForm => Str} ;

  -- TODO: below copy-paste, sort out (eg, clitics are not needed)
    S   = {s : Str} ;
    Cl  = {subj,compl : Str ; verb : VerbForms ; a : Agr} ;
    Comp = {s : AgrTable} ;

    Temp  = {s : Str ; t : RusTense ; a : Anteriority} ;
    Tense = {s : Str ; t : RusTense} ;

    QS  = {s : Str} ; ---- TODO: indirect questions
    QCl = {subj,compl : Str ; verb : VerbForms ; a : Agr} ; -- = Cl ---- check if enough

    RS  = {s : AgrTable} ;
    RCl = {subj,compl : AgrTable ; verb : VerbForms} ; ---- RAgr with composite RP
    RP  = AdjForms ;

    Det = Determiner ; -- {s : Gender => Case => Str ; size : NumSize} ; -- can contain a numeral, therefore NumSize
    Predet, Quant = ResRus.Adjective ;

    Prep = ResRus.ComplementCase ; -- {s : Str ; c : Case ; hasPrep : Bool} ;
    Conj = {s1,s2 : Str ; n : Number} ;

  linref
    N = \s -> s.snom ;
    PN = \s -> s.snom ;
    N2 = \s -> s.snom ++ s.c2.s;   -- TODO
    N3 = \s -> s.snom ++ s.c2.s ++ s.c3.s;   -- TODO
    A = \s -> s.msnom ;
    V = \s -> s.inf ;
    V2 = \s -> s.inf ;

}
