resource ResRus = ParamX ** open Prelude in {
flags coding=utf8 ; optimize=all ;

-- parameters

param
  -- Mostly follows https://en.wikipedia.org/wiki/List_of_glossing_abbreviations
  Gender     = Masc | Fem | Neut ;
  Case       = Nom | Gen | Dat | Acc | Ins | Prep
              | Loc | Ptv | Voc ;  -- some words, frequent in speech. Defaults: Loc -> Prep, Ptv -> Gen, Voc -> Nom
  Animacy    = Animate | Inanimate ;
  Voice      = Act | Pass | Refl ;
  Aspect     = Imperfective | Perfective ;
  RusTense      = Pres | Pst | Fut ;
  AfterPrep  = Yes | No ;  -- to variate pronouns starting with vowels.
  Possessive = NonPoss | Poss GenNum ;
  ClForm =  ClIndic RusTense Anteriority | ClCond  | ClIndf | ClImperf ;
  Agr = Ag Gender Number Person ; -- The plural never makes a gender distinction

-- TODO: dual gender nouns. See [KING1]

-- The AfterPrep parameter is introduced in order to describe
-- the variations of the third person personal pronoun forms
-- depending on whether they come after a preposition or not.

-- TODO: ++ BIND ++ gluing ? See [LISTENMAA1]

-- also: "над ним" - "надо мной"

-- TODO: cleanup
-- Declination forms depend on Case, Animacy , Gender:
-- "большие дома" - "больших домов" (big houses - big houses'),
-- Animacy plays role only in the Accusative case (Masc Sg and Plural forms):
-- Accusative Animate = Genetive, Accusaive Inanimate = Nominative
-- "я люблю большие дома-"я люблю больших мужчин"
-- (I love big houses - I love big men);
-- and on Number: "большой дом - "большие дома"
-- (a big house - big houses).

-- phonology
-- TBD

---------------
-- Nouns
---------------

-- novel idea (for RGL): lexical items stored as records rather than tables. See [???]
-- advantages:
-- - easier to make exceptions to paradigms (by ** {})
-- - easier to keep the number of forms minimal
-- - easier to see what is happening than with lots of anonymous arguments to mkN, mkA, mkV

-- so this is the lincat of N

  NounForms : Type = {
    snom, sgen, sdat, sacc, sins, sprep, sloc, sptv, svoc,
    pnom, pgen, pdat, pacc, pins, pprep, ploc, pptv, pvoc : Str ;
    g : Gender
  } ;

-- But traditional tables make agreement easier to handle in syntax
-- so this is the lincat of CN

  Noun : Type = {
    s : Number => Case => Str ;
    g : Gender
  } ;

-- this is used in UseN

  nounFormsNoun : NounForms -> Noun
    = \forms -> {
      s = table {
        Sg => table {
  	      Nom => forms.snom ;
	      Gen => forms.sgen ;
	      Dat => forms.sdat ;
	      Acc => forms.sacc ;
	      Ins => forms.sins ;
	      Prep => forms.sprep ;
	      Loc => forms.sloc ;
	      Ptv => forms.sptv ;
	      Voc => forms.svoc
	    } ;
        Pl => table {
	      Nom => forms.pnom ;
	      Gen => forms.pgen ;
	      Dat => forms.pdat ;
	      Acc => forms.pacc ;
	      Ins => forms.pins ;
	      Prep => forms.pprep ;
	      Loc => forms.ploc ;
	      Ptv => forms.pptv ;
	      Voc => forms.pvoc
	    }
	  } ;
      g = forms.g
  } ;

  DeclensionType : Type = Str -> NounForms ;


---------------------------
-- Adjectives

---------------------
-- Verbs


---------------------------
-- Pronouns

  PronForms : Type = {
    nom, gen, dat, acc, ins, prep, loc, ptv, voc : Str ;
    a : Agr
  } ;

  personalPron : Agr -> PronForms =
    \a -> {a = a} **
      case a of {
        Ag _ Sg P1 => {
          nom, voc = "я" ;
          gen, acc, ptv = "меня" ;
          dat, prep, loc = "мне" ;
          ins = variants {"мной" ; "мною"}
          } ;
        Ag _ Sg P2 => {
          nom, voc = "ты" ;
          gen, acc, ptv = "тебя" ;
          dat, prep, loc = "тебе" ;
          ins = variants {"тобой" ; "тобою"}
          } ;
        Ag Masc Sg P3 => {
          nom, voc = "он",
          gen, acc, ptv = "его" ;   -- TODO: n
          dat = "ему" ;   -- TODO: n
          ins = "им" ;   -- TODO: n
          prep, loc = "нём"
          } ;
        Ag Fem Sg P3 => {
          nom, voc = "она",
          gen, ptv = variants { "её"; "ей" } ;           -- TODO: n
          dat = "ей" ;                     -- TODO: n
          acc = "её" ;           -- TODO: n
          ins = variants { "ей"; "ею" } ;   -- TODO: n
          prep, loc = "ней"
          } ;
        Ag Neutr Sg P3 => {  -- TODO: same as Masc, how to combine?
          nom, voc = "оно",
          gen, acc, ptv = "его" ;   -- TODO: n
          dat = "ему" ;   -- TODO: n
          ins = "им" ;   -- TODO: n
          prep, loc = "нём"
          } ;
        Ag _ Pl P1 => {
          nom, voc = "мы",
          gen, acc, ptv = "нас" ;
          dat = "нам" ;
          ins = "нами" ;
          prep, loc = "нас"
          } ;
        Ag _ Pl P2 => {
          nom, voc = "вы",
          gen, acc, ptv = "вас" ;
          dat = "вам" ;
          ins = "вами" ;
          prep, loc = "вас"
          } ;
        Ag _ Pl P3 => {
          nom, voc = "они" ;
          gen, acc, ptv = "их" ;   -- TODO: n
          dat = "им" ;   -- TODO: n
          ins = "ими" ;   -- TODO: n
          prep, loc = "них"
      }
  } ;


-- Possessive pronouns are more like adjectives


---------------
-- Numerals
---------------


--------------------------------
-- combining nouns with numerals

param
  NumSize = Num1 | Num2_4 | Num5 ;

-- TODO From po-file Forms:
-- (n%10==1 && n%100!=11 ? Num1 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? Num2_4 : Num5 );

oper
  numSizeForm : (Number => Case => Str) -> NumSize -> Case -> Str ;  -- TODO:
  numSizeAgr : Gender -> NumSize -> Person -> Agr ; -- TODO
  numSizeNumber : NumSize -> Number ; -- TODO
}

}
