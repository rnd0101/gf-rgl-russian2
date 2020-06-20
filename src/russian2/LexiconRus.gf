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
  boss_N = mkN "начальник" ;
  boy_N = mkN "мальчик" ;
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
--  child_N = mkNAltPl "ребёнок" "деть" masculine animate;
--  child_N = mkN "ребёнок" "ребёнка" "ребёнку" "ребёнка" "ребёнком" "ребёнке" "ребёнке" "дети" "детей" "детям" "детей" "детьми" "детях"  masculine animate ;
--  church_N = mkN "церковь" "церкви" "церкви" "церковь" "церковью" "церкви" "церкви" "церкви" "церквей" "церквям" "церкви" "церквями" "церквях"  masculine inanimate ;
  city_N = mkN "город" ;
  cloud_N = mkN "облако" ; -- irregular
--  coat_N = mkIndeclinableNoun "пальто" masculine inanimate ;
  computer_N = mkN "компьютер" ;
  country_N = mkN "страна" ;
  cousin_N = mkN "кузен" ; -- FIXME: is this really correct? can't find it in the dictionary
  cow_N = mkN "корова";
--  day_N = mkN "день" "дня" "дню" "день" "днём" "дне" "дне" "дни" "дней" "дням" "дни" "днями" "днях" masculine inanimate ;
--  distance_N3 = mkN3 (mkN "расстояние") from_Prep to_Prep ;
  doctor_N = mkN "доктор" ;
  dog_N = mkN "собака" ;
  door_N = mkN "дверь" ;
  dust_N = mkN "пыль" ;
  ear_N = mkN "ухо" ;
  earth_N = mkN "земля" ;
  egg_N = mkN "яйцо" ;
  enemy_N = mkN "враг" ;
  eye_N = mkN "глаз" ; -- FIXME: Pl -a
  factory_N = mkN "фабрика" ;
  fat_N = mkN "жир" ;
--  father_N2 = mkN2 (mkN "отец" "отца" "отцу" "отца" "отцом" "отце" "отце" "отцы" "отцов" "отцам" "отцов" "отцами" "отцах" masculine animate);
--  feather_N = mkN "перо" "пера" "перу" "пера" "пером" "пере" "пере" "перья" "перьев" "перьям" "перьев" "перьями" "перьях" neuter inanimate ;
--  fingernail_N = mkN "ноготь" "ногтя" "ногтю" "ногтя" "ногтем" "ногте" "ногте" "ногти" "ногтей" "ногтям" "ногтей" "ногтями" "ногтях"  masculine inanimate ;
--  fire_N = mkN "огонь" "огня" "огню" "огня" "огнём" "огне" "огне" "огни" "огней" "огням" "огней" "огнями" "огнях" masculine inanimate ;
  fish_N = mkN "рыба";
  floor_N = mkN "пол" ;
  flower_N = mkN "цветок";
  fog_N = mkN "туман" ;
  foot_N = mkN "ступня" ;
  forest_N = mkN "лес" ; -- prepos -u
  fridge_N = mkN "холодильник" ;
--  friend_N = mkN "друг" "друга" "другу" "друга" "другом" "друге" "друге" "друзья" "друзей" "друзьям" "друзей" "дузьями" "друзьях" masculine animate ;
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
--  heart_N = mkN "сердце" "сердца" "сердцу" "сердца" "сердцем" "сердце" "сердце" "сердца" "сердец" "сердцам" "сердец" "сердцами" "сердцах"  neuter inanimate ;
  hill_N = mkN "холм" ;
  horn_N = mkN "рог" ;
  horse_N = mkN "лошадь" ;
  house_N = mkN "дом" ;
--  husband_N = mkN "муж" "мужа" "мужу" "мужа" "мужем" "муже" "муже" "мужья" "мужей" "мужьям" "мужей" "мужьями" "мужьях" masculine animate ;
--  ice_N = mkN "лёд" "льда" "льду" "льда" "льдом" "льде" "льде" "льды" "льдов" "льдам" "льдов" "льдами" "льдах" masculine inanimate ;
  industry_N = mkN "промышленность" ;
  iron_N = mkN "железо" ;
--  john_PN = mkPN "Иван" Masc Sg Animate ;
--  king_N = mkN "король" "короля" "королю" "короля" "королем" "короле" "короле" "короли" "королей" "королям" "королей" "королями" "королях"  masculine animate ;
  knee_N = mkN "колено" ;
  lake_N = mkN "озеро" ; -- gen pl "озёр"
  lamp_N = mkN "лампа" ;
  language_N = mkN "язык" ;
  leaf_N = mkN "лист" ; -- irregular pl
  leather_N = mkN "кожа" ;
  leg_N = mkN "нога" ;
  liver_N = mkN "печень" ;
--  louse_N = mkN "вошь" "вши" "вши" "вошь" "вошью" "вше" "вше" "вши" "вшей" "вшам" "вшей" "вшами" "вшах" feminine animate ;
  love_N = mkN "любовь" ; -- vowel change
--  man_N = mkNAltPl "человек" "людь" masculine animate ; -- null gen pl
  meat_N = mkN "мясо" ;
  milk_N = mkN "молоко" ;
  moon_N = mkN "луна" ;
--  mother_N2 = mkN2 (mkN "мать" "матери" "матери" "мать" "матерью" "матери" "матери" "матери" "матерей" "матерям" "матерей" "матерями" "матерях" feminine animate) ;
  mountain_N = mkN "гора" ;
--  mouth_N = mkN "рот" "рта" "рту" "рот" "ртом" "рте" "рте" "рты" "ртов" "ртам" "рты" "ртами" "ртах" masculine inanimate ;
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
--  person_N = mkN "лицo" animate ; -- irregular
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
--  sand_N = mkN "песок" "песка" "песку" "песок" "песком" "песке" "песке" "пески" "песков" "пескам" "песков" "песками" "песках"  masculine inanimate ;
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
--  sky_N = mkN "небо" "неба" "небу" "небо" "небом" "небе" "небе" "небеса" "небес" "небесам" "небес" "небесами" "небесах" neuter inanimate ;
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
  wind_N = mkN "ветер" Masc Inanimate (Z 1 Ast E) ;
  window_N = mkN "окно" ; -- "окон"
  wine_N = mkN "вино" ;
  wing_N = mkN "крыл" Neut Inanimate (Z 1 No D) ; -- pl крылья крыльев etc TODO!
  woman_N = mkN "женщина" ;
  wood_N = mkN "дерево" ;
  worm_N = mkN "черв" ;
--  year_N = mkNAltPl "год" "лето" masculine inanimate ;
}