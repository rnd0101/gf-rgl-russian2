concrete TenseRus of Tense = CatRus [Tense,Temp], TenseX [Ant,AAnter,ASimul]
  ** open ResRus, (P=ParamRus), Prelude in {
flags coding=utf8 ; optimize=all ;
lin
  PNeg = {
    s = "не" ++ Predef.BIND ;
    p = False
    } ;
  PPos = {
    s = [] ;
    p = True
    } ;
  -- : Tense -> Ant -> Temp
  TTAnt t a = {s = t.s ++ a.s ; t = t.t ; a = a.a} ;

  TPres = {s = []} ** {t = P.RusPres} ;
  TPast = {s = []} ** {t = P.RusPast} ;   --# notpresent
  TFut  = {s = []} ** {t = P.RusFut} ;    --# notpresent
}
