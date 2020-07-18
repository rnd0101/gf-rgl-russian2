concrete ConstructionRus of Construction = CatRus **
  open SyntaxRus, ParadigmsRus, ResRus in {

lin
  hungry_VP = mkVP (mkA "голодный" "" "1*a/c'" PrefShort) ;
  thirsty_VP = mkVP want_VV (mkVP (mkV "пить")) ;
  tired_VP = mkVP (mkA "усталый" "" "1*a/c'" PrefShort) ;
  scared_VP = mkVP (mkV "бояться") ;
  ill_VP = mkVP ( mkA "больной" "" "1*b" PrefShort) ;
  ready_VP = mkVP (mkA "готовый" "" "1a" PrefShort) ;
}
