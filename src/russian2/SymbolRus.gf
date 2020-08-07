--# -path=.:../abstract:../common:../prelude

concrete SymbolRus of Symbol = CatRus ** open Prelude, ResRus in {
flags coding=utf8;

lin
  -- : Symb -> PN ;                -- x
  SymbPN i = (immutableNounForms i.s Neut Inanimate) ** {g = Neut; a = Inanimate} ;

  -- : Int -> PN ;                 -- 27
  IntPN i = (immutableNounForms i.s Neut Inanimate) ** {g = Neut; a = Inanimate} ;
  -- : Float -> PN ;               -- 3.14159
  FloatPN i = (immutableNounForms i.s Neut Inanimate) ** {g = Neut; a = Inanimate} ;
  -- : Card -> PN ;                -- twelve [as proper name]  -- TODO: implement properly
  NumPN card = (immutableNounForms (card.s ! Neut ! Inanimate ! Nom) Neut Inanimate) ** {g = Neut; a = Inanimate} ;

  -- : CN -> Card -> NP ;          -- level five ; level 5
  CNNumNP cn card = {
    s = \\cas => cn.s ! Sg ! cas ++ card.s ! cn.g ! cn.anim ! cas ;
    pron=False ;
    a = Ag (gennum cn.g (forceMaybeNum cn.mayben Sg)) P3
    } ;

  -- : Det -> CN -> [Symb] -> NP ; -- (the) (2) numbers x and
  CNSymbNP det cn xs = {
    s=\\cas => det.s ! cn.g ! cn.anim ! cas
      ++ cn.s ! numSizeNum cas det.size ! numSizeCase cas det.size
      ++ xs.s ;
    pron=False ;
    a=Ag (gennum cn.g (forceMaybeNum cn.mayben ((numSizeNumber det.size)))) P3
		} ;

  -- : Symb -> S ;                 -- A
  SymbS symb = {s=\\m=>symb.s};

  -- : Symb -> Card ;              -- n
  SymbNum symb = {s = \\_,_,_ => symb.s ; size = Num5} ;

  -- : Symb -> Ord ;               -- n'th  (i-й "итый")
  SymbOrd symb = {
    msnom = symb.s ++ BIND ++ "-й" ;  -- after vowel
    fsnom = symb.s ++ BIND ++ "-я" ;
    nsnom = symb.s ++ BIND ++ "-е" ;
    pnom  = symb.s ++ BIND ++ "-е" ;
    msgen = symb.s ++ BIND ++ "-го" ; -- after consonant
    fsgen = symb.s ++ BIND ++ "-й" ;
    pgen  = symb.s ++ BIND ++ "-х" ;
    msdat = symb.s ++ BIND ++ "-му" ;
    fsacc = symb.s ++ BIND ++ "-ю" ;
    msins = symb.s ++ BIND ++ "-м" ;
    fsins = symb.s ++ BIND ++ "-й" ;
    pins  = symb.s ++ BIND ++ "-ми" ;
    msprep= symb.s ++ BIND ++ "-м" ;
    sm, sf, sn, sp = symb.s ;
    comp = symb.s ++ BIND ++ "-е" ; --*
    preferShort=PreferFull
  } ;

lincat
  Symb, [Symb] = SS ;

lin
  MkSymb s = s ;
  BaseSymb = infixSS "и" ;
  ConsSymb = infixSS "," ;
}
