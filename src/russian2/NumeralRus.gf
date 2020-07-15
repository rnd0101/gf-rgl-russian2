concrete NumeralRus of Numeral = CatRus [Numeral,Digits] ** open
    ResRus,
    Prelude
  in {

---- TODO: this is semi-mechanically produced from Slovak - need to reuse old NumeralRus
---- TODO ordinal forms

oper LinNumeral = Determiner ; -- {s : NumeralForms ; size : NumSize} ;
oper LinDigit = {unit : Gender => Case => Str ; teen, ten, hundred : Str ; size : NumSize} ;

lincat Digit = LinDigit ;
lincat Sub10 = LinDigit ;

lincat Sub100 = LinNumeral ;
lincat Sub1000 = LinNumeral ;
lincat Sub1000000 = LinNumeral ;

oper mkNum : Determiner -> Str -> Str -> Str -> LinDigit =
  \dva, dvenadts, dvadsat, dvesti -> {
    unit = dva.s ;
    teen = dvenadts + "náct" ;
    ten  = dvadsat ;
    hundred = dvesti ;
    size = dva.size ;
   } ;

oper mk2Num : Determiner -> Str -> Str -> Str -> LinDigit =
  \unit, teenbase, tenbase, hundred ->
    mkNum unit teenbase (tenbase + "дцать") hundred ;

oper mk5Num : Str -> Str -> Str -> Str -> Str -> Str -> LinDigit =
  \unit,unitich,unitim,unitimi, teenbase, tenbase ->
  mkNum (regNumeral unit unitich unitim unitimi) teenbase (tenbase + "десят") (unit ++ "сот") ;

oper bigNumeral : Str -> LinNumeral = \s -> invarNumeral s ;

lin num x = x ;

lin n2 = mk2Num twoNumeral "два" "две" "двести" ;
lin n3 = mk2Num threeNumeral "три" "три" "триста" ;
lin n4 = mk2Num fourNumeral "четыре" "четыр" "четыреста" ;
lin n5 = mk5Num "пять" "пятых" "пятым" "пятыми" "пять" "пять" ; ----
lin n6 = mk5Num "шесть" "шестых" "шестым" "шестыми" "шесть" "шесть" ; ----
lin n7 = mk5Num "семь" "седьмых" "седьмым" "седьмыми" "семь" "семь"; ----
lin n8 = mk5Num "восемь" "восьмых" "восьмым" "восьмыми" "восемь" "восемь";
lin n9 = mk5Num "девять" "девятых" "девятым" "девятыми" "девять" "девять" ;

lin pot01 = {
  unit = oneNumeral.s ; hundred = "сто" ; ten = "десять" ; teen = "одиннадцать" ;
  size = Num1
  } ;
lin pot0 d = d ;

lin pot110 = bigNumeral "десять" ;
lin pot111 = bigNumeral "одиннадцать" ;
lin pot1to19 d = bigNumeral d.teen ;

lin pot0as1 n = {s = n.unit ; size = n.size} ;
lin pot1 d = bigNumeral d.ten ;
lin pot1plus d e = {
  s = (invarNumeral (d.ten ++ determinerStr (e ** {s = e.unit}))).s ; ---- TODO inflection?
  size = tfSize e.size
  } ;
  ---- variants { d.s ! ten ++ e.s ! unit ; glue (glue (e.s ! unit) "a") (d.s ! ten)} ; size = tfSize e.size} ;

lin pot1as2 n = n ;
lin pot2 d = bigNumeral d.hundred ;
lin pot2plus d e = {
  s = (invarNumeral (d.hundred ++ determinerStr e)).s ;  ---- TODO inflection?
  size = tfSize e.size
  } ;

lin pot2as3 n = n ;
lin pot3 n = bigNumeral (mkTh (determinerStr n) n.size) ;

lin pot3plus n m = {
  s = (invarNumeral (mkTh (determinerStr n) n.size ++ determinerStr m)).s ;  ---- TODO inflection?
  size = tfSize m.size
  } ;

oper tfSize : NumSize -> NumSize = \sz ->
  table {Num1 => Num5 ; other => other} ! sz ;

oper mkTh : Str -> NumSize -> Str = \attr,size ->
  case size of {
    Num1 => "тысяча" ;
    Num2_4 => attr ++ "тысячи" ;
    Num5 => attr ++ "тысяч"
    } ;

oper determinerStr : Determiner -> Str = \d -> d.s ! Masc ! Nom ;


-- Numerals as sequences of digits have a separate, simpler grammar
  lincat Dig = {s:Str ; size : NumSize} ;

  lin
    IDig d = d ;

    IIDig d dd = {s = d.s ++ Predef.BIND ++ dd.s ; size = Num5} ; ---- leading zeros ??

    D_0 = { s = "0" ; size = Num5} ;
    D_1 = { s = "1" ; size = Num1} ;
    D_2 = { s = "2" ; size = Num2_4} ;
    D_3 = { s = "3" ; size = Num2_4} ;
    D_4 = { s = "4" ; size = Num2_4} ;
    D_5 = { s = "5" ; size = Num5} ;
    D_6 = { s = "6" ; size = Num5} ;
    D_7 = { s = "7" ; size = Num5} ;
    D_8 = { s = "8" ; size = Num5} ;
    D_9 = { s = "9" ; size = Num5} ;

}
