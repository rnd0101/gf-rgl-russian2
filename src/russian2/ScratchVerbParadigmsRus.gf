--# -coding=utf-8
-- manual for now, may be generated from the ru.wiktionary dump in the future


Verb : Type = {
  stem1,
  stem2,
  stem3,
  stem4,
  stem5 : Str ;
  e : VerbConjClass
} ;

VerbConjClass : Type = {
    inf,
    pressg1,
    pressg2,
    pressg3,
    prespl1,
    prespl2,
    prespl3,
    pastpartsg,
    pastpartpl,
    passpart : Str
} ;


verbAuxVerb(mood_etc) ++ verbStemChoice(v, arg_params) ++ BIND ++ verbAgr(v.e, agr_params) ++ verbParticle(mood_etc)





  z5b_irreg : VerbConjClass ;
  z2 : VerbConjClass ;
  z3 : VerbConjClass ;
  z4 : VerbConjClass ;
-- ...

oper declVerb: VerbConjClass -> Str -> Str -> Str -> Str -> Str -> Verb =


   mkV = \asp, sgP1, sgP2, sgP3, plP1, plP2, plP3,
     sgMascPast, imperSgP2, inf -> case asp of {
       Perfective  =>
         mkVerbPerfective inf imperSgP2
         (presentConj sgP1 sgP2 sgP3 plP1 plP2 plP3) (pastConj sgMascPast)
         ** {    lock_V=<> };
       Imperfective  =>
         mkVerbImperfective inf imperSgP2
         (presentConj sgP1 sgP2 sgP3 plP1 plP2 plP3) (pastConj sgMascPast)
         ** {    lock_V=<> }
        };





oper mkV z5b_irreg,


  {{гл ru 5b^
|основа=сто
|основа1=сто́
|слоги={{по-слогам|сто|я́ть}}
|НП=1
|соотв=постоять
}}

  mkV

  z_5b_irreg : (_,_ : Str) ->



260-  c66 : Str -> VForms -- 268 öristä
261:    = \s -> cKuunnella s (Predef.tk 2 s + "in") ;
262-  c66A : Str -> VForms -- 3 vavista
263:    = \s -> cKuunnella s (strongGrade (Predef.tk 3 s) + "sin") ;
264-  c67 : Str -> VForms -- 704 ällistellä
265:    = \s -> cKuunnella s (Predef.tk 2 s + "in") ;
266-  c67A : Str -> VForms -- 634 äännellä
267:    = \s -> cKuunnella s (strongGrade (Predef.tk 3 s) + "lin") ;


  cKuunnella : (_,_ : Str) -> VForms = \kuunnella,kuuntelin ->
    let
      a       = last kuunnella ;
      kuunnel = Predef.tk 2 kuunnella ;
      kuuntel = Predef.tk 2 kuuntelin ;
      u       = uyHarmony a ;
      l       = last kuunnel
    in vForms12
      kuunnella
      (kuuntel + "en")
      (kuuntel + "ee")
      (kuuntel + "ev" + a + "t")
      (kuunnel + "k" + a + a)
      (kuunnella + a + "n")
      (kuuntel + "in")
      (kuuntel + "i")
      (kuuntel + "isi")
      (kuunnel + l + u + "t")
      (kuunnel + "t" + u)
      (kuunnel + l + "ee") ;

    VForms : Type = Predef.Ints 11 => Str ;

    vForms12 : (x1,_,_,_,_,_,_,_,_,_,_,x12 : Str) -> VForms =
      \olla,olen,on,ovat,olkaa,ollaan,olin,oli,olisi,ollut,oltu,lienee ->
      table {
        0 => olla ;
        1 => olen ;
        2 => on ;
        3 => ovat ;
        4 => olkaa ;
        5 => ollaan ;
        6 => olin ;
        7 => oli ;
        8 => olisi ;
        9 => ollut ;
       10 => oltu ;
       11 => lienee
      } ;

    vforms2V : VForms -> Verb ** {qp : Bool} = \vh ->
    let
      tulla = vh ! 0 ;
      tull = init tulla ;
      tulen = vh ! 1 ;
      tulee = vh ! 2 ;
      tulevat = vh ! 3 ;
      tulkaa = vh ! 4 ;
      tullaan = vh ! 5 ;
      tulin = vh ! 6 ;
      tuli = vh ! 7 ;
      tulisi = vh ! 8 ;
      tullut = vh ! 9 ;
      tultu = vh ! 10 ;
      tult = init tultu ;
      lienee = vh ! 11 ;
      tule_ = init tulen ;
      tuli_ = init tulin ;
      a = last tulkaa ;
      tulko = Predef.tk 2 tulkaa + (ifTok Str a "a" "o" "ö") ;
      o = last tulko ;
      tulkoo = tulko + o ;
      tullee = Predef.tk 2 tullut + "ee" ;
      tulleen = (nForms2N (dOttanut tullut)).s ;
      tullu : Str = weakGrade tultu ;
      tullun  = (nForms2N (dUkko tultu (tullu + "n"))).s ;
      tule__ = Predef.tk 3 tulevat ;
      tulema = tule__ + "m" + a ;
      tuleva = tule__ + "v" + a ;
      vat = "v" + a + "t" ;
      liene = init lienee ;
      tulta = tult + a ;
      tulevaP = (noun2adj (nhn (sKukko tuleva (tuleva + "n") (init tuleva + "i" + a)))).s  ;
      tultavaP = (noun2adj (nhn (sKukko (tulta + "v" + a) (tulta + "v" + a + "n") (tulta + "vi" + a)))).s  ;
      tulemaP = (noun2adj (nhn (sKukko tulema (tulema + "n") (init tulema + "i" + a)))).s  ;

    in
    {s = table {
      Inf Inf1 => tulla ;
      Inf Inf1Long => tulla + "kse" ;
      Inf Inf2Iness => tull + "ess" + a ;
      Inf Inf2Instr => tull + "en" ;
      Inf Inf2InessPass => tult + a + "ess" + a ;
      Inf Inf3Iness => tulema + "ss" + a ;
      Inf Inf3Elat  => tulema + "st" + a ;
      Inf Inf3Illat => tulema +  a   + "n" ;
      Inf Inf3Adess => tulema + "ll" + a ;
      Inf Inf3Abess => tulema + "tt" + a ;
      Inf Inf3Instr => tulema + "n" ;
      Inf Inf3InstrPass => tult + a + "m" + a + "n" ;
      Inf Inf4Nom   => tule__ + "minen" ;
      Inf Inf4Part  => tule__ + "mist" + a ;
      Inf Inf5      => tulema + "isill" + a ;
      Inf InfPresPart => tuleva + "n" ;
      Inf InfPresPartAgr => tuleva ;
      Presn Sg P1 => tule_ + "n" ;
      Presn Sg P2 => tule_ + "t" ;
      Presn Sg P3 => tulee ;
      Presn Pl P1 => tule_ + "mme" ;
      Presn Pl P2 => tule_ + "tte" ;
      Presn Pl P3 => tulevat ;
      Impf Sg P1  => tuli_ + "n" ;   --# notpresent
      Impf Sg P2  => tuli_ + "t" ;  --# notpresent
      Impf Sg P3  => tuli ;  --# notpresent
      Impf Pl P1  => tuli_ + "mme" ;  --# notpresent
      Impf Pl P2  => tuli_ + "tte" ;  --# notpresent
      Impf Pl P3  => tuli + vat ;  --# notpresent
      Condit Sg P1 => tulisi + "n" ;  --# notpresent
      Condit Sg P2 => tulisi + "t" ;  --# notpresent
      Condit Sg P3 => tulisi ;  --# notpresent
      Condit Pl P1 => tulisi + "mme" ;  --# notpresent
      Condit Pl P2 => tulisi + "tte" ;  --# notpresent
      Condit Pl P3 => tulisi + vat ;  --# notpresent
      Potent Sg P1 => liene + "n" ;  --# notpresent
      Potent Sg P2 => liene + "t" ;  --# notpresent
      Potent Sg P3 => lienee ;  --# notpresent
      Potent Pl P1 => liene + "mme" ;  --# notpresent
      Potent Pl P2 => liene + "tte" ;  --# notpresent
      Potent Pl P3 => liene + vat ;  --# notpresent
      PotentNeg    => liene ;  --# notpresent
      Imper Sg   => tule_ ;
      Imper Pl   => tulkaa ;
      ImperP3 Sg => tulkoo + "n" ;
      ImperP3 Pl => tulkoo + "t" ;
      ImperP1Pl  => tulkaa + "mme" ;
      ImpNegPl   => tulko ;
      PassPresn True  => tullaan ;
      PassPresn False => Predef.tk 2 tullaan ;
      PassImpf  True  => tult + "iin" ;  --# notpresent
      PassImpf  False => tultu ;  --# notpresent
      PassCondit  True  => tult + a + "isiin" ;  --# notpresent
      PassCondit  False => tult + a + "isi" ;  --# notpresent
      PassPotent True  => tult + a + "neen" ; --# notpresent
      PassPotent False => tult + a + "ne" ; --# notpresent
      PassImper True   => tult + a + "k" + o + o + "n" ;
      PassImper False  => tult + a + "k" + o ;

      PresPartAct a  => tulevaP ! a ;
      PresPartPass a => tultavaP ! a ;
      PastPartAct (AN n)  => tulleen ! n ;
      PastPartAct AAdv    => tullee + "sti" ;
      PastPartPass (AN n) => tullun ! n ;
      PastPartPass AAdv   => tullu + "sti" ;
      AgentPart a => tulemaP ! a
      } ;
    sc = NPCase Nom ;
    qp = pbool2bool (Predef.eqStr (last tulko) "o") ;
    lock_V = <>
    } ;



lin saada_V = mkV {s = c63 "saada"} ;
