concrete ConstructionRus of Construction = CatRus **
  open SyntaxRus, ParadigmsRus, ResRus, QuestionRus, SentenceRus, AdverbRus, VerbRus, IdiomRus, (E=ExtendRus) in {

lin
  hungry_VP = mkVP (mkA "голодный" "" "1*a/c'" PrefShort) ;
  thirsty_VP = mkVP want_VV (mkVP (mkV "пить")) ;
  tired_VP = mkVP (mkA "усталый" "" "1*a/c'" PrefFull) ;
  scared_VP = mkVP (mkV "бояться") ;
  ill_VP = mkVP ( mkA "больной" "" "1*b" PrefShort) ;
  ready_VP = mkVP (mkA "готовый" "" "1a" PrefShort) ;

  -- : NP -> QCl ;          -- what is x's name / wie heisst x (Ger)
  what_name_QCl np = E.PredIAdvVP how_IAdv (ComplSlash (SlashV2a (mkV2 (mkV "звать") Gen)) np) ;

-- languages

lincat
  Language = N ;
  Timeunit = N ;
  Weekday = N ;
  Monthday = NP ;
  Month = N ;
  Year = NP ;

oper
  mkLanguage = overload {
    mkLanguage : Str -> N = \s -> mkN (mkA s) masculine animate ;
    mkLanguage : Str -> Str -> N = \s,zi -> mkN s masculine inanimate zi;
  } ;

lin
  -- : Card -> Timeunit -> Adv ; -- (for) three hours
  timeunitAdv n time = mkAdv ((mkNP <lin Card n : Card> time).s ! Nom) ;

{-
  timeunitRange : Card -> Card -> Timeunit -> Adv ; -- (cats live) ten to twenty years

  oneHour : Hour ;
  twoHour : Hour ;
  threeHour : Hour ;
  fourHour : Hour ;
  fiveHour : Hour ;
  sixHour : Hour ;
  sevenHour : Hour ;
  eightHour : Hour ;
  nineHour : Hour ;
  tenHour : Hour ;
  elevenHour : Hour ;
  twelveHour : Hour ;
  thirteenHour : Hour ;
  fourteenHour : Hour ;
  fifteenHour : Hour ;
  sixteenHour : Hour ;
  seventeenHour : Hour ;
  eighteenHour : Hour ;
  nineteenHour : Hour ;
  twentyHour : Hour ;
  twentyOneHour : Hour ;
  twentyTwoHour : Hour ;
  twentyThreeHour : Hour ;
  twentyFourHour : Hour ;

  timeHour : Hour -> Adv ; -- at three a.m./p.m.
  timeHourMinute : Hour -> Card -> Adv ; -- at six forty a.m./p.m.

  weekdayPunctualAdv : Weekday -> Adv ;  -- on Monday
  weekdayHabitualAdv : Weekday -> Adv ;  -- on Mondays
  weekdayLastAdv : Weekday -> Adv ;      -- last Monday
  weekdayNextAdv : Weekday -> Adv ;      -- next Monday

  monthAdv        : Month -> Adv ;                        -- in June
  yearAdv         : Year -> Adv ;                         -- in 1976
  dayMonthAdv     : Monthday -> Month -> Adv ;            -- on 17 May
  monthYearAdv    : Month -> Year -> Adv ;                -- in May 2013
  dayMonthYearAdv : Monthday -> Month -> Year -> Adv ;    -- on 17 May 2013

  intYear     : Int -> Year ;  -- (year) 1963
  intMonthday : Int -> Monthday ; -- 31th (March)
  intYear = symb ;
  intMonthday = symb ;

-}

----------------------------------------------
---- lexicon of special names

lin
  second_Timeunit = mkN "секунда" ;
  minute_Timeunit = mkN "минута" ;
  hour_Timeunit = mkN "час" Masc Inanimate "1c" ;
  day_Timeunit = mkN "день" masculine inanimate "2*b" ;
  week_Timeunit = mkN "неделя" Fem Inanimate "2a" ;
  month_Timeunit = mkN "месяц" Masc Inanimate "5a" ;
  year_Timeunit = lin N ((mkNplus (mkN "год")) ** {sloc="году"; pgen="лет"}) ;

  monday_Weekday = mkN "понедельник" ;
  tuesday_Weekday = mkN "вторник" ;
  wednesday_Weekday = mkN "среда" ;
  thursday_Weekday = mkN "четверг" ;
  friday_Weekday = mkN "пятница" ;
  saturday_Weekday = mkN "суббота" ;
  sunday_Weekday = mkN "воскресенье" ;

  january_Month = mkN "январь" ;
  february_Month = mkN "февраль" ;
  march_Month = mkN "март" ;
  april_Month = mkN "апрель" ;
  may_Month = mkN "май" ;
  june_Month = mkN "июнь" ;
  july_Month = mkN "июль" ;
  august_Month = mkN "август" ;
  september_Month = mkN "сентябрь" ;
  october_Month = mkN "октябрь" ;
  november_Month = mkN "ноябрь" ;
  december_Month = mkN "декабрь" ;

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
