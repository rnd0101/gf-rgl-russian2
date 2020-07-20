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

}
