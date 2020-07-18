resource MissingRus = open GrammarRus, Prelude in {

-- temporary definitions to enable the compilation of RGL API
oper AdNum : AdN -> Card -> Card = notYet "AdNum" ;
oper AdvIAdv : IAdv -> Adv -> IAdv = notYet "AdvIAdv" ;
oper AdvIP : IP -> Adv -> IP = notYet "AdvIP" ;
oper AdvSlash : ClSlash -> Adv -> ClSlash = notYet "AdvSlash" ;
oper CleftAdv : Adv -> S -> Cl = notYet "CleftAdv" ;
oper CleftNP : NP -> RS -> Cl = notYet "CleftNP" ;
oper CompIAdv : IAdv -> IComp = notYet "CompIAdv" ;
oper CompIP : IP -> IComp = notYet "CompIP" ;
oper ComplN2 : N2 -> NP -> CN = notYet "ComplN2" ;
oper ComplN3 : N3 -> NP -> N2 = notYet "ComplN3" ;
oper ComplVA : VA -> AP -> VP = notYet "ComplVA" ;
oper ComplVQ : VQ -> QS -> VP = notYet "ComplVQ" ;
oper ComplVS : VS -> S -> VP = notYet "ComplVS" ;
oper DetQuantOrd : Quant -> Num -> Ord -> Det = notYet "DetQuantOrd" ;
oper EmbedQS : QS -> SC = notYet "EmbedQS" ;
oper EmbedVP : VP -> SC = notYet "EmbedVP" ;
oper ExistIP : IP -> QCl = notYet "ExistIP" ;
oper FunRP : Prep -> NP -> RP -> RP = notYet "FunRP" ;
oper IdetCN : IDet -> CN -> IP = notYet "IdetCN" ;
oper IdetIP : IDet -> IP = notYet "IdetIP" ;
oper IdetQuant : IQuant -> Num -> IDet = notYet "IdetQuant" ;
oper ImpPl1 : VP -> Utt = notYet "ImpPl1" ;
oper OrdDigits : Digits -> Ord = notYet "OrdDigits" ;
oper OrdNumeral : Numeral -> Ord = notYet "OrdNumeral" ;
oper PrepIP : Prep -> IP -> IAdv = notYet "PrepIP" ;
oper ProgrVP : VP -> VP = notYet "ProgrVP" ;
oper QuestIAdv : IAdv -> Cl -> QCl = notYet "QuestIAdv" ;
oper QuestIComp : IComp -> NP -> QCl = notYet "QuestIComp" ;
oper QuestSlash : IP -> ClSlash -> QCl = notYet "QuestSlash" ;
oper QuestVP : IP -> VP -> QCl = notYet "QuestVP" ;
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
oper UttIP : IP -> Utt = notYet "UttIP" ;
oper UttQS : QS -> Utt = notYet "UttQS" ;
oper whatSg_IP : IP = notYet "whatSg_IP" ;
oper which_IQuant : IQuant = notYet "which_IQuant" ;
oper whoSg_IP : IP = notYet "whoSg_IP" ;

-- diff with Slo:
oper
  AdvNP   : NP -> Adv -> NP = notYet "AdvNP";
  IdRP  : RP =  notYet "" ;                      -- which
  -- QuestCl     : Cl -> QCl = notYet "";            -- does John walk
  RelVP    : RP -> VP -> RCl = notYet "";      -- who loves John
  that_Quant : Quant = notYet "";
  this_Quant : Quant = notYet "";
  UseQCl   : Temp -> Pol -> QCl -> QS = notYet "";  -- who had not slept
  UseRCl   : Temp -> Pol -> RCl -> RS = notYet "";  -- that had not slept
}
