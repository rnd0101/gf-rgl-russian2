resource ParamRus = open Prelude in {

  param
    Gender     = Masc | Fem | Neut ;  -- род
    Animacy    = Animate | Inanimate ;  -- одушевлённый / неодушевлённый

  param
    AlterType    = No | Ast | Circ  ;     -- Alternation
    StressSchema = A | A' | B | B' | C | C' | C'' | D | D' | E | F | F' | F'' ;
    ZIndex       = Z0 | Z DeclType AlterType StressSchema ;     -- immutable words are in their own class
    Stressedness = Stressed | Unstressed ;

  oper
    DeclType     = Predef.Ints 8 ;        -- Declension type

    NounFormsBase : Type = {
      snom, sgen, sdat, sacc, sins, sprep,
      pnom, pgen, pdat, pacc, pins, pprep : Str ;
      g : Gender ;
      a : Animacy
    } ;
}
