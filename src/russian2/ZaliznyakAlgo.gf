resource ZaliznyakAlgo = open Prelude in {
flags coding=utf8 ; optimize=all ;

param

  -- This correspond to the abbreviated Zaliznyak index for nouns.
  -- Complete index contains a lot of additions.
  DType        = D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 ;   -- Declension type
  AlterType    = No | Ast | Circ  ;                        -- Alternation
  StressSchema = A | A' | B | B' | C | C' | C'' | D | D' | E | F | F' | F'' ;
  ZIndex       = Z0 | Z DType AlterType StressSchema ;     -- immutable words are in their own class

  -- example: ПЕРЕЦ: м 5*a  can be: Z D5 Ast A
  -- Later some interpretation function can be added for:  "5*a" -> Z D5 Ast A

}
