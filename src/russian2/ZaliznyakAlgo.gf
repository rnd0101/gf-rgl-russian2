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

  consonants : pattern Str = #("б"|"в"|"г"|"д"|"ж"|"з"|"й"|"к"|"л"|"м"|"н"|"п"|"р"|"с"|"т"|"ф"|"х"|"ц"|"ч"|"ш"|"щ") ;

  -- This correspond to the abbreviated Zaliznyak index for nouns.
  -- Complete index contains a lot of additions.

  DeclType     = Predef.Ints 8 ;        -- Declension type

  -- example: ПЕРЕЦ: м 5*a  can be: Z 5 Ast A
  -- Later some interpretation function can be added for:  "5*a" -> Z 5 Ast A

  EndingSpec : Type = {p1, p2: Str} ;

  NounFormsBase : Type = {
    snom, sgen, sdat, sacc, sins, sprep,
    pnom, pgen, pdat, pacc, pins, pprep : Str ;
    g : Gender ;
    a : Animacy
  } ;

  NounEndForms, StemForms : Type = {
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

  immutableCasesS1 : NounEndFormsS1 = {
    snom=<"","">;pnom=<"","">;sgen=<"","">;pgen=<"","">;sdat=<"","">;pdat=<"","">;sacc=<"","">;pacc=<"","">;sins=<"","">;pins=<"","">;sprep=<"","">;pprep=<"","">
  } ;

  mobileOne : Str -> DeclType -> StressSchema -> StemForms
   = \s, dt, ss -> {  -- TODO
      snom = s;
      pnom = s;
      sgen = s;
      pgen = s;
      sdat = s;
      pdat = s;
      sacc = s;
      pacc = s;
      sins = s;
      pins = s;
      sprep= s ;
      pprep= s ;
    } ;

  PlGenAlter : Str -> DeclType -> StressSchema -> Str
   = \s, dt, ss ->
      let stem1 = Predef.tk 1 s in
      let stem2 = Predef.tk 1 s in
      let stemEnd1 = Predef.dp 1 s in
      let pgenStressed = stressTable ss "pgen" in
      case <dt, pgenStressed, s> of {
        <6, Stressed, _>  => (Predef.tk 1 s) + "е" ;
        <6, _, _>                        => (Predef.tk 1 s) + "и" ;
        <5, _, s1 + ("ь"|"й") + consonant> => s1 + "е" ;
        <_, Unstressed, s1 + ("ь"|"й") + consonant> => s1 + "е" ;
        <_, _, s1 + ("ь"|"й") + consonant> => s1 + "ё" ;
        <_, _, s1 + ("г"|"к"|"х") + consonant> => stem1 + "о" + stemEnd1 ;
        <5, _, _>                              => stem1 + "е" + stemEnd1 ;
    --    <3, _, s1 + prev + consonant> => s1 + "о" ;  -- ^жшчщц
        <_, Stressed, s1 + ("ж"|"ч"|"ш"|"щ") + consonant> => stem1 + "о" + stemEnd1 ; -- shorted stem?
        <_, Stressed, _> => stem1 + "ё" + stemEnd1 ; -- shorted stem?
        _ => s
   } ;

  mobileTwo : Str -> DeclType -> StressSchema -> StemForms
   = \s, dt, ss -> {
      snom = s ;
      pnom = s ;
      sgen = s ;
      pgen = PlGenAlter s dt ss ;
      sdat = s ;
      pdat = s ;
      sacc = s ;
      pacc = s ;
      sins = s ;
      pins = s ;
      sprep= s ;
      pprep= s ;
    } ;

  alterStems : Str -> Gender -> DeclType -> StressSchema -> StemForms
    = \s, g, dt, ss ->
      case <g, dt> of {
        <Masc, _> => mobileOne s dt ss;
        <Neut, _> => mobileTwo s dt ss;
        <Fem, 8> => mobileOne s dt ss;
        <Fem, _> => mobileTwo s dt ss
      } ;

  stemsAndEndings : StemForms -> NounEndForms -> StemForms
    = \sf, nef -> {
      snom = sf.snom  + nef.snom ;
      pnom = sf.pnom  + nef.pnom ;
      sgen = sf.sgen  + nef.sgen ;
      pgen = sf.pgen  + nef.pgen ;
      sdat = sf.sdat  + nef.sdat ;
      pdat = sf.pdat  + nef.pdat ;
      sacc = sf.sacc  + nef.sacc ;
      pacc = sf.pacc  + nef.pacc ;
      sins = sf.sins  + nef.sins ;
      pins = sf.pins  + nef.pins ;
      sprep= sf.sprep + nef.sprep ;
      pprep= sf.pprep + nef.pprep ;
    } ;

  doAlternations : Str -> NounEndForms -> Gender -> Animacy -> DeclType -> StressSchema -> NounFormsBase
    = \s, nef, g, a, dt, ss ->
       let stemforms = alterStems s g dt ss in
       (stemsAndEndings stemforms nef) ** {g=g; a=a} ;

  alterForms : Str -> NounEndForms -> Gender -> Animacy -> ZIndex -> NounFormsBase
    = \s, nef, g, a, z ->
      case z of {
        Z0 => immutableCases ** {g=g; a=a} ;
        Z dt at ss => case at of {
          Ast => doAlternations s nef g a dt ss ;
          _ => {
            snom = s + nef.snom ;
            pnom = s + nef.pnom ;
            sgen = s + nef.sgen ;
            pgen = s + nef.pgen ;
            sdat = s + nef.sdat ;
            pdat = s + nef.pdat ;
            sacc = s + nef.sacc ;
            pacc = s + nef.pacc ;
            sins = s + nef.sins ;
            pins = s + nef.pins ;
            sprep= s + nef.sprep ;
            pprep= s + nef.pprep ;
            g=g ;
            a=a
          }
      }
    } ;

  makeNoun : Str -> Gender -> Animacy -> ZIndex -> NounFormsBase
    = \s, g, a, z ->
    let frm = formsSelection g a z in
    alterForms s frm g a z;

  formsSelection : Gender -> Animacy -> ZIndex -> NounEndForms
    = \g, a, z ->
    case z of {
      Z0 => immutableCases ;
      Z dt at ss => endingsSelection g a dt at ss
    } ;

  SgAcc : Gender -> Animacy -> DeclType -> NounEndForms -> Str
    = \g, a, dt, nef -> case <g, dt, a, nef.sacc> of {
      <Neut, (3 | 4 | 5 | 6 | 7 | 8), Animate, "?"> => nef.snom ;
      <_, _, Animate, "?"> => nef.sgen ;
      <_, _, Inanimate, "?"> => nef.snom ;
      _ => nef.sacc
    } ;

  PlAcc : Gender -> Animacy -> DeclType -> NounEndForms -> Str
    = \g, a, dt, nef -> case <g, dt, a> of {
      <Neut, (5 | 7), Animate> => nef.pnom ;
      <Neut, 6, Animate> => nef.pnom ;  -- does not exist
      <_, _, Animate> => nef.pgen ;
      <_, _, Inanimate> => nef.pnom ;
      _ => nef.pacc
    } ;

  animacySelection : Gender -> Animacy -> DeclType -> NounEndForms -> NounEndForms
    = \g, a, dt, nef -> nef ** {
        sacc=SgAcc g a dt nef ;
        pacc=PlAcc g a dt nef ;
        sins=nef.sins  -- TODO: there can be variants {}  ю in addition to й
    } ;

  endingsSelection : Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> NounEndForms
    = \g, a, dt, at, ss ->
    let gDtBased = gDtBasedSelection g dt in
    let gDtSsBased = gDtSsBasedSelection gDtBased ss in
    animacySelection g a dt gDtSsBased
  ;

  selStress : EndingSpec -> Stressedness -> Str
    = \es, sness ->
    case <es, sness> of {
      <<v, v'>, Unstressed> => v ;
      <<v, v'>, Stressed> => v' ;
      <<s>, _> => s
    } ;

  gDtSsBasedSelection : NounEndFormsS1 -> StressSchema -> NounEndForms
    = \nef1, ss ->
      {
        snom=stressSelection nef1.snom ss "snom";
        pnom=stressSelection nef1.pnom ss "pnom";
        sgen=stressSelection nef1.sgen ss "sgen";
        pgen=stressSelection nef1.pgen ss "pgen";
        sdat=stressSelection nef1.sdat ss "sdat";
        pdat=stressSelection nef1.pdat ss "pdat";
        sacc=stressSelection nef1.sacc ss "sacc";
        pacc=stressSelection nef1.pacc ss "pacc";
        sins=stressSelection nef1.sins ss "sins";
        pins=stressSelection nef1.pins ss "pins";
        sprep=stressSelection nef1.sprep ss "sprep";
        pprep=stressSelection nef1.pprep ss "pprep"
    } ;

  stressSelection : EndingSpec -> StressSchema -> Str -> Str
    = \es, ss, c ->
    selStress es (stressTable ss c) ;

  stressTable : StressSchema -> Str -> Stressedness
    = \ss, c ->
    case <ss, c> of {
      <B, "snom"|"sgen"|"sdat"|"sacc"|"sins"|"sprep"|"pnom"|"pgen"|"pdat"|"pins"|"pprep"> => Stressed ;
      <C, "pnom"|"pgen"|"pdat"|"pins"|"pprep"> => Stressed ;
      <D, "snom"|"sgen"|"sdat"|"sacc"|"sins"|"sprep"> => Stressed ;
      <E, "pgen"|"pdat"|"pins"|"pprep"> => Stressed ;
      <F, "snom"|"sgen"|"sdat"|"sacc"|"sins"|"sprep"|"pgen"|"pdat"|"pins"|"pprep"> => Stressed ;
      <B', "snom"|"sgen"|"sdat"|"sacc"|"sprep"|"pnom"|"pgen"|"pdat"|"pins"|"pprep"> => Stressed ;
      <D', "snom"|"sgen"|"sdat"|"sins"|"sprep"> => Stressed ;
      <F', "snom"|"sgen"|"sdat"|"sins"|"sprep"|"pgen"|"pdat"|"pins"|"pprep"> => Stressed ;
      <F'', "snom"|"sgen"|"sdat"|"sacc"|"sprep"|"pgen"|"pdat"|"pins"|"pprep"> => Stressed ;
      <_, _> => Unstressed
    } ;

  gDtBasedSelection : Gender -> DeclType -> NounEndFormsS1
    = \g, dt -> case <g, dt> of {
      <_, 0> => immutableCasesS1 ;
      <Masc, 1> => {snom=<"","">;pnom=<"ы","ы">;sgen=<"а","а">;pgen=<"ов","ов">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ом","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Masc, 2> => {snom=<"ь","ь">;pnom=<"и","и">;sgen=<"я","я">;pgen=<"ей","ей">;sdat=<"ю","ю">;pdat=<"ям","ям">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ём">;pins=<"ями","ями">;sprep=<"е","е">;pprep=<"ях","ях">} ;
      <Masc, 3> => {snom=<"","">;pnom=<"и","и">;sgen=<"а","а">;pgen=<"ов","ов">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ом","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Masc, 4> => {snom=<"","">;pnom=<"и","и">;sgen=<"а","а">;pgen=<"ей","ей">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Masc, 5> => {snom=<"","">;pnom=<"ы","ы">;sgen=<"а","а">;pgen=<"ев","ов">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Masc, 6> => {snom=<"й","й">;pnom=<"и","и">;sgen=<"я","я">;pgen=<"ев","ёв">;sdat=<"ю","ю">;pdat=<"ям","ям">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ём">;pins=<"ями","ями">;sprep=<"е","е">;pprep=<"ях","ях">} ;
      <Masc, 7> => {snom=<"й","й">;pnom=<"и","и">;sgen=<"я","я">;pgen=<"ев","ёв">;sdat=<"ю","ю">;pdat=<"ям","ям">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ём">;pins=<"ями","ями">;sprep=<"и","е">;pprep=<"ях","ях">} ;
      <Masc, 8> => {snom=<"ь","ь">;pnom=<"и","и">;sgen=<"и","и">;pgen=<"ей","ей">;sdat=<"и","и">;pdat=<"ям","ям">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ём">;pins=<"ями","ями">;sprep=<"и","и">;pprep=<"ях","ях">} ;
      <Fem, 1> => {snom=<"а","а">;pnom=<"ы","ы">;sgen=<"ы","ы">;pgen=<"","">;sdat=<"е","е">;pdat=<"ам","ам">;sacc=<"у","у">;pacc=<"?","?">;sins=<"ой","ой">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Fem, 2> => {snom=<"я","я">;pnom=<"и","и">;sgen=<"и","и">;pgen=<"ь","ей">;sdat=<"е","е">;pdat=<"ям","ям">;sacc=<"ю","ю">;pacc=<"?","?">;sins=<"ей","ёй">;pins=<"ями","ями">;sprep=<"е","е">;pprep=<"ях","ях">} ;
      <Fem, 3> => {snom=<"а","а">;pnom=<"и","и">;sgen=<"и","и">;pgen=<"","">;sdat=<"е","е">;pdat=<"ам","ам">;sacc=<"у","у">;pacc=<"?","?">;sins=<"ой","ой">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Fem, 4> => {snom=<"а","а">;pnom=<"и","и">;sgen=<"и","и">;pgen=<"","ей">;sdat=<"е","е">;pdat=<"ам","ам">;sacc=<"у","у">;pacc=<"?","?">;sins=<"ей","ой">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Fem, 5> => {snom=<"а","а">;pnom=<"ы","ы">;sgen=<"ы","ы">;pgen=<"","">;sdat=<"е","е">;pdat=<"ам","ам">;sacc=<"у","у">;pacc=<"?","?">;sins=<"ей","ой">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Fem, 6> => {snom=<"я","я">;pnom=<"и","и">;sgen=<"и","и">;pgen=<"й","й">;sdat=<"е","е">;pdat=<"ям","ям">;sacc=<"ю","ю">;pacc=<"?","?">;sins=<"ей","ёй">;pins=<"ями","ями">;sprep=<"е","е">;pprep=<"ях","ях">} ;
      <Fem, 7> => {snom=<"я","я">;pnom=<"и","и">;sgen=<"и","и">;pgen=<"й","й">;sdat=<"и","е">;pdat=<"ям","ям">;sacc=<"ю","ю">;pacc=<"?","?">;sins=<"ей","ёй">;pins=<"ями","ями">;sprep=<"и","е">;pprep=<"ях","ях">} ;
      <Fem, 8> => {snom=<"ь","ь">;pnom=<"и","и">;sgen=<"и","и">;pgen=<"ей","ей">;sdat=<"и","и">;pdat=<"ям","ям">;sacc=<"ь","ь">;pacc=<"?","?">;sins=<"ью","ью">;pins=<"ями","ями">;sprep=<"и","и">;pprep=<"ях","ях">} ;
      <Neut, 1> => {snom=<"о","о">;pnom=<"а","а">;sgen=<"а","а">;pgen=<"","">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ом","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Neut, 2> => {snom=<"е","е">;pnom=<"я","я">;sgen=<"я","я">;pgen=<"ь","ей">;sdat=<"ю","ю">;pdat=<"ям","ям">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ём">;pins=<"ями","ями">;sprep=<"е","е">;pprep=<"ях","ях">} ;
      <Neut, 3> => {snom=<"о","о">;pnom=<"а","а">;sgen=<"а","а">;pgen=<"","">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ом","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Neut, 4> => {snom=<"е","о">;pnom=<"а","а">;sgen=<"а","а">;pgen=<"","ей">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Neut, 5> => {snom=<"е","о">;pnom=<"а","а">;sgen=<"а","а">;pgen=<"","">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ом">;pins=<"ами","ами">;sprep=<"е","е">;pprep=<"ах","ах">} ;
      <Neut, 6> => {snom=<"е","е">;pnom=<"я","я">;sgen=<"я","я">;pgen=<"й","й">;sdat=<"ю","ю">;pdat=<"ям","ям">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ём">;pins=<"ями","ями">;sprep=<"е","е">;pprep=<"ях","ях">} ;
      <Neut, 7> => {snom=<"е","е">;pnom=<"я","я">;sgen=<"я","я">;pgen=<"й","й">;sdat=<"ю","ю">;pdat=<"ям","ям">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ем","ём">;pins=<"ями","ями">;sprep=<"и","е">;pprep=<"ях","ях">} ;
      <Neut, 8> => {snom=<"о","о">;pnom=<"а","а">;sgen=<"а","а">;pgen=<"","">;sdat=<"у","у">;pdat=<"ам","ам">;sacc=<"?","?">;pacc=<"?","?">;sins=<"ом","ом">;pins=<"ами","ами">;sprep=<"и","и">;pprep=<"ах","ах">}
    } ;
}