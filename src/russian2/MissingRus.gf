resource MissingRus = open GrammarRus, Prelude in {

-- temporary definitions to enable the compilation of RGL API0
oper CompIAdv : IAdv -> IComp = notYet "CompIAdv" ;
oper ComplN3 : N3 -> NP -> N2 = notYet "ComplN3" ;
oper ComplVQ : VQ -> QS -> VP = notYet "ComplVQ" ;
oper ComplVS : VS -> S -> VP = notYet "ComplVS" ;
oper DetQuantOrd : Quant -> Num -> Ord -> Det = notYet "DetQuantOrd" ;
oper EmbedVP : VP -> SC = notYet "EmbedVP" ;
oper OrdDigits : Digits -> Ord = notYet "OrdDigits" ;
oper OrdNumeral : Numeral -> Ord = notYet "OrdNumeral" ;
oper RelCl : Cl -> RCl = notYet "RelCl" ;
oper RelNP : NP -> RS -> NP = notYet "RelNP" ;
oper SlashPrep : Cl -> Prep -> ClSlash = notYet "SlashPrep" ;
oper SlashV2A : V2A -> AP -> VPSlash = notYet "SlashV2A" ;
oper SlashV2Q : V2Q -> QS -> VPSlash = notYet "SlashV2Q" ;
oper SlashV2S : V2S -> S -> VPSlash = notYet "SlashV2S" ;
}
