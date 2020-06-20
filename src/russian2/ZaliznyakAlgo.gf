resource ZaliznyakAlgo = open Prelude, ParamRus in {
flags coding=utf8 ; optimize=all ;

oper

  -- This correspond to the abbreviated Zaliznyak index for nouns.
  -- Complete index contains a lot of additions.

  -- example: ПЕРЕЦ: м 5*a  can be: Z 5 Ast A
  -- Later some interpretation function can be added for:  "5*a" -> Z 5 Ast A

  EndingSpec : Type = {p1, p2: Str} ;

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

  immutableNounCases : Str -> Gender -> Animacy -> NounFormsBase
    = \s, g, a -> {
      snom=s;pnom=s;sgen=s;pgen=s;sdat=s;pdat=s;sacc=s;pacc=s;sins=s;pins=s;sprep=s;pprep=s;
      a=a;g=g
    } ;

  immutableCasesS1 : NounEndFormsS1 = {
    snom=<"","">;pnom=<"","">;sgen=<"","">;pgen=<"","">;sdat=<"","">;pdat=<"","">;sacc=<"","">;pacc=<"","">;sins=<"","">;pins=<"","">;sprep=<"","">;pprep=<"","">
  } ;

  mobileOne : Str -> NounEndForms -> DeclType -> StressSchema -> StemForms
   = \s, nef, dt, ss ->
     let snom = s + nef.snom in
     let last = Predef.dp 1 snom in
     let butLast = Predef.tk 1 snom in
     let secondLast = Predef.dp 1 butLast in
     let butTwolast = Predef.tk 2 snom in
     let thirdLast = Predef.dp 1 butTwolast in
     let s1 : Str = case <dt, snom, thirdLast, secondLast> of {   -- what if more than one consonant or sign?
       <6, _ + #vowel + #consonant, _, "е"|"ё"> => butTwolast + "ь" ;
       <_, _ + #vowel + #consonant, #vowel, "е"|"ё"> => butTwolast + "й" + last ;  --?
       <3, _ + #vowel + #consonant, #consonant_minus, "е"|"ё"> => butTwolast + "ь" + last ;  -- королёк, but овражек
       <1|2|4|5|7|8, _ + #vowel + #consonant, "л", "е"|"ё"> => butTwolast + "ь" + last ;
       <6, _ + #vowel + #consonant, _, "и"> => butTwolast + "ь" + last  ;  --?
       -- <_, _ + #vowel + #consonant, _, "е"|"ё"> => butTwolast + last ;
       -- <_, _ + #vowel + #consonant, _, "о"> => butTwolast + last  ;  -- клочок
       _ => butTwolast + last
     } in
     {  -- TODO
      snom = s + nef.snom ;
      pnom = s1 + nef.pnom ;
      sgen = s1 + nef.sgen ;
      pgen = s1 + nef.pgen ;
      sdat = s1 + nef.sdat ;
      pdat = s1 + nef.pdat ;
      sacc = s1 + nef.sacc ;
      pacc = s1 + nef.pacc ;
      sins = s1 + nef.sins ;
      pins = s1 + nef.pins ;
      sprep= s1 + nef.sprep ;
      pprep= s1 + nef.pprep ;
    } ;

  PlGenAlter : Str -> Str -> DeclType -> StressSchema -> Str
   = \s, end, dt, ss ->
      let stem1 = Predef.tk 1 s in
      let stem2 = Predef.tk 2 s in
      let stemEnd1 = Predef.dp 1 s in
      let pgenStressed = stressTable ss "pgen" in
      case <dt, pgenStressed, s> of {
        <6, Stressed, _>  => stem1 + "е" + end;
        <6, _, _>         => stem1 + "и" + end;
        <5, _, _ + ("ь"|"й") + #consonant> => stem2 + "е" + end;
        <3, _, _ + ("й" |"ж"|"ц"|"ч"|"ш"|"щ") + #consonant> => stem2 + "е" + stemEnd1 + end;
        <3, _, _ + #consonant> => stem1 + "о" + stemEnd1 + end ;  -- ^жшчщц
        <1, Stressed, _ + ("ь"|"й") + #consonant> => stem2 + "ё" + stemEnd1 + end ;
        <1, _, _ + ("ь"|"й") + #consonant> => stem2 + "е" + stemEnd1 + end ;
        <_, Unstressed, _ + ("ь"|"й") + #consonant> => stem2 + "е" + end ;
        <_, _, _ + ("ь"|"й") + #consonant> => stem2 + "ё" + end ;
        <_, _, _ + ("г"|"к"|"х") + #consonant> => stem1 + "о" + stemEnd1 + end ;
        <2, Unstressed, _ + "н"> => stem1 + "е" + stemEnd1 + (case end of {"ь"=>"";_=>end}) ; -- ????? песня - песен//ь
        <2, Stressed, _ + "н"> => s + "ё" + (Predef.dp 1 end) ;
        <1|2, Unstressed, _> => stem1 + "е" + stemEnd1 + end;
        <5, _, _>            => stem1 + "е" + stemEnd1 + end ;
        <_, Stressed, _ + ("ж"|"ч"|"ш"|"щ") + #consonant> => stem1 + "о" + stemEnd1 + end ; -- shorted stem?
        <_, Stressed, _> => stem1 + "ё" + stemEnd1 + end ; -- shorted stem?
        _ => s + end + "?!"
   } ;

  mobileTwo : Str -> NounEndForms -> DeclType -> StressSchema -> StemForms
   = \s, nef, dt, ss -> {
      snom = s + nef.snom;
      pnom = s + nef.pnom;
      sgen = s + nef.sgen;
      pgen = PlGenAlter s nef.pgen dt ss ;
      sdat = s + nef.sdat ;
      pdat = s + nef.pdat ;
      sacc = s + nef.sacc ;
      pacc = s + nef.pacc ;
      sins = s + nef.sins ;
      pins = s + nef.pins ;
      sprep= s + nef.sprep;
      pprep= s + nef.pprep;
    } ;

  mobileThree : Str -> NounEndForms -> DeclType -> StressSchema -> StemForms
   = \s, nef, dt, ss ->
     let snom = s + nef.snom in
     let last = Predef.dp 1 s in
     let butLast = Predef.tk 1 s in
     let secondLast = Predef.dp 1 butLast in
     let butTwolast = Predef.tk 2 s in
     let thirdLast = Predef.dp 1 butTwolast in
     let s1 : Str = case <dt, s, thirdLast, secondLast> of {   -- what if more than one consonant or sign?
       <6, _ + #vowel + #consonant, _, "е"|"ё"> => butTwolast + "ь" ;
       <_, _ + #vowel + #consonant, #vowel, "е"|"ё"> => butTwolast + "й" + last ;  --?
       <3, _ + #vowel + #consonant, #consonant_minus, "е"|"ё"> => butTwolast + "ь" + last ;  -- королёк, but овражек
       <1|2|4|5|7|8, _ + #vowel + #consonant, "л", "е"|"ё"> => butTwolast + "ь" + last ;
       <6, _ + #vowel + #consonant, _, "и"> => butTwolast + "ь" + last  ;  --?
       -- <_, _ + #vowel + #consonant, _, "е"|"ё"> => butTwolast + last ;
       -- <_, _ + #vowel + #consonant, _, "о"> => butTwolast + last  ;  -- клочок
       _ => butTwolast + last
     } in
     {  -- TODO
      snom = s + nef.snom ;
      pnom = s1 + nef.pnom ;
      sgen = s1 + nef.sgen ;
      pgen = s1 + nef.pgen ;
      sdat = s1 + nef.sdat ;
      pdat = s1 + nef.pdat ;
      sacc = s + nef.sacc ;
      pacc = s1 + nef.pacc ;
      sins = s + nef.sins ;
      pins = s1 + nef.pins ;
      sprep= s1 + nef.sprep ;
      pprep= s1 + nef.pprep ;
    } ;


  alterStems : Str -> NounEndForms -> Gender -> DeclType -> StressSchema -> StemForms
    = \s, nef, g, dt, ss ->
      case <g, dt> of {
        <Masc, _> => mobileOne s nef dt ss ;
        <Neut, _> => mobileTwo s nef dt ss ;
        <Fem, 8> => mobileThree s nef dt ss ;
        <Fem, _> => mobileTwo s nef dt ss
      } ;

  doAlternations : Str -> NounEndForms -> Gender -> Animacy -> DeclType -> StressSchema -> NounFormsBase
    = \s, nef, g, a, dt, ss ->
      (alterStems s nef g dt ss) ** {g=g; a=a} ;

  alterForms : Str -> NounEndForms -> Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> NounFormsBase
    = \s, nef, g, a, dt, at, ss ->
      case at of {
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
    } ;

  makeNoun : Str -> Gender -> Animacy -> ZIndex -> NounFormsBase
    = \s, g, a, z ->
    case z of {
      Z0 => immutableNounCases s g a ;
      Z dt at ss => formsSelection s g a dt at ss
    } ;

  formsSelection : Str -> Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> NounFormsBase
    = \s, g, a, dt, at, ss ->
      let nef = endingsSelection g a dt at ss in
      let alternated = alterForms s nef g a dt at ss in
      animacySelection dt alternated nef
    ;

  SgAcc : Gender -> Animacy -> DeclType -> NounFormsBase -> Str -> Str
    = \g, a, dt, frm, sacc -> case <g, dt, a, sacc> of {
      <Neut, (3 | 4 | 5 | 6 | 7 | 8), Animate, "?"> => frm.snom ;
      <_, _, Animate, "?"> => frm.sgen ;
      <_, _, Inanimate, "?"> => frm.snom ;
      _ => frm.sacc
    } ;

  PlAcc : Gender -> Animacy -> DeclType -> NounFormsBase -> Str
    = \g, a, dt, frm -> case <g, dt, a> of {
      <Neut, (5 | 7), Animate> => frm.pnom ;
      <Neut, 6, Animate> => frm.pnom ;  -- does not exist
      <_, _, Animate> => frm.pgen ;
      <_, _, Inanimate> => frm.pnom ;
      _ => frm.pacc
    } ;

  animacySelection : DeclType -> NounFormsBase -> NounEndForms -> NounFormsBase
    = \dt, frm, nef -> frm ** {
        sacc=SgAcc frm.g frm.a dt frm nef.sacc;
        pacc=PlAcc frm.g frm.a dt frm ;
        sins=frm.sins  -- TODO: there can be variants {}  ю in addition to й
    } ;

  endingsSelection : Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> NounEndForms
    = \g, a, dt, at, ss ->
    let gDtBased = gDtBasedSelection g dt in
    gDtSsBasedSelection gDtBased ss
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
