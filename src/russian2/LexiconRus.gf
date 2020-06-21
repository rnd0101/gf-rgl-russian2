--# -path=.:abstract:common
concrete LexiconRus of Lexicon = CatRus **
  open ParadigmsRus, Prelude, MorphoRus in {
flags optimize=values ; coding=utf8 ;
lin
  airplane_N = mkN "самолёт" ;
--  animal_N = mkN "животное" animate;
  apartment_N = mkN "квартира" ;
  apple_N = mkN "яблоко" ;
  art_N = mkN "искусство" ;
  ashes_N = mkN "пепел" masculine inanimate (Z 1 Ast A) ;
  baby_N = mkN "малыш" masculine animate (Z 4 No B) ;
  back_N = mkN "спина" ;
  bank_N = mkN "банк" ;
  bark_N = mkN "кора";
  belly_N = mkN "живот" ;
  bike_N = mkN "велосипед" ;
  bird_N = mkN "птица" feminine animate ;
  blood_N = mkN "кровь" ;
  boat_N = mkN "лодка" ;
  bone_N = mkN "кость" ;
  book_N = mkN "книга" ;
  boot_N = mkN "сапог" ;
  boss_N = mkN "начальник" masculine animate ;
  boy_N = mkN "мальчик" masculine animate ;
  bread_N = mkN "хлеб" ;
  breast_N = mkN "грудь" ;
  butter_N = mkN "масло";
  camera_N = mkN "фотоаппарат" ;
  cap_N = mkN "чашка" ; -- vowel change
  car_N = mkN "машина" ;
  carpet_N = mkN "ковёр"; -- vowel change
  cat_N = mkN "кошка" feminine animate (Z 3 Ast A) ; -- vowel change
  ceiling_N = mkN "потолок" ; -- vowel change
  chair_N = mkN "стул" ; -- irregular
  cheese_N = mkN "сыр" ;
  child_N = (mkNAltPl (mkN "ребёнок" masculine animate (Z 3 Ast A)) (mkN "деть")) ** {pins="детьми"};
  church_N = mkN "церковь" feminine animate (Z 8 Ast E) ;  -- stem->word
  city_N = mkN "город" ;
  cloud_N = mkN "облако" ; -- irregular
  coat_N = mkN "пальто" masculine inanimate Z0;
  computer_N = mkN "компьютер" ;
  country_N = mkN "страна" ;
  cousin_N = mkN "кузен" masculine animate ;  -- also: mkN "кузина" feminine animate ;
  cow_N = mkN "корова";
  day_N = mkN "день" masculine inanimate (Z 2 Ast B) ;
--  distance_N3 = mkN3 (mkN "расстояние") from_Prep to_Prep ;
  doctor_N = mkN "доктор" ;
  dog_N = mkN "собака" ;
  door_N = mkN "дверь" ;
  dust_N = mkN "пыль" ;
  ear_N = mkN "ухо" ;
  earth_N = mkN "земля" ;
  egg_N = mkN "яйцо" ;
  enemy_N = mkN "враг" ;
  eye_N = mkN "глаз" Masc Inanimate (ZC 1 No C ZC12) ;
  factory_N = mkN "фабрика" ;
  fat_N = mkN "жир" ;
--  father_N2 = mkN2 (mkN "отец" "отца" "отцу" "отца" "отцом" "отце" "отце" "отцы" "отцов" "отцам" "отцов" "отцами" "отцах" masculine animate);
  feather_N = (mkNplus (mkN "перо" neuter inanimate (Z 1 No D))) ** {pnom="перья";pgen="перьев";pdat="перьям";pacc="перья";pins="перьями";pprep="перьях"};
  fingernail_N = mkN "ноготь" masculine inanimate (Z 2 Ast E) ;
  fire_N = mkN "огонь"  masculine inanimate (Z 2 Ast B) ;
  fish_N = mkN "рыба";
  floor_N = mkN "пол" ;
  flower_N = mkN "цветок";
  fog_N = mkN "туман" ;
  foot_N = mkN "ступня" ;
  forest_N = (mkNplus (mkN "лес" masculine inanimate (ZC 1 No C ZC1))) ** {sloc="лесу"} ;
  fridge_N = mkN "холодильник" ;
  friend_N = (mkNplus (mkN "друг" masculine inanimate (Z 3 No C))) ** {pnom="друзья";pgen="друзей";pdat="друзьям";pacc="друзей";pins="друзьями";pprep="друзьях"};
  fruit_N = mkN "фрукт" ;
  garden_N = mkN "сад" ;
  girl_N = mkN "девочка"; -- vowel change
  glove_N = mkN "перчатка" ; -- vowel change
  gold_N = mkN "золото" ;
  grammar_N = mkN "грамматика";
  grass_N = mkN "трава";
  guts_N = mkN "внутренность" ;
  hair_N = mkN "волос" ;
  hand_N = mkN "рука" ;
  harbour_N = mkN "порт" ; -- prepos -u
  hat_N = mkN "шляпа" ;
  head_N = mkN "голова" ;
  heart_N = mkN "сердце" neuter inanimate (Z 5 Ast C) ;
  hill_N = mkN "холм" ;
  horn_N = mkN "рог" ;
  horse_N = mkN "лошадь" ;
  house_N = mkN "дом" ;
  husband_N = (mkNplus (mkN "муж" masculine animate (Z 3 No C))) ** {pnom="мужья";pgen="мужей";pdat="мужьям";pacc="мужей";pins="мужьями";pprep="мужьях"};
  ice_N = (mkNplus (mkN "лёд"  masculine animate (Z 1 Ast B))) ** {sloc="льду";sptv="льду"} ;
  industry_N = mkN "промышленность" ;
  iron_N = mkN "железо" ;
--  john_PN = mkPN "Иван" Masc Sg Animate ;
  king_N = mkN "король" masculine animate (Z 2 No B);
  knee_N = mkN "колено" ;
  lake_N = (mkNplus (mkN "озеро" neuter inanimate (Z 1 No A)))  ** {pnom="озёра";pgen="озёр";pdat="озёрам";pacc="озёра";pins="озёрами";pprep="озёрах"} ;
  lamp_N = mkN "лампа" ;
  language_N = mkN "язык" ;
  leaf_N = mkN "лист" ; -- irregular pl
  leather_N = mkN "кожа" ;
  leg_N = mkN "нога" ;
  liver_N = mkN "печень" ;
  louse_N = (mkNplus (mkN "вошь" feminine animate (Z 8 Ast B'))) ** {pdat="вшам";pins="вшами";pprep="вшах"} ;
  love_N = mkN "любовь" feminine inanimate (Z 8 Ast B') ;
  man_N = (mkNAltPl (mkN "человек" masculine animate (Z 3 No A)) (mkN "людь" masculine animate)) ** {pins="людьми"};
  meat_N = mkN "мясо" ;
  milk_N = mkN "молоко" ;
  moon_N = mkN "луна" ;
--  mother_N2 = mkN2 (mkN "мать" "матери" "матери" "мать" "матерью" "матери" "матери" "матери" "матерей" "матерям" "матерей" "матерями" "матерях" feminine animate) ;
  mountain_N = mkN "гора" ;
  mouth_N = (mkNplus (mkN "рот"  masculine inanimate (Z 1 Ast B))) ** {sloc="рту"} ;
  music_N = mkN "музыка" ;
  name_N = mkN "имя" ;
  neck_N = mkN "шея" ;
  newspaper_N = mkN "газета" ;
  night_N = mkN "ночь" ;
  nose_N = mkN "нос" ;
  number_N = mkN "число" ; -- gen pl "чисел"
  oil_N = mkN "нефть" ;
  paper_N = mkN "бумага" ;
--  paris_PN = mkPN "Париж" Masc Sg Inanimate ;
  peace_N = mkN "мир" ;
  pen_N = mkN "ручка" ;
  person_N = mkN "лицо" neuter animate (Z 5 No D) ;
  planet_N = mkN "планета" ;
  plastic_N = mkN "пластмасса" ;
  policeman_N = mkN "милиционер" ;
  priest_N = mkN "священник" ;
  queen_N = mkN "королева" ;
  question_N = mkN "вопрос" ;
  rain_N = mkN "дождь" ;
  reason_N = mkN "причина";
  religion_N = mkN "религия" ;
  restaurant_N = mkN "ресторан" ;
  river_N = mkN "рекa" ;
  road_N = mkN "дорогa" ;
  rock_N = mkN "камень" ;
  roof_N = mkN "крыша" ;
  root_N = mkN "корень" ;
  rope_N = mkN "верёвка" ;
  rubber_N = mkN "резина" ;
  rule_N = mkN "правило" ;
  salt_N = mkN "соль" ;
  sand_N = (mkNplus (mkN "песок"  masculine inanimate (Z 3 Ast B))) ** {sptv="песку"} ;
  school_N = mkN "школа" ;
  science_N = mkN "наука" ;
  sea_N = mkN "море" ;
  seed_N = mkN "семя";
  sheep_N = mkN "овца" ;
  ship_N = mkN "корабль" ;
  shirt_N = mkN "рубашка" ;
--  shoe_N = mkN "туфля" "туфли" "туфле" "туфлю" "туфлей" "туфле" "туфле" "туфли" "туфель" "туфлям" "туфли" "туфлями" "туфлях"  masculine inanimate ;
  shop_N = mkN "магазин" ;
  silver_N = mkN "серебро" ;
  sister_N = mkN "сестра" ;
  skin_N = mkN "кожа" ;
  sky_N = (mkNAltPl (mkN "небо" neuter inanimate (Z 1 No C)) (mkN "небесо" neuter inanimate (Z 1 No B)));
  smoke_N = mkN "дым" ;
  snake_N = mkN "змея" ;
  snow_N = mkN "снег" ;
  sock_N = mkN "носок" ;
  song_N = mkN "песня" ;
  star_N = mkN "звезда" ;
  steel_N = mkN "сталь" ;
  stick_N = mkN "палка" ;
  stone_N = mkN "камень" ;
  stove_N = mkN "печь" ;
  student_N = mkN "студент" ;
  sun_N = mkN "солнце" neuter inanimate ;
--  sun_N = mkN "солнце" "солнца" "солнцу" "солнце" "солнцем" "солнце" "солнце" "солнца" "солнц" "солнцам" "солнца" "солнцами" "солнцах"  neuter inanimate ;
  table_N = mkN "стол" ;
  tail_N = mkN "хвост" ;
  teacher_N = mkN "учитель" ;
  television_N = mkN "телевидение" ; -- FIXME: televizor?
  tongue_N = mkN "язык" ;
  tooth_N = mkN "зуб" ;
  train_N = mkN "поезд" ;
  tree_N = mkN "дерево" ; -- irregular
  university_N = mkN "университет" ;
  village_N = mkN "деревня" ;
  war_N = mkN "война" ;
  water_N = mkN "вода" ;
  wife_N = mkN "жена" ;
  wind_N = mkN "ветер" masculine inanimate (Z 1 Ast E) ;
  window_N = mkN "окно" neuter inanimate  (Z 1 Ast D);
  wine_N = mkN "вино" ;
  wing_N = (mkNplus (mkN "крыло" neuter inanimate (Z 1 No D))) ** {pnom="крылья";pgen="крыльев";pdat="крыльям";pacc="крылья";pins="крыльями";pprep="крыльях"};
  woman_N = mkN "женщина" ;
  wood_N = mkN "дерево" ;
  worm_N = mkN "черв" ;
--  year_N = mkNAltPl "год" "лето" masculine inanimate ;
}