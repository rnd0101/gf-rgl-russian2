resource ZaliznyakAlgo = open Prelude, ParamRus in {
flags coding=utf8 ; optimize=all ;

param
  AlterType    = No | Ast | Deg  ;    -- Alternation: eg 1a, 1*a, 1°a
  StressSchema = A | A' | B | B' | C | C' | C'' | D | D' | E | F | F' | F'' ;
  ZCirc        = NoC | ZC1 | ZC2 | ZC12 ;
  ZIndex       = Z0 | Z DeclType AlterType StressSchema | ZC DeclType AlterType StressSchema ZCirc ;
  Stressedness = Stressed | Unstressed ;

  AdjStressSchema = A_ | A'_ | B_ | B'_ | C_ | A_A | A_A' | A_B | A_C | A_A' | A_B' | A_C' | A_C'' | B_A | B_B | B_C | B_A' | B_B' | B_C' | B_C'' ;
  ZAIndex      = ZA0 | ZA DeclType AlterType AdjStressSchema | ZAC DeclType AlterType AdjStressSchema ZCirc ;

oper

--------
-- Nouns

  -- This correspond to the abbreviated Zaliznyak index for nouns.
  -- Complete index contains a lot of additions.

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

  digitToDeclType : Str -> DeclType
    = \s ->
      case s of {
        "0" => 0 ;
        "1" => 1 ;
        "2" => 2 ;
        "3" => 3 ;
        "4" => 4 ;
        "5" => 5 ;
        "6" => 6 ;
        "7" => 7 ;
        "8" => 8
      } ;

  toStressSchema : Str -> StressSchema
    = \s ->
      case s of {
        "a" => A ;
        "a'" => A' ;
        "b" => B ;
        "b'" => B' ;
        "c" => C ;
        "c'" => C' ;
        "c''" => C'' ;
        "d" => D ;
        "d'" => D' ;
        "e" => E ;
        "f" => F ;
        "f'" => F' ;
        "f''" => F'' ;
        _ => A
      } ;

  toAlterType : Str -> AlterType
    = \s ->
      case s of {
        "*" => Ast ;
        "°" => Deg ;
        _ => No
      } ;

  toZCirc: Str -> ZCirc
    = \s ->
      case s of {
        "①" | "(1)" => ZC1 ;
        "①②" | "②①" | "(1)(2)" | "(2)(1)" => ZC12 ;
        "②" | "(2)" => ZC2 ;
        _ => NoC
      } ;

  parseIndex : Str -> ZIndex
    = \s ->
      case s of {
        "0" => Z0 ;
        dt@(#digit) + at@("*"|"°"|"") + ss@(#stress_schema) + zc@("①"|"①②"|"②①"|"②"|"(1)"|"(1)(2)"|"(2)(1)"|"(2)")
          => ZC (digitToDeclType dt) (toAlterType at) (toStressSchema ss) (toZCirc zc) ;
        dt@(#digit) + at@("*"|"°"|"") + ss@(#stress_schema)
          => Z (digitToDeclType dt) (toAlterType at) (toStressSchema ss) ;
        _ => Predef.error "Error: incorrect ZIndex"
      } ;

  mobileOne : Str -> NounEndForms -> DeclType -> StressSchema -> StemForms
   = \s, nef, dt, ss ->
     let snom = s + nef.snom in
     let cmp_base : Str = case snom of {
       _ + "ь" => s ;
       _ => snom
     } in
     let last = Predef.dp 1 cmp_base in
     let butLast = Predef.tk 1 cmp_base in
     let secondLast = Predef.dp 1 butLast in
     let butTwolast = Predef.tk 2 cmp_base in
     let thirdLast = Predef.dp 1 butTwolast in
     let s1 : Str = case <dt, cmp_base, thirdLast, secondLast> of {   -- what if more than one consonant or sign? eg день
       <6, _ + #vowel + #consonant, _, "е"|"ё"> => butTwolast + "ь" ;
       <_, _ + #vowel + #consonant, #vowel, "е"|"ё"> => butTwolast + "й" + last ;  --?
       <3, _ + #vowel + #consonant, #consonant_minus, "е"|"ё"> => butTwolast + "ь" + last ;  -- королёк, but овражек
       <1|2|4|5|7|8, _ + #vowel + #consonant, "л", "е"|"ё"> => butTwolast + "ь" + last ;
       <6, _ + #vowel + #consonant, _, "и"> => butTwolast + "ь" + last  ;  --?
       <_, _ + #vowel + #consonant, _, "е"|"ё"> => butTwolast + last ;
       <_, _ + #vowel + #consonant, _, "о"> => butTwolast + last  ;  -- клочок
       _ => s
     } in
     {
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
        <3, _, _ + ("й" |"ж"|"ц"|"ч"|"ш"|"щ") + #consonant> => stem1 + "е" + stemEnd1 + end;  -- бабушка
        <3, _, _ + #consonant> => stem1 + "о" + stemEnd1 + end ;  -- ^жшчщц - голубка
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
        _ => s + end
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
    = \word, g, a, z ->
    case z of {
      Z0 => immutableNounCases word g a ;
      Z 3 Deg ss => formsSelectionOnok word g a 3 Deg ss NoC ;
      Z 1 Deg ss => formsSelectionAnin word g a 3 Deg ss NoC ;
      Z 8 Deg ss => formsSelectionMya word g a 8 Deg ss NoC ;
      Z dt at ss => formsSelectionNoun word g a dt at ss NoC ;
      ZC 1 Deg ss ci => formsSelectionAnin word g a 3 Deg ss ci ;
      ZC dt at ss ci => formsSelectionNoun word g a dt at ss ci
    } ;

  myaCases : Str -> NounEndForms
    = \stem ->
    let suffix="ен" in
    let pGenSuf=case stem of {("сем"|"стрем") => "ян"; _  => "ён"} in
    {
      snom=stem + "я";
      pnom=stem + suffix + "а";
      sgen=stem + suffix + "и";
      pgen=stem + pGenSuf ;
      sdat=stem + suffix + "и";
      pdat=stem + suffix + "ам";
      sacc=stem + "я";
      pacc=stem + suffix + "а";
      sins=stem + suffix + "ем";
      pins=stem + suffix + "ами";
      sprep=stem + suffix + "и";
      pprep=stem + suffix + "ах"
  } ;

  formsSelectionMya : Str -> Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> ZCirc -> NounFormsBase
    = \word, g, a, dt, at, ss, ci ->
      let butLast = Predef.tk 1 word in
      (myaCases butLast) ** {a=a; g=g} ;

  formsSelectionOnok : Str -> Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> ZCirc -> NounFormsBase
    = \word, g, a, dt, at, ss, ci ->
      let sgForms = formsSelectionNoun word g a dt Ast ss ci in
      case word of {
          _ + "ёнок" => combineDiffSgPlStems sgForms (formsSelectionNoun (Predef.tk 4 word + "ята") Neut a 8 Ast ss NoC) ;
          _ + "онок" => combineDiffSgPlStems sgForms(formsSelectionNoun (Predef.tk 4 word + "ата") Neut a 8 Ast ss NoC) ;
          _ + "ёночек" => combineDiffSgPlStems sgForms (formsSelectionNoun (Predef.tk 6 word + "ятка") Fem a 3 Ast ss NoC) ;
          _ + "оночек" => combineDiffSgPlStems sgForms (formsSelectionNoun (Predef.tk 6 word + "атка") Fem a 3 Ast ss NoC) ;
          _ => sgForms
      } ;

  formsSelectionAnin : Str -> Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> ZCirc -> NounFormsBase
    = \word, g, a, dt, at, ss, ci ->
      let butTwolast = Predef.tk 2 word in
      let sgForms = formsSelectionNoun word g a dt Ast ss ci in
      case word of {
          _ + ("анин"|"янин") => combineDiffSgPlStems sgForms (formsSelectionNoun (butTwolast + "н") Neut a 8 Ast ss NoC) ** {pnom=butTwolast + "е"};
          _ => sgForms
      } ;

  combineDiffSgPlStems : NounFormsBase -> NounFormsBase -> NounFormsBase
    = \sgn, pln -> sgn ** {
      pnom =  pln.pnom ;
      pgen =  pln.pgen ;
      pdat =  pln.pdat ;
      pacc =  pln.pacc ;
      pins =  pln.pins ;
      pprep=  pln.pprep
    } ;

  formsSelectionNoun : Str -> Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> ZCirc -> NounFormsBase
    = \word, g, a, dt, at, ss, ci ->
      let stem = stemFromNoun word g dt in
      let nef = endingsSelectionNoun g a dt at ss ci in
      let nef' = specialEndingsNoun word stem nef g dt in
      let alternated = alterForms stem nef' g a dt at ss in
      animacySelectionNoun dt alternated nef' g a
    ;

  stemFromNoun : Str -> Gender -> DeclType -> Str
    = \word, g, dt ->
      let end1 = (gDtBasedSelectionNoun g dt).snom.p1 in
      case end1 of {
        "" => word ;
        _ => Predef.tk 1 word
      }
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

  animacySelectionNoun : DeclType -> NounFormsBase -> NounEndForms -> Gender -> Animacy -> NounFormsBase
    = \dt, frm, nef, g, a -> frm ** {
        sacc=SgAcc g a dt frm nef.sacc;
        pacc=PlAcc g a dt frm ;
        sins=frm.sins  -- TODO: there can be variants {}  ю in addition to й
    } ;

  endingsSelectionNoun : Gender -> Animacy -> DeclType -> AlterType -> StressSchema -> ZCirc -> NounEndForms
    = \g, a, dt, at, ss, ci ->
    let gDtBased = gDtBasedSelectionNoun g dt in
    let gDtBasedCirc = circCorrectionNoun gDtBased g dt ci in
    gDtSsBasedSelectionNoun gDtBasedCirc ss
  ;

  specialEndingsNoun : Str -> Str -> NounEndForms -> Gender -> DeclType -> NounEndForms
    = \word, stem, nef1, g, dt ->
    let stemEnds = Predef.dp 1 stem in
    let wordEnds = Predef.dp 1 word in
    case <g, dt, stemEnds, wordEnds> of {
      <_, 8, ("ж"|"ч"|"ш"|"щ"), _> => nef1 ** {pdat="ам";pins="ами";pprep="ах"} ;
      <Neut, 2|6|7, _, "ё"> => nef1 ** {snom="ё"} ;
      _ => nef1
    } ;

  circCorrectionNoun : NounEndFormsS1 -> Gender -> DeclType -> ZCirc -> NounEndFormsS1
    = \nef1, g, dt, ci ->
      let trans1 : NounEndFormsS1 = case <g, ci> of {
        <Masc, ZC1|ZC12> => nef1 ** {pnom=(gDtBasedSelectionNoun Neut dt).pnom} ;
        <Neut, ZC1|ZC12> => nef1 ** {pnom=(gDtBasedSelectionNoun Masc dt).pnom} ;
        _ => nef1
      } in
      case <g, ci> of {
        <Masc, ZC2|ZC12> => trans1 ** {pgen=(gDtBasedSelectionNoun Neut dt).pgen} ;
        <Neut, ZC2|ZC12> => trans1 ** {pgen=(gDtBasedSelectionNoun Masc dt).pgen} ;
        <Fem,  ZC2|ZC12> => trans1 ** {pgen=(gDtBasedSelectionNoun Masc dt).pgen} ;
        _ => trans1
      } ;

  selStress : EndingSpec -> Stressedness -> Str
    = \es, sness ->
    case <es, sness> of {
      <<v, v'>, Unstressed> => v ;
      <<v, v'>, Stressed> => v' ;
      <<s>, _> => s
    } ;

  gDtSsBasedSelectionNoun : NounEndFormsS1 -> StressSchema -> NounEndForms
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

  gDtBasedSelectionNoun : Gender -> DeclType -> NounEndFormsS1
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

-------------
-- Adjectives

  adjective2AstB : Str -> AdjFormsBase
    = \word -> -- весь
      let stem = Predef.tk 1 word in
      let stem2 = Predef.tk 2 word ++ Predef.tk 1 word in
      {
        msnom=stem   +"ь" ;
        fsnom=stem2  +"я" ;
        nsnom=stem2  +"ё" ;
        pnom=stem2   +"е" ;
        msgen=stem2  +"его" ;
        fsgen=stem2  +"ей" ;
        pgen=stem2   +"ех" ;
        msdat=stem2  +"ему" ;
        fsacc=stem2  +"ю" ;
        msins=stem2  +"ем" ;
        fsins=stem2  +"ей" ; -- ею
        pins=stem2   +"еми" ;
        msprep=stem2 +"ем" ;  --ём
        sm=stem     +"ь" ;
        sf=stem     +"ё" ;
        sn=stem     +"е" ;
        sp=stem     +"е" ;
    } ;

  toAdjStressSchema : Str -> AdjStressSchema
    = \s ->
      case s of {
        "b/c''" => B_C'' ;
        "a/c''" => A_C'' ;
        "a/b'" => A_B' ;
        "a/c'" => A_C' ;
        "b/a'" => B_A' ;
        "a/a'" => A_A' ;
        "b/b'" => B_B' ;
        "b/c'" => B_C' ;
        "b/c" => B_C ;
        "b/a" => B_A ;
        "b/b" => B_B ;
        "a/a" => A_A ;
        "a/c" => A_C ;
        "a/b" => A_B ;
        "a'" => A'_ ;
        "b'" => B'_ ;
        "a" => A_ ;
        "b" => B_ ;
        "c" => C_ ;
        _ => A_
      } ;

  parseAdjIndex : Str -> ZAIndex
    = \s ->
      case s of {
        "0" => ZA0 ;
        dt@(#digit) + at@("*"|"°"|"") + ss@(#adj_stress_schema) + zc@("①"|"①②"|"②①"|"②"|"(1)"|"(1)(2)"|"(2)(1)"|"(2)")
          => ZAC (digitToDeclType dt) (toAlterType at) (toAdjStressSchema ss) (toZCirc zc) ;
        dt@(#digit) + at@("*"|"°"|"") + ss@(#adj_stress_schema)
          => ZA (digitToDeclType dt) (toAlterType at) (toAdjStressSchema ss) ;
        _ => Predef.error "Error: incorrect ZAIndex"
      } ;


  AdjectiveEndFormsS1 : Type = {
      msnom, fsnom, nsnom, pnom, msgen, fsgen, pgen, msdat, fsacc, msins, fsins, pins, msprep : EndingSpec ;
  } ;

  AdjectiveImmutableCasesS1 : AdjectiveEndFormsS1 = {
    msnom=<"","">;fsnom=<"","">;nsnom=<"","">;pnom=<"","">;msgen=<"","">;fsgen=<"","">;pgen=<"","">;msdat=<"","">;fsacc=<"","">;msins=<"","">;fsins=<"","">;pins=<"","">;msprep=<"","">;
  } ;

  immutableAdjectiveCases : Str -> Animacy -> AdjFormsBase
    = \s, a -> {
      msnom=s;fsnom=s;nsnom=s;pnom=s;msgen=s;fsgen=s;pgen=s;msdat=s;fsacc=s;msins=s;fsins=s;pins=s;msprep=s
    } ;

  makeAdjective : Str -> Animacy -> ZAIndex -> AdjFormsBase
    = \word, a, z ->
    case z of {
      ZA0 => immutableAdjectiveCases word a ;
      ZA dt at ss => formsSelectionAdjective word a dt at ss NoC ;
      ZAC dt at ss ci => formsSelectionAdjective word a dt at ss ci ;
      _ => immutableAdjectiveCases word a  -- TODO
    } ;

  formsSelectionAdjective : Str -> Animacy -> DeclType -> AlterType -> AdjStressSchema -> ZCirc -> AdjFormsBase
    = \word, a, dt, at, ss, ci ->
      let stem = stemFromAdjective word dt in
      let aef = endingsSelectionAdj a dt at ss ci in
      -- let aef' = specialEndingsNoun word stem aef dt in
      let alternated = alterFormsAdj stem aef a dt at ss in
      --animacySelectionNoun dt alternated aef a
      alternated
    ;

  stemFromAdjective : Str -> DeclType -> Str
    = \word, dt ->
      let end1 = (gDtBasedSelectionAdj dt).msnom.p1 in
      case end1 of {
        "" => word ;
        _ => Predef.tk 2 word
      }
    ;

  alterFormsAdj : Str -> AdjFormsBase -> Animacy -> DeclType -> AlterType -> AdjStressSchema -> AdjFormsBase
    = \s, aef, a, dt, at, ss ->
      case at of {
        -- Ast => doAlternations s aef a dt ss ;
        _ => {
          msnom = s + aef.msnom  ;
          fsnom = s + aef.fsnom  ;
          nsnom = s + aef.nsnom  ;
          pnom  = s + aef.pnom   ;
          msgen = s + aef.msgen  ;
          fsgen = s + aef.fsgen  ;
          pgen  = s + aef.pgen   ;
          msdat = s + aef.msdat  ;
          fsacc = s + aef.fsacc  ;
          msins = s + aef.msins  ;
          fsins = s + aef.fsins  ;
          pins  = s + aef.pins   ;
          msprep= s + aef.msprep ;
          sm    = s + aef.sm     ;
          sf    = s + aef.sf     ;
          sn    = s + aef.sn     ;
          sp    = s + aef.sp
        }
    } ;


  endingsSelectionAdj : Animacy -> DeclType -> AlterType -> AdjStressSchema -> ZCirc -> AdjFormsBase
    = \a, dt, at, ss, ci ->
    let gDtBased = gDtBasedSelectionAdj dt in
    -- let gDtBasedCirc = circCorrectionNoun gDtBased dt ci in
    gDtSsBasedSelectionAdj gDtBased ss
  ;

  gDtSsBasedSelectionAdj : AdjectiveEndFormsS1 -> AdjStressSchema -> AdjFormsBase
    = \aef1, ss ->
      {
        msnom  = stressSelectionAdj aef1.msnom  ss "msnom" ;
        fsnom  = stressSelectionAdj aef1.fsnom  ss "fsnom" ;
        nsnom  = stressSelectionAdj aef1.nsnom  ss "nsnom" ;
        pnom   = stressSelectionAdj aef1.pnom   ss "pnom" ;
        msgen  = stressSelectionAdj aef1.msgen  ss "msgen" ;
        fsgen  = stressSelectionAdj aef1.fsgen  ss "fsgen" ;
        pgen   = stressSelectionAdj aef1.pgen   ss "pgen " ;
        msdat  = stressSelectionAdj aef1.msdat  ss "msdat" ;
        fsacc  = stressSelectionAdj aef1.fsacc  ss "fsacc" ;
        msins  = stressSelectionAdj aef1.msins  ss "msins" ;
        fsins  = stressSelectionAdj aef1.fsins  ss "fsins" ;
        pins   = stressSelectionAdj aef1.pins   ss "pins" ;
        msprep = stressSelectionAdj aef1.msprep ss "msprep" ;
        sm     = stressSelectionAdj aef1.sm     ss "sm" ;
        sf     = stressSelectionAdj aef1.sf     ss "sf" ;
        sn     = stressSelectionAdj aef1.sn     ss "sn" ;
        sp     = stressSelectionAdj aef1.sp     ss "sp"
    } ;

  stressSelectionAdj : EndingSpec -> AdjStressSchema -> Str -> Str
    = \es, ss, c ->
    selStress es (stressTableAdj ss c) ;

  stressTableAdj : AdjStressSchema -> Str -> Stressedness
    = \ss, c ->
    case <ss, c> of {
      <A'_, "sf"> => Stressed ;
      <B_, "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"|"sn"|"sp"> => Stressed ;
      <B'_, "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"|"sn"|"sp"> => Stressed ;
      <A_B, "sf"|"sn"|"sp"> => Stressed ;
      <A_C, "sf"> => Stressed ;
      <A_A', "sf"> => Stressed ;
      <A_B', "sf"|"sn"|"sp"> => Stressed ;
      <A_C', "sf"|"sp"> => Stressed ;
      <A_C'', "sf"|"sn"|"sp"> => Stressed ;
      <B_A, "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"> => Stressed ;
      <B_B, "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"|"sn"|"sp"> => Stressed ;
      <B_C, "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"> => Stressed ;
      <B_A', "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"> => Stressed ;
      <B_B', "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"|"sn"|"sp"> => Stressed ;
      <B_C', "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"|"sp"> => Stressed ;
      <B_C'', "msnom"|"fsnom"|"nsnom"|"msgen"|"fsgen"|"msdat"|"fsacc"|"msins"|"fsins"|"msprep"|"pnom"|"pgen"|"pins"|"sf"|"sn"|"sp"> => Stressed ;
      <_, _> => Unstressed
    } ;

  gDtBasedSelectionAdj : DeclType -> AdjectiveEndFormsS1
    = \dt -> case dt of {
      0 => AdjectiveImmutableCasesS1 ;
      1 => {msnom=<"ый","ой">;msgen=<"ого","ого">;msdat=<"ому","ому">;msins=<"ым","ым">;msprep=<"ом","ом">;sm=<"","">;fsnom=<"ая","ая">;fsgen=<"ой","ой">;fsacc=<"ую","ую">;fsins=<"ой","ой">;sf=<"а","а">;nsnom=<"ое","ое">;sn=<"о","о">;pnom=<"ые","ые">;pgen=<"ых","ых">;pins=<"ыми","ыми">;sp=<"ы","ы">} ;
      2 => {msnom=<"ий","ий">;msgen=<"его","его">;msdat=<"ему","ему">;msins=<"им","им">;msprep=<"ем","ем">;sm=<"ь","ь">;fsnom=<"яя","яя">;fsgen=<"ей","ей">;fsacc=<"юю","юю">;fsins=<"ей","ей">;sf=<"я","я">;nsnom=<"ее","ее">;sn=<"е","ё">;pnom=<"ие","ие">;pgen=<"их","их">;pins=<"ими","ими">;sp=<"и","и">} ;
      3 => {msnom=<"ий","ой">;msgen=<"ого","ого">;msdat=<"ому","ому">;msins=<"им","им">;msprep=<"ом","ом">;sm=<"","">;fsnom=<"ая","ая">;fsgen=<"ой","ой">;fsacc=<"ую","ую">;fsins=<"ой","ой">;sf=<"а","а">;nsnom=<"ое","ое">;sn=<"о","о">;pnom=<"ие","ие">;pgen=<"их","их">;pins=<"ими","ими">;sp=<"и","и">} ;
      4 => {msnom=<"ий","ой">;msgen=<"его","ого">;msdat=<"ему","ому">;msins=<"им","им">;msprep=<"ем","ом">;sm=<"","">;fsnom=<"ая","ая">;fsgen=<"ей","ой">;fsacc=<"ую","ую">;fsins=<"ей","ой">;sf=<"а","а">;nsnom=<"ее","ое">;sn=<"е","о">;pnom=<"ие","ие">;pgen=<"их","их">;pins=<"ими","ими">;sp=<"и","и">} ;
      5 => {msnom=<"ый","ой">;msgen=<"его","ого">;msdat=<"ему","ому">;msins=<"ым","ым">;msprep=<"ем","ом">;sm=<"","">;fsnom=<"ая","ая">;fsgen=<"ей","ой">;fsacc=<"ую","ую">;fsins=<"ей","ой">;sf=<"а","а">;nsnom=<"ее","ое">;sn=<"е","о">;pnom=<"ые","ые">;pgen=<"ых","ых">;pins=<"ыми","ыми">;sp=<"ы","ы">} ;
      6 => {msnom=<"ий","ий">;msgen=<"его","его">;msdat=<"ему","ему">;msins=<"им","им">;msprep=<"ем","ем">;sm=<"й","й">;fsnom=<"яя","яя">;fsgen=<"ей","ей">;fsacc=<"юю","юю">;fsins=<"ей","ей">;sf=<"я","я">;nsnom=<"ее","ее">;sn=<"е","ё">;pnom=<"ие","ие">;pgen=<"их","их">;pins=<"ими","ими">;sp=<"и","и">} ;
      _ => {msnom=<"ий","ий">;msgen=<"его","его">;msdat=<"ему","ему">;msins=<"им","им">;msprep=<"ем","ем">;sm=<"ь","ь">;fsnom=<"яя","яя">;fsgen=<"ей","ей">;fsacc=<"юю","юю">;fsins=<"ей","ей">;sf=<"я","я">;nsnom=<"ее","ее">;sn=<"е","ё">;pnom=<"ие","ие">;pgen=<"их","их">;pins=<"ими","ими">;sp=<"и","и">}
    } ;

--------
-- Verbs

  stemFromVerb : Str -> Str * Reflexivity
    = \v ->
      case v of {
        s + ("ть" | "ти" | "чь") => <s, NonReflexive> ;
        s + ("ться" | "тись" | "чься") => <s, Reflexive> ;
        _ => Predef.error "Error: incorrect infinitive"
      } ;

}
