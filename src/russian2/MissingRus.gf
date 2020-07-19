resource MissingRus = open GrammarRus, Prelude in {

-- temporary definitions to enable the compilation of RGL API
oper AdvSlash : ClSlash -> Adv -> ClSlash = notYet "AdvSlash" ;
oper CleftAdv : Adv -> S -> Cl = notYet "CleftAdv" ;
oper CleftNP : NP -> RS -> Cl = notYet "CleftNP" ;
oper CompIAdv : IAdv -> IComp = notYet "CompIAdv" ;
oper ComplN2 : N2 -> NP -> CN = notYet "ComplN2" ;
oper ComplN3 : N3 -> NP -> N2 = notYet "ComplN3" ;
oper ComplVA : VA -> AP -> VP = notYet "ComplVA" ;
oper ComplVQ : VQ -> QS -> VP = notYet "ComplVQ" ;
oper ComplVS : VS -> S -> VP = notYet "ComplVS" ;
oper DetQuantOrd : Quant -> Num -> Ord -> Det = notYet "DetQuantOrd" ;
oper EmbedVP : VP -> SC = notYet "EmbedVP" ;
oper FunRP : Prep -> NP -> RP -> RP = notYet "FunRP" ;
oper ImpPl1 : VP -> Utt = notYet "ImpPl1" ;
oper OrdDigits : Digits -> Ord = notYet "OrdDigits" ;
oper OrdNumeral : Numeral -> Ord = notYet "OrdNumeral" ;
oper ProgrVP : VP -> VP = notYet "ProgrVP" ;
oper RelCl : Cl -> RCl = notYet "RelCl" ;
oper RelNP : NP -> RS -> NP = notYet "RelNP" ;
oper RelSlash : RP -> ClSlash -> RCl = notYet "RelSlash" ;
oper SlashPrep : Cl -> Prep -> ClSlash = notYet "SlashPrep" ;
oper SlashV2A : V2A -> AP -> VPSlash = notYet "SlashV2A" ;
oper SlashV2Q : V2Q -> QS -> VPSlash = notYet "SlashV2Q" ;
oper SlashV2S : V2S -> S -> VPSlash = notYet "SlashV2S" ;
oper SlashVP : NP -> VPSlash -> ClSlash = notYet "SlashVP" ;
oper SlashVS : NP -> VS -> SSlash -> ClSlash = notYet "SlashVS" ;
oper UseSlash : Temp -> Pol -> ClSlash -> SSlash = notYet "UseSlash" ;
oper UttIAdv : IAdv -> Utt = notYet "UttIAdv" ;
oper UttImpPl : Pol -> Imp -> Utt = notYet "UttImpPl" ;
oper UttImpPol : Pol -> Imp -> Utt = notYet "UttImpPol" ;
oper UttImpSg : Pol -> Imp -> Utt = notYet "UttImpSg" ;

-- diff with Slo:
oper
  AdvNP   : NP -> Adv -> NP = notYet "AdvNP";
  IdRP  : RP =  notYet "" ;                      -- which
  RelVP    : RP -> VP -> RCl = notYet "";      -- who loves John
  that_Quant : Quant = notYet "";
  this_Quant : Quant = notYet "";
  UseRCl   : Temp -> Pol -> RCl -> RS = notYet "";  -- that had not slept
}
