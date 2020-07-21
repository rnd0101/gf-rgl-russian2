concrete ConstructionRus of Construction = CatRus **
  open SyntaxRus, ParadigmsRus, ResRus, QuestionRus, SentenceRus, AdverbRus, VerbRus, IdiomRus, ExtendRus in {

lin
  hungry_VP = mkVP (mkA "голодный" "" "1*a/c'" PrefShort) ;
  thirsty_VP = mkVP want_VV (mkVP (mkV "пить")) ;
  tired_VP = mkVP (mkA "усталый" "" "1*a/c'" PrefFull) ;
  scared_VP = mkVP (mkV "бояться") ;
  ill_VP = mkVP ( mkA "больной" "" "1*b" PrefShort) ;
  ready_VP = mkVP (mkA "готовый" "" "1a" PrefShort) ;

  -- : NP -> QCl ;          -- what is x's name / wie heisst x (Ger)
  what_name_QCl np = PredIAdvVP how_IAdv (ComplSlash (SlashV2a (mkV2 (mkV "звать") Gen)) np) ;

-- languages

lincat
  Language = N ;

oper
  mkLanguage = overload {
    mkLanguage : Str -> N = \s -> mkN (mkA s) masculine animate ;
    mkLanguage : Str -> Str -> N = \s,zi -> mkN s masculine inanimate zi;
  } ;

-- : Language -> Adv ; -- in English, auf englisch, englanniksi, etc
lin
  InLanguage l = PrepNP on_Prep (mkNP l) ;
  languageCN l = mkCN l ;
  languageNP l = mkNP l ;

lin afrikaans_Language = mkLanguage "африкаанс" "1a" ;
lin amharic_Language = mkLanguage "амхарский" ;
lin arabic_Language = mkLanguage "арабский" ;
lin bulgarian_Language = mkLanguage "болгарский" ;
lin catalan_Language = mkLanguage "каталанский" ;
lin chinese_Language = mkLanguage "китайский" ;
lin danish_Language = mkLanguage "датский" ;
lin dutch_Language = mkLanguage "голландский" ;
lin english_Language = mkLanguage "английский" ;
lin estonian_Language = mkLanguage "эстонский" ;
lin finnish_Language = mkLanguage "финский" ;
lin french_Language = mkLanguage "французский" ;
lin german_Language = mkLanguage "немецкий" ;
lin greek_Language = mkLanguage "греческий" ;
lin hebrew_Language = mkLanguage "еврейский" ;
lin hindi_Language = mkLanguage "хинди" "0" ;
lin japanese_Language = mkLanguage "японский" ;
lin italian_Language = mkLanguage "итальянский" ;
lin latin_Language = mkLanguage "латинский" ;
lin latvian_Language = mkLanguage "латвийский" ;
lin maltese_Language = mkLanguage "мальтийский" ;
lin nepali_Language = mkLanguage "непальский" ;
lin norwegian_Language = mkLanguage "норвежский" ;
lin persian_Language = mkLanguage "персидский" ;
lin polish_Language = mkLanguage "польский" ;
lin punjabi_Language = mkLanguage "панджаби" "0" ;
lin romanian_Language = mkLanguage "румынский" ;
lin russian_Language = mkLanguage "русский" ;
lin sindhi_Language = mkLanguage "синдхи" "0" ;
lin spanish_Language = mkLanguage "испанский" ;
lin swahili_Language = mkLanguage "суахили" "0";
lin swedish_Language = mkLanguage "шведский" ;
lin thai_Language = mkLanguage "тайский" ;
lin turkish_Language = mkLanguage "турецкий" ;
lin urdu_Language = mkLanguage "урду" "0" ;

}
