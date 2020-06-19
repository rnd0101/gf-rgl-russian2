--# -path=.:../abstract:../common:../../prelude

concrete CatRus of Cat = CommonX ** open ResRus, ParamRus, Prelude in {
flags coding=utf8 ; optimize=all ;

  lincat
    Num, Numeral, Card, Digits = Determiner ;

    N = ResRus.NounForms ;
    A, Ord = ResRus.AdjForms ;
    CN = ResRus.Noun ;
    Pron = ResRus.PronForms ;

  -- TODO: below copy-paste, sort out


    S   = {s : Str} ;
    Cl  = {subj,clit,compl : Str ; verb : VerbForms ; a : Agr} ;
    Comp = {s : Agr => Str} ;

    QS  = {s : Str} ; ---- TODO: indirect questions
    QCl = {subj,clit,compl : Str ; verb : VerbForms ; a : Agr} ; -- = Cl ---- check if enough

    RS  = {s : Agr => Str} ;
    RCl = {subj,clit,compl : Agr => Str ; verb : VerbForms} ; ---- RAgr with composite RP
    RP  = AdjForms ;

    VP = {verb : VerbForms ; clit,compl : Agr => Str} ; ---- more fields probably needed
    VPSlash = {verb : VerbForms ; clit,compl : Agr => Str ; c : ComplementCase} ; ----
    V  = ResRus.VerbForms ;
    V2 = ResRus.VerbForms ** {c : ComplementCase} ;

    AP = ResRus.Adjective ** {isPost : Bool} ; -- {s : Gender => Number => Case => Str}
    A2 = ResRus.AdjForms ** {c : ComplementCase} ;

    NP = {s : Case => Str ; a : Agr } ;
    PN = {s : Case => Str ; g : Gender} ;
    Det = Determiner ; -- {s : Gender => Case => Str ; size : NumSize} ; -- can contain a numeral, therefore NumSize
    Quant = {s : Gender => Number => Case => Str} ; -- same as AP

    Prep = ResRus.ComplementCase ; -- {s : Str ; c : Case ; hasPrep : Bool} ;
    Conj = {s1,s2 : Str} ; ---- may need a number


  linref
    N = \s -> s.snom ;
    A = \s -> s.msnom ;

}
