--# -path=.:abstract:common
concrete LexiconRus of Lexicon = CatRus **
  open ParadigmsRus, StructuralRus, Prelude, ExtraRus, ResRus in {
flags optimize=values ; coding=utf8 ;
lin
  add_V3 = mkV3 (mkV "складывать" ) obj_no_Prep to2_Prep ;
  airplane_N = mkN "самолёт" ;
  alas_Interj = mkInterj "увы" ;
  already_Adv = mkAdv "уже" ;
  animal_N = mkN (mkA "животный") masculine animate ;
  apartment_N = mkN "квартира" ;
  apple_N = mkN "яблоко" neuter inanimate "3a(1)" ;
  art_N = mkN "искусство" ;
  ashes_N = mkN "пепел" masculine inanimate "1*a" ;
  baby_N = mkN "малыш" masculine animate "4b" ;
  back_N = mkN "спина" ;
  bad_A = mkA "плохой" "хуже" "3b/c'";
  bank_N = mkN "банк" ;
  bark_N = mkN "кора";
  beautiful_A = mkA "красивый" ;
  beer_N = mkN "пиво" neuter inanimate ;
  beg_V2V = dirV2 (mkV "просить");
  belly_N = mkN "живот" ;
  big_A = (mkAltShort (mkA "большой" "больше") (mkA "великий")) ;
  bike_N = mkN "велосипед" ;
  bird_N = mkN "птица" feminine animate ;
  black_A = (mkAltShort (mkA "чёрный") (mkA "черный")) ;  -- workaround TODO: Any way to remove yo from stem?
  blood_N = mkN "кровь" ;
  blue_A = mkA "голубой" ;
  boat_N = mkN "лодка" ;
  bone_N = mkN "кость" ;
  book_N = mkN "книга" ;
  boot_N = mkN "сапог" ;
  boss_N = mkN "начальник" masculine animate ;
  boy_N = mkN "мальчик" masculine animate ;
  bread_N = mkN "хлеб" ;
  breast_N = mkN "грудь" ;
  broad_A = mkA "широкий" "шире" ;
  brother_N2 = (mkN2plus (mkN2 "брат" masculine animate "1a" nullPrep)) ** {pnom="братья";pgen="братьев";pdat="братьям";pacc="братьев";pins="братьями";pprep="братьях"} ;
  brown_A = mkA "коричневый";
  butter_N = mkN "масло";
  camera_N = mkN "фотоаппарат" ;
  cap_N = mkN "чашка" ;
  car_N = mkN "машина" ;
  carpet_N = mkN "ковёр" masculine inanimate "1b" ;
  cat_N = mkN "кошка" feminine animate "1*a" ;
  ceiling_N = mkN "потолок" masculine inanimate "3*b";
  chair_N = (mkNplus (mkN "стул" masculine inanimate "1a")) ** {pnom="стулья";pgen="стульев";pdat="стульям";pacc="стулья";pins="стульями";pprep="стульях"} ;
  cheese_N = mkN "сыр" ;
  child_N = (mkNAltPl (mkN "ребёнок" masculine animate "3*a") (mkN "деть")) ** {pins="детьми"};
  church_N = mkN "церковь" feminine animate "8*e" ;
  city_N = mkN "город" ;
  clean_A = mkA "чистый" "чище";
  clever_A = mkA "умный" "" "1*a/b";
  cloud_N = mkN "облако" neuter inanimate "3c(2)" ;
  coat_N = mkN "пальто" masculine inanimate "0";
  cold_A = mkA "холодный";
  computer_N = mkN "компьютер" ;
  correct_A = mkA "правильный" "" "1*a";
  country_N = mkN "страна" ;
  cousin_N = mkN "кузен" masculine animate ;  -- also: mkN "кузина" feminine animate ;
  cow_N = mkN "корова" feminine animate ;
  day_N = mkN "день" masculine inanimate "2*b" ;
  dirty_A = mkA "грязный" ;
  distance_N3 = mkN3 (mkN "расстояние") from_Prep on_to_Prep ;
  do_V2 = mkV2 (mkV "делать");
  teach_V2 = mkV2 (mkV "учить");
  become_VA = mkV "становиться" ;
  paint_V2A = dirV2 (mkV "рисовать") ;
  ask_V2Q = dirV2 (mkV "спросить") ;
  answer_V2S = dirV2 (mkV "отвечать" );
  play_V2 = mkV2 (mkV "играть" ) with_Prep;
  doctor_N = mkN "доктор" masculine animate ;
  dog_N = mkN "собака" feminine animate ;
  door_N = mkN "дверь" ;
  dry_A = mkA "сухой" "" "3b/c'";
  dull_A = mkA "скучный" ;
  dust_N = mkN "пыль" ;
  ear_N = mkN "ухо" ;
  earth_N = mkN "земля" feminine inanimate "2*d" ;
  egg_N = (mkNplus (mkN "яйцо" neuter inanimate "5*d")) ** {pgen="яиц"} ;
  empty_A = mkA "пустой" ;
  enemy_N = mkN "враг" masculine animate ;
  eye_N = mkN "глаз" masculine inanimate "1c(1)(2)" ;
  factory_N = mkN "фабрика" ;
  fall_V = mkV "падать" ;
  far_Adv = mkAdv "далеко";
  fat_N = mkN "жир" ;
  father_N2 = mkN2 (mkN "отец" masculine inanimate "5*b");
  feather_N = (mkNplus (mkN "перо" neuter inanimate "1d")) ** {pnom="перья";pgen="перьев";pdat="перьям";pacc="перья";pins="перьями";pprep="перьях"};
  fingernail_N = mkN "ноготь" masculine inanimate "2*e" ;
  fire_N = mkN "огонь" masculine inanimate "2*b" ;
  fish_N = mkN "рыба" feminine animate ;
  floor_N = mkN "пол" ;
  flower_N = mkN "цветок";
  fog_N = mkN "туман" ;
  foot_N = mkN "ступня" feminine inanimate "2*b" ;
  forest_N = (mkNplus (mkN "лес" masculine inanimate "1c(1)")) ** {sloc="лесу"} ;
  fridge_N = mkN "холодильник" ;
  friend_N = (mkNplus (mkN "друг" masculine inanimate "3c")) ** {pnom="друзья";pgen="друзей";pdat="друзьям";pacc="друзей";pins="друзьями";pprep="друзьях"};
  fruit_N = mkN "фрукт" ;
  full_A = (mkAplus (mkA "полный" "" "1*a/c'")) ** {sm="полон"} ;
  fun_AV = (mkAltShort (mkA "весёлый" "" "1a/c'") (mkA "веселый")) ;
  garden_N = mkN "сад" ;
  girl_N = mkN "девочка" feminine animate "3*a";
  give_V3 = tvDirDir (mkV "давать") ;
  glove_N = mkN "перчатка" feminine inanimate "3*a";
  gold_N = mkN "золото" ;
  good_A = mkA "хороший" "лучше" ;
  grammar_N = mkN "грамматика";
  grass_N = mkN "трава";
  green_A = (mkAltShort (mkA "зелёный" "зеленее") (mkA "зеленый")) ;  -- workaround TODO: Any way to remove yo from stem?
  guts_N = mkN "внутренность" ;
  hair_N = mkN "волос" masculine inanimate "1e(2)" ;
  hand_N = mkN "рука" feminine inanimate "3f'" ;
  harbour_N = (mkNplus (mkN "порт")) ** {sloc="порту"} ;
  hat_N = mkN "шляпа" ;
  head_N = mkN "голова" feminine inanimate "1f'";
  heart_N = mkN "сердце" neuter inanimate "5*c" ;
  heavy_A = (mkAltShort (mkA "тяжёлый" "тяжелее") (mkA "тяжелый")) ** {sm="тяжёл"} ;   -- TODO: same
  hill_N = mkN "холм" ;
  horn_N = mkN "рог" masculine inanimate "3c(1)" ;
  horse_N = mkN "лошадь" feminine animate "8e" ;
  hot_A = mkA "горячий" "" "4a/b";
  house_N = mkN "дом" masculine inanimate "1c(1)" ;
  husband_N = (mkNplus (mkN "муж" masculine animate "4c")) ** {pnom="мужья";pgen="мужей";pdat="мужьям";pacc="мужей";pins="мужьями";pprep="мужьях"};
  ice_N = (mkNplus (mkN "лёд"  masculine animate "1b")) ** {sloc="льду";sptv="льду"} ;
  important_A = mkA "важный" ;
  industry_N = mkN "промышленность" ;
  iron_N = mkN "железо" ;
  john_PN = mkPN "Иван" masculine animate ;
  king_N = mkN "король" masculine animate "2b";
  knee_N = (mkNplus (mkN "колено" neuter inanimate "1a")) ** {pnom="колени";pgen="коленей";pdat="коленям";pacc="колени";pins="коленями";pprep="коленях"} ;
  lake_N = (mkNplus (mkN "озеро" neuter inanimate "1a"))  ** {pnom="озёра";pgen="озёр";pdat="озёрам";pacc="озёра";pins="озёрами";pprep="озёрах"} ;
  lamp_N = mkN "лампа" ;
  language_N = mkN "язык" ;
  leaf_N = (mkNplus (mkN "лист" masculine inanimate "1d")) ** {pnom="листья";pgen="листьев";pdat="листьям";pacc="листья";pins="листьями";pprep="листьях"} ;
  leather_N = mkN "кожа" ;
  left_Ord = mkOrd "левый";
  leg_N = mkN "нога" ;
  liver_N = mkN "печень" ;
  long_A = mkA "длинный" "" "1*a/c'";
  louse_N = (mkNplus (mkN "вошь" feminine animate "8*b'")) ** {pdat="вшам";pins="вшами";pprep="вшах"} ;
  love_N = mkN "любовь" feminine inanimate "8*b'" ;
  man_N = (mkNAltPl (mkN "человек" masculine animate "3a") (mkN "людь" masculine animate)) ** {pins="людьми"};
  married_A2 = mkA2 (mkA "замужем" "" "0") behind_Prep ;  -- for Fem only
  meat_N = mkN "мясо" neuter inanimate "1c" ;
  milk_N = mkN "молоко" neuter inanimate "3d(1)" ;
  moon_N = mkN "луна" ;
  mother_N2 = (mkN2plus (mkN2 "матерь" feminine animate "8e" nullPrep)) ** {snom="мать";sacc="мать";svoc="мать";} ;
  mountain_N = mkN "гора" ;
  mouth_N = (mkNplus (mkN "рот" masculine inanimate "1*b")) ** {sloc="рту"} ;
  music_N = mkN "музыка" ;
  name_N = mkN "имя" neuter inanimate "8°c";
  narrow_A = mkA "узкий" "уже" "3*a/c'";
  near_A = mkA "близкий" "ближе";
  neck_N = mkN "шея" feminine inanimate "6a";
  new_A = mkA "новый" ;
  newspaper_N = mkN "газета" ;
  night_N = (mkNplus (mkN "ночь" feminine inanimate "8e")) ** {sloc="ночь"};
  nose_N = mkN "нос" ;
  now_Adv = mkAdv "сейчас" ;
  number_N = mkN "число" neuter inanimate "1*d" ;
  oil_N = mkN "нефть" ;
  old_A = mkA "старый" "старше" "1a/c''";  -- Grammatically correct variant "старее" is being used less
  paper_N = mkN "бумага" ;
  paris_PN = mkPN "Париж" masculine inanimate ;
  peace_N = mkN "мир" ;
  pen_N = mkN "ручка" ;
  person_N = mkN "лицо" neuter animate "5d" ;
  planet_N = mkN "планета" ;
  plastic_N = mkN "пластмасса" ;
  policeman_N = mkN "милиционер" ;
  priest_N = mkN "священник" masculine animate ;
  queen_N = mkN "королева" feminine animate ;
  question_N = mkN "вопрос" ;
  rain_N = mkN "дождь" ;
  reason_N = mkN "причина";
  ready_A = mkA "готовый" ;
  red_A = mkA "красный" ;
  religion_N = mkN "религия" ;
  restaurant_N = mkN "ресторан" ;
  right_Ord = mkOrd "правый";
  river_N = mkN "рекa" feminine inanimate "3d'" ;
  road_N = mkN "дорогa" feminine inanimate "3a" ;
  rock_N = mkN "камень" masculine inanimate "2*e" ;
  roof_N = mkN "крыша" feminine inanimate "4a" ;
  root_N = mkN "корень" masculine inanimate "2*e" ;
  rope_N = mkN "верёвка" ;
  rotten_A = mkA "гнилой" "" "1b/c";
  round_A = mkA "круглый" "" "1a/c'";
  rubber_N = mkN "резина" ;
  rule_N = mkN "правило" ;
  salt_N = mkN "соль" ;
  sand_N = (mkNplus (mkN "песок"  masculine inanimate "3*b")) ** {sptv="песку"} ;
  school_N = mkN "школа" ;
  science_N = mkN "наука" ;
  sea_N = mkN "море" neuter inanimate "2c" ;
  seed_N = mkN "семя" neuter inanimate "8°c" ;
  sell_V3 = tvDirDir (mkV "продавать" );
  send_V3 = tvDirDir (mkV "посылать" );
  sharp_A = mkA "острый";
  sheep_N = mkN "овца" feminine animate "5*d" ;
  ship_N = mkN "корабль" masculine inanimate "2b";
  shirt_N = mkN "рубашка" ;
  shoe_N = mkN "туфля" feminine inanimate "2*a" ;
  shop_N = mkN "магазин" ;
  short_A = mkA "короткий" "короче" "3*a/c'";
  silver_N = mkN "серебро" ;
  sister_N = mkN "сестра" feminine animate ;
  skin_N = mkN "кожа" ;
  sky_N = (mkNAltPl (mkN "небо" neuter inanimate "1c") (mkN "небесо" neuter inanimate "1b"));
  small_A = (mkAltShort (mkA "маленький" "меньше") (mkA "малый")) ;
  smoke_N = mkN "дым" ;
  smooth_A = mkA "гладкий" "глаже" "3*a/c";
  snake_N = mkN "змея" feminine animate "6d";
  snow_N = (mkNplus (mkN "снег" masculine inanimate "3c①")) ** {sloc="снегу"; sptv="снегу"} ;
  sock_N = mkN "носок" masculine inanimate "3*b";
  song_N = mkN "песня" feminine inanimate "2*a";
  star_N = mkN "звезда" ;
  steel_N = mkN "сталь" ;
  stick_N = mkN "палка" ;
  stone_N = mkN "камень" masculine inanimate "2*e";
  stove_N = (mkNplus (mkN "печь" feminine inanimate "8e")) ** {sloc="печь"} ;
  straight_A = mkA "прямой" "" "1b/c'";
  student_N = mkN "студент" masculine animate ;
  stupid_A = mkA "тупой" ;
  sun_N = mkN "солнце" neuter inanimate "5a";
  table_N = mkN "стол" ;
  tail_N = mkN "хвост" ;
  talk_V3 = mkV3 (mkV "говорить") with_Prep about_Prep ;
  teacher_N = mkN "учитель" masculine animate "2c(1)";
  television_N = mkN "телевидение" ; -- FIXME: televizor?
  thick_A = mkA "толстый" "толще" "1a/c'";
  thin_A = mkA "тонкий" "тоньше" "3*a/c'";
  today_Adv = mkAdv "сегодня" ;
  tongue_N = mkN "язык" ;
  tooth_N = mkN "зуб" ;
  train_N = mkN "поезд" ;
  tree_N = (mkNplus (mkN "дерево" neuter inanimate "1a")) ** {pnom="деревья";pgen="деревьев";pdat="деревьям";pacc="деревья";pins="деревьями";pprep="деревьях"} ;
  ugly_A = mkA "некрасивый" ;
  uncertain_A = mkA "неопределённый" ;
  university_N = mkN "университет" ;
  village_N = (mkNplus (mkN "деревня" feminine inanimate "2*e")) ** {pgen="деревень"} ;
  war_N = mkN "война" ;
  warm_A = (mkAltShort (mkA "тёплый" "теплее" "1*a/b") (mkA "теплый" "" "1*a/b")) ** {sm="тёплый"} ;  -- workaround TODO: Any way to remove yo from stem?
  water_N = mkN "вода" feminine inanimate "1d'";
  wet_A = mkA "мокрый" "" "1a/c'";
  white_A = mkA "белый" "" "1a/c''";
  wide_A = mkA "широкий" "шире" "3a/c''";
  wife_N = mkN "жена" feminine animate ;
  wind_N = mkN "ветер" masculine inanimate "1*e" ;
  window_N = mkN "окно" neuter inanimate "1*d";
  wine_N = mkN "вино" neuter inanimate "1*d" ;
  wing_N = (mkNplus (mkN "крыло" neuter inanimate "1d")) ** {pnom="крылья";pgen="крыльев";pdat="крыльям";pacc="крылья";pins="крыльями";pprep="крыльях"};
  woman_N = mkN "женщина" feminine animate ;
  wood_N = mkN "древесина" feminine inanimate "1a" ;
  worm_N = mkN "червь" masculine animate ;
  year_N = (mkNplus (mkN "год")) ** {sloc="году"; pgen="лет"};
  yellow_A = (mkAplus (mkA "жёлтый" "желтее" "1a/c''") ** {sf="желта"}) ;  -- TODO: variants
  young_A = mkA "молодой" "моложе" "1b/c";

  fear_VS = mkV "бояться" ;
  hope_VS= mkV "надеяться" ;
  know_VS= mkV "знать" ;
  say_VS = mkV "говорить" ;

}