resource ZaliznyakAlgo = open Prelude in {
flags coding=utf8 ; optimize=all ;

param
  Gender     = Masc | Fem | Neut ;  -- ? to ParamRus
  Animacy    = Animate | Inanimate ;  -- одушевлённый / неодушевлённый  ? to ParamRus

  AlterType    = No | Ast | Circ  ;     -- Alternation
  StressSchema = A | A' | B | B' | C | C' | C'' | D | D' | E | F | F' | F'' ;
  ZIndex       = Z0 | Z DeclType AlterType StressSchema ;     -- immutable words are in their own class
  Stressedness = Stressed | Unstressed ;

oper

  -- This correspond to the abbreviated Zaliznyak index for nouns.
  -- Complete index contains a lot of additions.

  DeclType     = Predef.Ints 8 ;        -- Declension type

  -- example: ПЕРЕЦ: м 5*a  can be: Z 5 Ast A
  -- Later some interpretation function can be added for:  "5*a" -> Z 5 Ast A

  EndingSpec : Type = Str | <Str, Str> ;

  NounEndForms : Type = {
    snom, sgen, sdat, sacc, sins, sprep,
    pnom, pgen, pdat, pacc, pins, pprep : Str ;
  } ;

  NounEndFormsS1 : Type = {
    snom, sgen, sdat, sacc, sins, sprep,
    pnom, pgen, pdat, pacc, pins, pprep : EndingSpec ;
  } ;

  immutableCases : NounEndForms = {
    snom="";pnom="";sgen="";pgen="";sdat="";pdat="";sacc="";pacc="";sins="";pins="";sprep="";pprep=""
  } ;

  formsSelection : Str -> Gender -> Animacy -> ZIndex -> NounEndForms
    = \s, g, a, z ->
    case z of {
      Z0 => immutableCases ;
      Z dt at ss => endingsSelection g a dt at ss
    } ;

  gDtBasedSelection : Gender -> DeclType -> NounEndFormsS1
    = \g, dt -> case <g, dt> of {
      <Masc, 1> => {snom=<"">;pnom=<"ы">;sgen=<"а">;pgen=<"ов","ов">;sdat=<"у">;pdat=<"ам">;sins=<"ом","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Masc, 2> => {snom=<"ь">;pnom=<"и">;sgen=<"я">;pgen=<"ей","ей">;sdat=<"ю">;pdat=<"ям">;sins=<"ем","ём">;pins=<"ями">;sprep=<"е","е">;pprep=<"ях">} ;
      <Masc, 3> => {snom=<"">;pnom=<"и">;sgen=<"а">;pgen=<"ов","ов">;sdat=<"у">;pdat=<"ам">;sins=<"ом","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Masc, 4> => {snom=<"">;pnom=<"и">;sgen=<"а">;pgen=<"ей","ей">;sdat=<"у">;pdat=<"ам">;sins=<"ем","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Masc, 5> => {snom=<"">;pnom=<"ы">;sgen=<"а">;pgen=<"ев","ов">;sdat=<"у">;pdat=<"ам">;sins=<"ем","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Masc, 6> => {snom=<"й">;pnom=<"и">;sgen=<"я">;pgen=<"ев","ёв">;sdat=<"ю">;pdat=<"ям">;sins=<"ем","ём">;pins=<"ями">;sprep=<"е","е">;pprep=<"ях">} ;
      <Masc, 7> => {snom=<"й">;pnom=<"и">;sgen=<"я">;pgen=<"ев","ёв">;sdat=<"ю">;pdat=<"ям">;sins=<"ем","ём">;pins=<"ями">;sprep=<"и","е">;pprep=<"ях">} ;
      <Masc, 8> => {snom=<"ь">;pnom=<"и">;sgen=<"и">;pgen=<"ей","ей">;sdat=<"и">;pdat=<"ям">;sins=<"ем","ём">;pins=<"ями">;sprep=<"и","и">;pprep=<"ях">} ;
      <Fem, 1> => {snom=<"а">;pnom=<"ы">;sgen=<"ы">;pgen=<"","">;sdat=<"е">;pdat=<"ам">;sins=<"ой","ой">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Fem, 2> => {snom=<"я">;pnom=<"и">;sgen=<"и">;pgen=<"ь","ей">;sdat=<"е","е">;pdat=<"ям">;sins=<"ей","ёй">;pins=<"ями">;sprep=<"е","е">;pprep=<"ях">} ;
      <Fem, 3> => {snom=<"а">;pnom=<"и">;sgen=<"и">;pgen=<"","">;sdat=<"е">;pdat=<"ам">;sins=<"ой","ой">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Fem, 4> => {snom=<"а">;pnom=<"и">;sgen=<"и">;pgen=<"","ей">;sdat=<"е">;pdat=<"ам">;sins=<"ей","ой">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Fem, 5> => {snom=<"а">;pnom=<"ы">;sgen=<"ы">;pgen=<"","">;sdat=<"е">;pdat=<"ам">;sins=<"ей","ой">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Fem, 6> => {snom=<"я">;pnom=<"и">;sgen=<"и">;pgen=<"й","й">;sdat=<"е","е">;pdat=<"ям">;sins=<"ей","ёй">;pins=<"ями">;sprep=<"е","е">;pprep=<"ях">} ;
      <Fem, 7> => {snom=<"я">;pnom=<"и">;sgen=<"и">;pgen=<"й","й">;sdat=<"и","е">;pdat=<"ям">;sins=<"ей","ёй">;pins=<"ями">;sprep=<"и","е">;pprep=<"ях">} ;
      <Fem, 8> => {snom=<"ь">;pnom=<"и">;sgen=<"и">;pgen=<"ей","ей">;sdat=<"и","и">;pdat=<"ям">;sins=<"ью","ью">;pins=<"ями">;sprep=<"и","и">;pprep=<"ях">} ;
      <Neut, 1> => {snom=<"о","о">;pnom=<"а">;sgen=<"а">;pgen=<"","">;sdat=<"у">;pdat=<"ам">;sins=<"ом","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Neut, 2> => {snom=<"е">;pnom=<"я">;sgen=<"я">;pgen=<"ь","ей">;sdat=<"ю">;pdat=<"ям">;sins=<"ем","ём">;pins=<"ями">;sprep=<"е","е">;pprep=<"ях">} ;
      <Neut, 3> => {snom=<"о","о">;pnom=<"а">;sgen=<"а">;pgen=<"","">;sdat=<"у">;pdat=<"ам">;sins=<"ом","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Neut, 4> => {snom=<"е","о">;pnom=<"а">;sgen=<"а">;pgen=<"","ей">;sdat=<"у">;pdat=<"ам">;sins=<"ем","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Neut, 5> => {snom=<"е","о">;pnom=<"а">;sgen=<"а">;pgen=<"","">;sdat=<"у">;pdat=<"ам">;sins=<"ем","ом">;pins=<"ами">;sprep=<"е","е">;pprep=<"ах">} ;
      <Neut, 6> => {snom=<"е">;pnom=<"я">;sgen=<"я">;pgen=<"й","й">;sdat=<"ю">;pdat=<"ям">;sins=<"ем","ём">;pins=<"ями">;sprep=<"е","е">;pprep=<"ях">} ;
      <Neut, 7> => {snom=<"е">;pnom=<"я">;sgen=<"я">;pgen=<"й","й">;sdat=<"ю">;pdat=<"ям">;sins=<"ем","ём">;pins=<"ями">;sprep=<"и","е">;pprep=<"ях">} ;
      <Neut, 8> => {snom=<"о","о">;pnom=<"а">;sgen=<"а">;pgen=<"","">;sdat=<"у">;pdat=<"ам">;sins=<"ом","ом">;pins=<"ами">;sprep=<"и","и">;pprep=<"ах">}
    } ;

  animacySelection : Gender -> Animacy -> DeclType -> NounEndForms -> NounEndForms
    = \g, a, dt, nfs2 ->  {
       sacc = case <g, dt, a, dt.sacc> of {
         <Neut, (3 | 4 | 5 | 6 | 7 | 8), Animate, "?"> => dt.snom ;
         <_, _, Animate, "?"> => dt.sgen ;
         <_, _, Inanimate, "?"> => dt.snom ;
         _ => {sacc=dt.sacc}
       } ;
       pacc = case <g, dt, a, dt.pacc> of {
         <Neut, (5 | 7), Animate, "?"> => dt.pnom ;
         <Neut, 6, Animate, "?"> => dt.pnom ;  -- does not exist
         <_, _, Animate, "?"> => dt.pgen ;
         <_, _, Inanimate, "?"> => dt.pnom ;
         _ => {sacc=dt.pacc}
       } ;
       sins = dt.sins  -- TODO: there can be variants {}  ю in addition to й
    } ;

  endingsSelection : Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> NounEndForms
    = \g, a, dt, at, ss ->
    let gDtBased = gDtBasedSelection g dt in
    let gDtSsBased = gDtSsBasedSelection gDtBased ss in
    gDtSsBased ** animacySelection gDtSsBased a
  ;


  selStress : EndingSpec -> Stressedness -> Str
    = \es, sness ->
    case <es, sness> of {
      <<v, v'>, Unstressed> => v ;
      <<v, v'>, Stressed> => v' ;
      <v, _> => v
    } ;

  stressSelection : EndingSpec -> StressSchema -> NounEndForms
    = \es, ss, c ->
    case <ss, c> of {
      <A, "snom"> => selStress es Unstressed ;
      <A, "sgen"> => selStress es Unstressed ;
      <A, "sdat"> => selStress es Unstressed ;
      <A, "sacc"> => selStress es Unstressed ;
      <A, "sins"> => selStress es Unstressed ;
      <A, "sprep"> => selStress es Unstressed ;
      <A, "pnom"> => selStress es Unstressed ;
      <A, "pgen"> => selStress es Unstressed ;
      <A, "pdat"> => selStress es Unstressed ;
      <A, "pins"> => selStress es Unstressed ;
      <A, "pprep"> => selStress es Unstressed ;
      <B, "snom"> => selStress es Stressed ;
      <B, "sgen"> => selStress es Stressed ;
      <B, "sdat"> => selStress es Stressed ;
      <B, "sacc"> => selStress es Stressed ;
      <B, "sins"> => selStress es Stressed ;
      <B, "sprep"> => selStress es Stressed ;
      <B, "pnom"> => selStress es Stressed ;
      <B, "pgen"> => selStress es Stressed ;
      <B, "pdat"> => selStress es Stressed ;
      <B, "pins"> => selStress es Stressed ;
      <B, "pprep"> => selStress es Stressed ;
      <C, "snom"> => selStress es Unstressed ;
      <C, "sgen"> => selStress es Unstressed ;
      <C, "sdat"> => selStress es Unstressed ;
      <C, "sacc"> => selStress es Unstressed ;
      <C, "sins"> => selStress es Unstressed ;
      <C, "sprep"> => selStress es Unstressed ;
      <C, "pnom"> => selStress es Stressed ;
      <C, "pgen"> => selStress es Stressed ;
      <C, "pdat"> => selStress es Stressed ;
      <C, "pins"> => selStress es Stressed ;
      <C, "pprep"> => selStress es Stressed ;
      <D, "snom"> => selStress es Stressed ;
      <D, "sgen"> => selStress es Stressed ;
      <D, "sdat"> => selStress es Stressed ;
      <D, "sacc"> => selStress es Stressed ;
      <D, "sins"> => selStress es Stressed ;
      <D, "sprep"> => selStress es Stressed ;
      <D, "pnom"> => selStress es Unstressed ;
      <D, "pgen"> => selStress es Unstressed ;
      <D, "pdat"> => selStress es Unstressed ;
      <D, "pins"> => selStress es Unstressed ;
      <D, "pprep"> => selStress es Unstressed ;
      <E, "snom"> => selStress es Unstressed ;
      <E, "sgen"> => selStress es Unstressed ;
      <E, "sdat"> => selStress es Unstressed ;
      <E, "sacc"> => selStress es Unstressed ;
      <E, "sins"> => selStress es Unstressed ;
      <E, "sprep"> => selStress es Unstressed ;
      <E, "pnom"> => selStress es Unstressed ;
      <E, "pgen"> => selStress es Stressed ;
      <E, "pdat"> => selStress es Stressed ;
      <E, "pins"> => selStress es Stressed ;
      <E, "pprep"> => selStress es Stressed ;
      <F, "snom"> => selStress es Stressed ;
      <F, "sgen"> => selStress es Stressed ;
      <F, "sdat"> => selStress es Stressed ;
      <F, "sacc"> => selStress es Stressed ;
      <F, "sins"> => selStress es Stressed ;
      <F, "sprep"> => selStress es Stressed ;
      <F, "pnom"> => selStress es Unstressed ;
      <F, "pgen"> => selStress es Stressed ;
      <F, "pdat"> => selStress es Stressed ;
      <F, "pins"> => selStress es Stressed ;
      <F, "pprep"> => selStress es Stressed ;
      <B', "snom"> => selStress es Stressed ;
      <B', "sgen"> => selStress es Stressed ;
      <B', "sdat"> => selStress es Stressed ;
      <B', "sacc"> => selStress es Stressed ;
      <B', "sins"> => selStress es Unstressed ;
      <B', "sprep"> => selStress es Stressed ;
      <B', "pnom"> => selStress es Stressed ;
      <B', "pgen"> => selStress es Stressed ;
      <B', "pdat"> => selStress es Stressed ;
      <B', "pins"> => selStress es Stressed ;
      <B', "pprep"> => selStress es Stressed ;
      <D', "snom"> => selStress es Stressed ;
      <D', "sgen"> => selStress es Stressed ;
      <D', "sdat"> => selStress es Stressed ;
      <D', "sacc"> => selStress es Unstressed ;
      <D', "sins"> => selStress es Stressed ;
      <D', "sprep"> => selStress es Stressed ;
      <D', "pnom"> => selStress es Unstressed ;
      <D', "pgen"> => selStress es Unstressed ;
      <D', "pdat"> => selStress es Unstressed ;
      <D', "pins"> => selStress es Unstressed ;
      <D', "pprep"> => selStress es Unstressed ;
      <F', "snom"> => selStress es Stressed ;
      <F', "sgen"> => selStress es Stressed ;
      <F', "sdat"> => selStress es Stressed ;
      <F', "sacc"> => selStress es Unstressed ;
      <F', "sins"> => selStress es Stressed ;
      <F', "sprep"> => selStress es Stressed ;
      <F', "pnom"> => selStress es Unstressed ;
      <F', "pgen"> => selStress es Stressed ;
      <F', "pdat"> => selStress es Stressed ;
      <F', "pins"> => selStress es Stressed ;
      <F', "pprep"> => selStress es Stressed ;
      <F'', "snom"> => selStress es Stressed ;
      <F'', "sgen"> => selStress es Stressed ;
      <F'', "sdat"> => selStress es Stressed ;
      <F'', "sacc"> => selStress es Stressed ;
      <F'', "sins"> => selStress es Unstressed ;
      <F'', "sprep"> => selStress es Stressed ;
      <F'', "pnom"> => selStress es Unstressed ;
      <F'', "pgen"> => selStress es Stressed ;
      <F'', "pdat"> => selStress es Stressed ;
      <F'', "pins"> => selStress es Stressed ;
      <F'', "pprep"> => selStress es Stressed
    } ;

  gDtSsBasedSelection : NounEndFormsS1 -> StressSchema -> NounEndForms
    = \nfs1, ss ->
      {
        snom=stressSelection nfs1.snom ss "snom";
        pnom=stressSelection nfs1.pnom ss "pnom";
        sgen=stressSelection nfs1.sgen ss "sgen";
        pgen=stressSelection nfs1.pgen ss "pgen";
        sdat=stressSelection nfs1.sdat ss "sdat";
        pdat=stressSelection nfs1.pdat ss "pdat";
        sacc=stressSelection nfs1.sacc ss "sacc";
        pacc=stressSelection nfs1.pacc ss "pacc";
        sins=stressSelection nfs1.sins ss "sins";
        pins=stressSelection nfs1.pins ss "pins";
        sprep=stressSelection nfs1.sprep ss "sprep";
        pprep=stressSelection nfs1.pprep ss "pprep"
    } ;


}
