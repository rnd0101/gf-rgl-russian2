resource ZaliznyakAlgo = open Prelude in {
flags coding=utf8 ; optimize=all ;

param
  Gender     = Masc | Fem | Neut ;  -- ? to ParamRus
  EndStress  = Unstressed | Stressed ;

  -- This correspond to the abbreviated Zaliznyak index for nouns.
  -- Complete index contains a lot of additions.
  DeclType     = Predef.Ints 8 ;        -- Declension type
  AlterType    = No | Ast | Circ  ;     -- Alternation
  StressSchema = A | A' | B | B' | C | C' | C'' | D | D' | E | F | F' | F'' ;
  ZIndex       = Z0 | Z DeclType AlterType StressSchema ;     -- immutable words are in their own class

  -- example: ПЕРЕЦ: м 5*a  can be: Z 5 Ast A
  -- Later some interpretation function can be added for:  "5*a" -> Z 5 Ast A





}
