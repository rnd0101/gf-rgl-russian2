concrete DictRus of DictRusAbs = CatRus ** open ParadigmsRus, Prelude,
  ZaliznyakAlgo,
  ResRus in {
  flags optimize=values ; coding=utf8 ;
-- About 1000 most frequent nouns (source: wiktionary)
oper
  v1a = parseVerbIndex "1a";
  n1a = parseIndex "1a";
  n2a = parseIndex "2a";
  n3a = parseIndex "3a";
  n7a = parseIndex "7a";
  n8a = parseIndex "8a";
lin
  administracija_N = mkN "администрация" Fem Inanimate n7a ;
  adres_N = mkN "адрес" Masc Inanimate (ZN 1 No C ZC1) ;
  akademija_N = mkN "академия" Fem Inanimate n7a ;
  akcija_N = mkN "акция" Fem Inanimate n7a ;
  akt_N = mkN "акт" Masc Inanimate n1a ;
  aktivnostq_N = mkN "активность" Fem Inanimate n8a ;
  amerikanec_N = mkN "американец" Masc Animate (ZN 5 Ast A NoC) ;
  analiz_N = mkN "анализ" Masc Inanimate n1a ;
  apparat_N = mkN "аппарат" Masc Inanimate n1a ;
  aprelq_N = mkN "апрель" Masc Inanimate n2a ;
  armija_N = mkN "армия" Fem Inanimate n7a ;
  artist_N = mkN "артист" Masc Animate n1a ;
  atmosfera_N = mkN "атмосфера" Fem Inanimate n1a ;
  avgust_N = mkN "август" Masc Inanimate n1a ;
  avtobus_N = mkN "автобус" Masc Inanimate n1a ;
  avtomat_N = mkN "автомат" Masc Inanimate n1a ;
  avtomobilq_N = mkN "автомобиль" Masc Inanimate n2a ;
  avtor_N = mkN "автор" Masc Animate n1a ;
  baba_N = mkN "баба" Fem Animate n1a ;
  babushka_N = mkN "бабушка" Fem Animate (ZN 3 Ast A NoC) ;
  bank_N = mkN "банк" Masc Inanimate n3a ;
  baza_N = mkN "база" Fem Inanimate n1a ;
  beda_N = mkN "беда" Fem Inanimate (ZN 1 No D NoC) ;
  bereg_N = mkN "берег" Masc Inanimate (ZN 3 No C ZC1) ;
  beseda_N = mkN "беседа" Fem Inanimate n1a ;
  bezopasnostq_N = mkN "безопасность" Fem Inanimate n8a ;
  biblioteka_N = mkN "библиотека" Fem Inanimate n3a ;
  bilet_N = mkN "билет" Masc Inanimate n1a ;
  biznes_N = mkN "бизнес" Masc Inanimate n1a ;
  bjudzhet_N = mkN "бюджет" Masc Inanimate n1a ;
  blok_N = mkN "блок" Masc Inanimate n3a ;
  bog_N = mkN "бог" Masc Animate (ZN 3 No E NoC) ;
  boj_N = mkN "бой" Masc Inanimate (ZN 6 No C NoC) ;
  bok_N = mkN "бок" Masc Inanimate (ZN 3 No C ZC1) ;
  boleznq_N = mkN "болезнь" Fem Inanimate n8a ;
  bolq_N = mkN "боль" Fem Inanimate n8a ;
  bolqnica_N = mkN "больница" Fem Inanimate (ZN 5 No A NoC) ;
  bolqshinstvo_N = mkN "большинство" Neut Inanimate (ZN 1 No B NoC) ;
  borqba_N = mkN "борьба" Fem Inanimate (ZN 1 No B NoC) ;
  brak_N = mkN "брак" Masc Inanimate n3a ;
  brat_N = mkN "брат" Masc Animate n1a ;
  bukva_N = mkN "буква" Fem Inanimate n1a ;
  bumaga_N = mkN "бумага" Fem Inanimate n3a ;
  butylka_N = mkN "бутылка" Fem Inanimate (ZN 3 Ast A NoC) ;
  carq_N = mkN "царь" Masc Animate (ZN 2 No B NoC) ;
  celq_N = mkN "цель" Fem Inanimate n8a ;
  cena_N = mkN "цена" Fem Inanimate (ZN 1 No D' NoC) ;
  cennostq_N = mkN "ценность" Fem Inanimate n8a ;
  centr_N = mkN "центр" Masc Inanimate n1a ;
  cerkovq_N = mkN "церковь" Fem Inanimate (ZN 8 Ast E NoC) ;
  chaj_N = mkN "чай" Masc Inanimate (ZN 6 No C NoC) ;
  chas_N = mkN "час" Masc Inanimate (ZN 1 No C NoC) ;
  chastnostq_N = mkN "частность" Fem Inanimate n8a ;
  chastq_N = mkN "часть" Fem Inanimate (ZN 8 No E NoC) ;
  chasy_N = mkN "часы" Masc Inanimate (ZN 1 No B NoC) ;
  chelovechestvo_N = mkN "человечество" Neut Inanimate n1a ;
  chempionat_N = mkN "чемпионат" Masc Inanimate n1a ;
  cherta_N = mkN "черта" Fem Inanimate (ZN 1 No B NoC) ;
  chestq_N = mkN "честь" Fem Inanimate n8a ;
  chinovnik_N = mkN "чиновник" Masc Animate n3a ;
  chislo_N = mkN "число" Neut Inanimate (ZN 1 Ast D NoC) ;
  chitatelq_N = mkN "читатель" Masc Animate n2a ;
  chlen_N = mkN "член" Masc Inanimate n1a ;
  chtenie_N = mkN "чтение" Neut Inanimate n7a ;
  chudo_N = mkN "чудо" Neut Inanimate (ZN 1 No C NoC) ;
  chuvstvo_N = mkN "чувство" Neut Inanimate n1a ;
  cifra_N = mkN "цифра" Fem Inanimate n1a ;
  cvet_N = mkN "цвет" Masc Inanimate (ZN 1 No C ZC1) ;
  cvetok_N = mkN "цветок" Masc Inanimate (ZN 3 Ast B NoC) ;
  dacha_N = mkN "дача" Fem Inanimate (ZN 4 No A NoC) ;
  dama_N = mkN "дама" Fem Animate n1a ;
  davlenie_N = mkN "давление" Neut Inanimate n7a ;
  dejatelqnostq_N = mkN "деятельность" Fem Inanimate n8a ;
  dejstvie_N = mkN "действие" Neut Inanimate n7a ;
  dejstvitelqnostq_N = mkN "действительность" Fem Inanimate n8a ;
  dekabrq_N = mkN "декабрь" Masc Inanimate (ZN 2 No B NoC) ;
  delo_N = mkN "дело" Neut Inanimate (ZN 1 No C NoC) ;
  denq_N = mkN "день" Masc Inanimate (ZN 2 Ast B NoC) ;
  denqgi_N = mkN "деньга" Fem Inanimate (ZN 3 Ast E NoC) ;
  deputat_N = mkN "депутат" Masc Animate n1a ;
  derevnja_N = mkN "деревня" Fem Inanimate (ZN 2 Ast E NoC) ;
  derevo_N = mkN "дерево" Neut Inanimate n1a ;
  desjatok_N = mkN "десяток" Masc Inanimate (ZN 3 Ast A NoC) ;
  detalq_N = mkN "деталь" Fem Inanimate n8a ;
  detstvo_N = mkN "детство" Neut Inanimate n1a ;
  devochka_N = mkN "девочка" Fem Animate (ZN 3 Ast A NoC) ;
  devushka_N = mkN "девушка" Fem Animate (ZN 3 Ast A NoC) ;
  direktor_N = mkN "директор" Masc Animate (ZN 1 No C ZC1) ;
  divan_N = mkN "диван" Masc Inanimate n1a ;
  djadja_N = mkN "дядя" Fem Animate (ZN 2 No A ZC2) ;
  dlina_N = mkN "длина" Fem Inanimate (ZN 1 No D NoC) ;
  dno_N = mkN "дно" Neut Inanimate (ZN 1 Ast B NoC) ;
  dobro_N = mkN "добро" Neut Inanimate (ZN 1 No B NoC) ;
  dochka_N = mkN "дочка" Fem Animate (ZN 3 Ast A NoC) ;
  dochq_N = mkN "дочь" Fem Animate (ZN 8 No E NoC) ;
  dogovor_N = mkN "договор" Masc Inanimate n1a ;
  dohod_N = mkN "доход" Masc Inanimate n1a ;
  dokazatelqstvo_N = mkN "доказательство" Neut Inanimate n1a ;
  doklad_N = mkN "доклад" Masc Inanimate n1a ;
  doktor_N = mkN "доктор" Masc Animate (ZN 1 No C ZC1) ;
  dokument_N = mkN "документ" Masc Inanimate n1a ;
  dolg_N = mkN "долг" Masc Inanimate (ZN 3 No C NoC) ;
  dolja_N = mkN "доля" Fem Inanimate (ZN 2 No E NoC) ;
  dollar_N = mkN "доллар" Masc Inanimate n1a ;
  dolzhnostq_N = mkN "должность" Fem Inanimate (ZN 8 No E NoC) ;
  dom_N = mkN "дом" Masc Inanimate (ZN 1 No C ZC1) ;
  doroga_N = mkN "дорога" Fem Inanimate n3a ;
  doska_N = mkN "доска" Fem Inanimate (ZN 3 Ast F' NoC) ;
  dostizhenie_N = mkN "достижение" Neut Inanimate n7a ;
  dostoinstvo_N = mkN "достоинство" Neut Inanimate n1a ;
  dozhdq_N = mkN "дождь" Masc Inanimate (ZN 2 No B NoC) ;
  drug_N = mkN "друг" Masc Animate (ZN 3 No C NoC) ;
  druzhba_N = mkN "дружба" Fem Inanimate n1a ;
  duma_N = mkN "дума" Fem Inanimate n1a ;
  durak_N = mkN "дурак" Masc Animate (ZN 3 No B NoC) ;
  dusha_N = mkN "душа" Fem Inanimate (ZN 4 No D' NoC) ;
  dverq_N = mkN "дверь" Fem Inanimate (ZN 8 No E NoC) ;
  dvigatelq_N = mkN "двигатель" Masc Inanimate n2a ;
  dvizhenie_N = mkN "движение" Neut Inanimate n7a ;
  dvor_N = mkN "двор" Masc Inanimate (ZN 1 No B NoC) ;
  dvorec_N = mkN "дворец" Masc Inanimate (ZN 5 Ast B NoC) ;
  dyhanie_N = mkN "дыхание" Neut Inanimate n7a ;
  dym_N = mkN "дым" Masc Inanimate (ZN 1 No C NoC) ;
  eda_N = mkN "еда" Fem Inanimate (ZN 1 No D NoC) ;
  edinica_N = mkN "единица" Fem Inanimate (ZN 5 No A NoC) ;
  ehffekt_N = mkN "эффект" Masc Inanimate n1a ;
  ehffektivnostq_N = mkN "эффективность" Fem Inanimate n8a ;
  ehkonomika_N = mkN "экономика" Fem Inanimate n3a ;
  ehkran_N = mkN "экран" Masc Inanimate n1a ;
  ehksperiment_N = mkN "эксперимент" Masc Inanimate n1a ;
  ehkspert_N = mkN "эксперт" Masc Animate n1a ;
  ehkspluatacija_N = mkN "эксплуатация" Fem Inanimate n7a ;
  ehlement_N = mkN "элемент" Masc Inanimate n1a ;
  ehnergija_N = mkN "энергия" Fem Inanimate n7a ;
  ehpoha_N = mkN "эпоха" Fem Inanimate n3a ;
  ehtap_N = mkN "этап" Masc Inanimate n1a ;
  ehtazh_N = mkN "этаж" Masc Inanimate (ZN 4 No B NoC) ;
  evrej_N = mkN "еврей" Masc Animate (ZN 6 No A NoC) ;
  fakt_N = mkN "факт" Masc Inanimate n1a ;
  faktor_N = mkN "фактор" Masc Inanimate n1a ;
  familija_N = mkN "фамилия" Fem Inanimate n7a ;
  federacija_N = mkN "федерация" Fem Inanimate n7a ;
  fevralq_N = mkN "февраль" Masc Inanimate (ZN 2 No B NoC) ;
  figura_N = mkN "фигура" Fem Inanimate n1a ;
  filosofija_N = mkN "философия" Fem Inanimate n7a ;
  filqm_N = mkN "фильм" Masc Inanimate n1a ;
  firma_N = mkN "фирма" Fem Inanimate n1a ;
  fon_N = mkN "фон" Masc Inanimate n1a ;
  fond_N = mkN "фонд" Masc Inanimate n1a ;
  forma_N = mkN "форма" Fem Inanimate n1a ;
  formirovanie_N = mkN "формирование" Neut Inanimate n7a ;
  formula_N = mkN "формула" Fem Inanimate n1a ;
  fotografija_N = mkN "фотография" Fem Inanimate n7a ;
  fraza_N = mkN "фраза" Fem Inanimate n1a ;
  front_N = mkN "фронт" Masc Inanimate (ZN 1 No C NoC) ;
  funkcija_N = mkN "функция" Fem Inanimate n7a ;
  gazeta_N = mkN "газета" Fem Inanimate n1a ;
  general_N = mkN "генерал" Masc Animate n1a ;
  geroj_N = mkN "герой" Masc Animate (ZN 6 No A NoC) ;
  glava_N = mkN "глава" Fem Inanimate (ZN 1 No D NoC) ;
  glaz_N = mkN "глаз" Masc Inanimate (ZN 1 No C ZC12) ;
  glubina_N = mkN "глубина" Fem Inanimate (ZN 1 No D NoC) ;
  golos_N = mkN "голос" Masc Inanimate (ZN 1 No C ZC1) ;
  golova_N = mkN "голова" Fem Inanimate (ZN 1 No F' NoC) ;
  gora_N = mkN "гора" Fem Inanimate (ZN 1 No F' NoC) ;
  gorlo_N = mkN "горло" Neut Inanimate n1a ;
  gorod_N = mkN "город" Masc Inanimate (ZN 1 No C ZC1) ;
  gospodin_N = mkN "господин" Masc Animate (ZN 1 Deg C ZC1) ;
  gostinica_N = mkN "гостиница" Fem Inanimate (ZN 5 No A NoC) ;
  gostq_N = mkN "гость" Masc Animate (ZN 2 No E NoC) ;
  gosudarstvo_N = mkN "государство" Neut Inanimate n1a ;
  granica_N = mkN "граница" Fem Inanimate (ZN 5 No A NoC) ;
  grazhdanin_N = mkN "гражданин" Masc Animate (ZN 1 Deg A NoC) ;
  greh_N = mkN "грех" Masc Inanimate (ZN 3 No B NoC) ;
  grudq_N = mkN "грудь" Fem Inanimate (ZN 8 No F'' NoC) ;
  gruppa_N = mkN "группа" Fem Inanimate n1a ;
  guba_N = mkN "губа" Fem Inanimate (ZN 1 No F NoC) ;
  gubernator_N = mkN "губернатор" Masc Animate n1a ;
  harakter_N = mkN "характер" Masc Inanimate n1a ;
  harakteristika_N = mkN "характеристика" Fem Inanimate n3a ;
  hleb_N = mkN "хлеб" Masc Inanimate n1a ;
  hod_N = mkN "ход" Masc Inanimate (ZN 1 No C NoC) ;
  hozjain_N = mkN "хозяин" Masc Animate (ZN 1 Deg A NoC) ;
  hozjajka_N = mkN "хозяйка" Fem Animate (ZN 3 Ast A NoC) ;
  hozjajstvo_N = mkN "хозяйство" Neut Inanimate n1a ;
  hram_N = mkN "храм" Masc Inanimate n1a ;
  hudozhnik_N = mkN "художник" Masc Animate n3a ;
  hvost_N = mkN "хвост" Masc Inanimate (ZN 1 No B NoC) ;
  ideja_N = mkN "идея" Fem Inanimate (ZN 6 No A NoC) ;
  ijulq_N = mkN "июль" Masc Inanimate n2a ;
  ijunq_N = mkN "июнь" Masc Inanimate n2a ;
  imja_N = mkN "имя" Neut Inanimate (ZN 8 Deg C NoC) ;
  imuszestvo_N = mkN "имущество" Neut Inanimate n1a ;
  informacija_N = mkN "информация" Fem Inanimate n7a ;
  iniciativa_N = mkN "инициатива" Fem Inanimate n1a ;
  institut_N = mkN "институт" Masc Inanimate n1a ;
  instrument_N = mkN "инструмент" Masc Inanimate n1a ;
  interes_N = mkN "интерес" Masc Inanimate n1a ;
  inzhener_N = mkN "инженер" Masc Animate n1a ;
  iskljuchenie_N = mkN "исключение" Neut Inanimate n7a ;
  iskusstvo_N = mkN "искусство" Neut Inanimate n1a ;
  ispolnenie_N = mkN "исполнение" Neut Inanimate n7a ;
  ispolqzovanie_N = mkN "использование" Neut Inanimate n7a ;
  ispytanie_N = mkN "испытание" Neut Inanimate n7a ;
  issledovanie_N = mkN "исследование" Neut Inanimate n7a ;
  istochnik_N = mkN "источник" Masc Inanimate n3a ;
  istorija_N = mkN "история" Fem Inanimate n7a ;
  itog_N = mkN "итог" Masc Inanimate n3a ;
  izdanie_N = mkN "издание" Neut Inanimate n7a ;
  izmenenie_N = mkN "изменение" Neut Inanimate n7a ;
  izobrazhenie_N = mkN "изображение" Neut Inanimate n7a ;
  izuchenie_N = mkN "изучение" Neut Inanimate n7a ;
  izvestie_N = mkN "известие" Neut Inanimate n7a ;
  jabloko_N = mkN "яблоко" Neut Inanimate (ZN 3 No A ZC1) ;
  janvarq_N = mkN "январь" Masc Inanimate (ZN 2 No B NoC) ;
  jaszik_N = mkN "ящик" Masc Inanimate n3a ;
  javlenie_N = mkN "явление" Neut Inanimate n7a ;
  jazyk_N = mkN "язык" Masc Inanimate (ZN 3 No B NoC) ;
  kabinet_N = mkN "кабинет" Masc Inanimate n1a ;
  kachestvo_N = mkN "качество" Neut Inanimate n1a ;
  kadr_N = mkN "кадр" Masc Inanimate n1a ;
  kamenq_N = mkN "камень" Masc Inanimate (ZN 2 Ast E NoC) ;
  kamera_N = mkN "камера" Fem Inanimate n1a ;
  kanal_N = mkN "канал" Masc Inanimate n1a ;
  kandidat_N = mkN "кандидат" Masc Animate n1a ;
  kapital_N = mkN "капитал" Masc Inanimate n1a ;
  kapitan_N = mkN "капитан" Masc Animate n1a ;
  karman_N = mkN "карман" Masc Inanimate n1a ;
  karta_N = mkN "карта" Fem Inanimate n1a ;
  kartina_N = mkN "картина" Fem Inanimate n1a ;
  kategorija_N = mkN "категория" Fem Inanimate n7a ;
  kilometr_N = mkN "километр" Masc Inanimate n1a ;
  kino_N = mkN "кино" Neut Inanimate ZN0 ;
  klass_N = mkN "класс" Masc Inanimate n1a ;
  kletka_N = mkN "клетка" Fem Inanimate (ZN 3 Ast A NoC) ;
  klient_N = mkN "клиент" Masc Animate n1a ;
  kljuch_N = mkN "ключ" Masc Inanimate (ZN 4 No B NoC) ;
  klub_N = mkN "клуб" Masc Inanimate (ZN 1 No C NoC) ;
  kniga_N = mkN "книга" Fem Inanimate n3a ;
  knizhka_N = mkN "книжка" Fem Inanimate (ZN 3 Ast A NoC) ;
  knjazq_N = mkN "князь" Masc Animate (ZN 2 No C NoC) ;
  kodeks_N = mkN "кодекс" Masc Inanimate n1a ;
  kofe_N = mkN "кофе" Masc Inanimate ZN0 ;
  koleno_N = mkN "колено" Neut Inanimate n1a ;
  koleso_N = mkN "колесо" Neut Inanimate (ZN 1 Ast D NoC) ;
  kolichestvo_N = mkN "количество" Neut Inanimate n1a ;
  kollega_N = mkN "коллега" Fem Animate n3a ;
  kollektiv_N = mkN "коллектив" Masc Inanimate n1a ;
  kolqco_N = mkN "кольцо" Neut Inanimate (ZN 5 Ast D NoC) ;
  komanda_N = mkN "команда" Fem Inanimate n1a ;
  komandir_N = mkN "командир" Masc Animate n1a ;
  komissija_N = mkN "комиссия" Fem Inanimate n7a ;
  komitet_N = mkN "комитет" Masc Inanimate n1a ;
  kommunist_N = mkN "коммунист" Masc Animate n1a ;
  komnata_N = mkN "комната" Fem Inanimate n1a ;
  kompanija_N = mkN "компания" Fem Inanimate n7a ;
  kompleks_N = mkN "комплекс" Masc Inanimate n1a ;
  kompqjuter_N = mkN "компьютер" Masc Inanimate n1a ;
  koncepcija_N = mkN "концепция" Fem Inanimate n7a ;
  koncert_N = mkN "концерт" Masc Inanimate n1a ;
  konec_N = mkN "конец" Masc Inanimate (ZN 5 Ast B NoC) ;
  konferencija_N = mkN "конференция" Fem Inanimate n7a ;
  konflikt_N = mkN "конфликт" Masc Inanimate n1a ;
  konkurs_N = mkN "конкурс" Masc Inanimate n1a ;
  konstrukcija_N = mkN "конструкция" Fem Inanimate n7a ;
  kontakt_N = mkN "контакт" Masc Inanimate n1a ;
  kontrolq_N = mkN "контроль" Masc Inanimate n2a ;
  korablq_N = mkN "корабль" Masc Inanimate (ZN 2 No B NoC) ;
  korenq_N = mkN "корень" Masc Inanimate (ZN 2 Ast E NoC) ;
  koridor_N = mkN "коридор" Masc Inanimate n1a ;
  korolq_N = mkN "король" Masc Animate (ZN 2 No B NoC) ;
  korpus_N = mkN "корпус" Masc Inanimate (ZN 1 No C ZC1) ;
  kostjum_N = mkN "костюм" Masc Inanimate n1a ;
  kostq_N = mkN "кость" Fem Inanimate (ZN 8 No E NoC) ;
  kozha_N = mkN "кожа" Fem Inanimate (ZN 4 No A NoC) ;
  kraj_N = mkN "край" Masc Inanimate (ZN 6 No C ZC1) ;
  kraska_N = mkN "краска" Fem Inanimate (ZN 3 Ast A NoC) ;
  krasota_N = mkN "красота" Fem Inanimate (ZN 1 No D NoC) ;
  kredit_N = mkN "кредит" Masc Inanimate n1a ;
  kreslo_N = mkN "кресло" Neut Inanimate (ZN 1 Ast A NoC) ;
  krest_N = mkN "крест" Masc Inanimate (ZN 1 No B NoC) ;
  krizis_N = mkN "кризис" Masc Inanimate n1a ;
  krovatq_N = mkN "кровать" Fem Inanimate n8a ;
  krovq_N = mkN "кровь" Fem Inanimate (ZN 8 No E NoC) ;
  krug_N = mkN "круг" Masc Inanimate (ZN 3 No C NoC) ;
  krylo_N = mkN "крыло" Neut Inanimate (ZN 1 No D NoC) ;
  kuhnja_N = mkN "кухня" Fem Inanimate (ZN 2 Ast A NoC) ;
  kulak_N = mkN "кулак" Masc Inanimate (ZN 3 No B NoC) ;
  kulqtura_N = mkN "культура" Fem Inanimate n1a ;
  kurs_N = mkN "курс" Masc Inanimate n1a ;
  kusok_N = mkN "кусок" Masc Inanimate (ZN 3 Ast B NoC) ;
  kust_N = mkN "куст" Masc Inanimate (ZN 1 No B NoC) ;
  kvartira_N = mkN "квартира" Fem Inanimate n1a ;
  ladonq_N = mkN "ладонь" Fem Inanimate n8a ;
  lagerq_N = mkN "лагерь" Masc Inanimate (ZN 2 No C ZC1) ;
  lejtenant_N = mkN "лейтенант" Masc Animate n1a ;
  lestnica_N = mkN "лестница" Fem Inanimate (ZN 5 No A NoC) ;
  leto_N = mkN "лето" Neut Inanimate n1a ;
  lev_N = mkN "лев" Masc Animate (ZN 1 Ast B NoC) ;
  lichnostq_N = mkN "личность" Fem Inanimate n8a ;
  lico_N = mkN "лицо" Neut Inanimate (ZN 5 No D NoC) ;
  lider_N = mkN "лидер" Masc Animate n1a ;
  linija_N = mkN "линия" Fem Inanimate n7a ;
  list_N = mkN "лист" Masc Inanimate (ZN 1 No D NoC) ;
  literatura_N = mkN "литература" Fem Inanimate n1a ;
  ljubovq_N = mkN "любовь" Fem Inanimate (ZN 8 Ast B' NoC) ;
  lob_N = mkN "лоб" Masc Inanimate (ZN 1 Ast B NoC) ;
  lodka_N = mkN "лодка" Fem Inanimate (ZN 3 Ast A NoC) ;
  loshadq_N = mkN "лошадь" Fem Animate (ZN 8 No E NoC) ;
  magazin_N = mkN "магазин" Masc Inanimate n1a ;
  maj_N = mkN "май" Masc Inanimate (ZN 6 No A NoC) ;
  major_N = mkN "майор" Masc Animate n1a ;
  malqchik_N = mkN "мальчик" Masc Animate n3a ;
  malqchishka_N = mkN "мальчишка" Fem Animate (ZN 3 Ast A NoC) ;
  mama_N = mkN "мама" Fem Animate n1a ;
  mart_N = mkN "март" Masc Inanimate n1a ;
  mashina_N = mkN "машина" Fem Inanimate n1a ;
  maslo_N = mkN "масло" Neut Inanimate (ZN 1 Ast C NoC) ;
  massa_N = mkN "масса" Fem Inanimate n1a ;
  masshtab_N = mkN "масштаб" Masc Inanimate n1a ;
  master_N = mkN "мастер" Masc Animate (ZN 1 No C ZC1) ;
  material_N = mkN "материал" Masc Inanimate n1a ;
  mechta_N = mkN "мечта" Fem Inanimate (ZN 1 No B NoC) ;
  mehanizm_N = mkN "механизм" Masc Inanimate n1a ;
  mera_N = mkN "мера" Fem Inanimate n1a ;
  meroprijatie_N = mkN "мероприятие" Neut Inanimate n7a ;
  meshok_N = mkN "мешок" Masc Inanimate (ZN 3 Ast B NoC) ;
  mesjac_N = mkN "месяц" Masc Inanimate (ZN 5 No A NoC) ;
  mesto_N = mkN "место" Neut Inanimate (ZN 1 No C NoC) ;
  metall_N = mkN "металл" Masc Inanimate n1a ;
  metod_N = mkN "метод" Masc Inanimate n1a ;
  metr_N = mkN "метр" Masc Inanimate n1a ;
  mgnovenie_N = mkN "мгновение" Neut Inanimate n7a ;
  mig_N = mkN "миг" Masc Inanimate n3a ;
  milicija_N = mkN "милиция" Fem Inanimate n7a ;
  million_N = mkN "миллион" Masc Inanimate n1a ;
  ministerstvo_N = mkN "министерство" Neut Inanimate n1a ;
  ministr_N = mkN "министр" Masc Animate n1a ;
  minuta_N = mkN "минута" Fem Inanimate n1a ;
  mir_N = mkN "мир" Masc Inanimate (ZN 1 No C NoC) ;
  mjaso_N = mkN "мясо" Neut Inanimate (ZN 1 No C NoC) ;
  mnenie_N = mkN "мнение" Neut Inanimate n7a ;
  mnozhestvo_N = mkN "множество" Neut Inanimate n1a ;
  modelq_N = mkN "модель" Fem Inanimate n8a ;
  moloko_N = mkN "молоко" Neut Inanimate (ZN 3 No D ZC1) ;
  moment_N = mkN "момент" Masc Inanimate n1a ;
  monastyrq_N = mkN "монастырь" Masc Inanimate (ZN 2 No B NoC) ;
  more_N = mkN "море" Neut Inanimate (ZN 2 No C NoC) ;
  moskvich_N = mkN "москвич" Masc Animate (ZN 4 No B NoC) ;
  most_N = mkN "мост" Masc Inanimate (ZN 1 No B NoC) ;
  mosznostq_N = mkN "мощность" Fem Inanimate n8a ;
  mozg_N = mkN "мозг" Masc Inanimate (ZN 3 No C NoC) ;
  muzej_N = mkN "музей" Masc Inanimate (ZN 6 No A NoC) ;
  muzh_N = mkN "муж" Masc Animate (ZN 4 No C NoC) ;
  muzhik_N = mkN "мужик" Masc Animate (ZN 3 No B NoC) ;
  muzyka_N = mkN "музыка" Fem Inanimate n3a ;
  myslq_N = mkN "мысль" Fem Inanimate n8a ;
  nabljudenie_N = mkN "наблюдение" Neut Inanimate n7a ;
  nabor_N = mkN "набор" Masc Inanimate n1a ;
  nachalo_N = mkN "начало" Neut Inanimate n1a ;
  nachalqnik_N = mkN "начальник" Masc Animate n3a ;
  nachalqstvo_N = mkN "начальство" Neut Inanimate n1a ;
  nadezhda_N = mkN "надежда" Fem Inanimate n1a ;
  nalichie_N = mkN "наличие" Neut Inanimate n7a ;
  nalog_N = mkN "налог" Masc Inanimate n3a ;
  napravlenie_N = mkN "направление" Neut Inanimate n7a ;
  narod_N = mkN "народ" Masc Inanimate n1a ;
  narushenie_N = mkN "нарушение" Neut Inanimate n7a ;
  naselenie_N = mkN "население" Neut Inanimate n7a ;
  nastroenie_N = mkN "настроение" Neut Inanimate n7a ;
  nauka_N = mkN "наука" Fem Inanimate n3a ;
  naznachenie_N = mkN "назначение" Neut Inanimate n7a ;
  nazvanie_N = mkN "название" Neut Inanimate n7a ;
  nebo_N = mkN "небо" Neut Inanimate (ZN 1 No C NoC) ;
  nedelja_N = mkN "неделя" Fem Inanimate n2a ;
  nedostatok_N = mkN "недостаток" Masc Inanimate (ZN 3 Ast A NoC) ;
  nemec_N = mkN "немец" Masc Animate (ZN 5 Ast A NoC) ;
  neobhodimostq_N = mkN "необходимость" Fem Inanimate n8a ;
  nochq_N = mkN "ночь" Fem Inanimate (ZN 8 No E NoC) ;
  noga_N = mkN "нога" Fem Inanimate (ZN 3 No F' NoC) ;
  nojabrq_N = mkN "ноябрь" Masc Inanimate (ZN 2 No B NoC) ;
  nomer_N = mkN "номер" Masc Inanimate (ZN 1 No C ZC1) ;
  norma_N = mkN "норма" Fem Inanimate n1a ;
  nos_N = mkN "нос" Masc Inanimate (ZN 1 No C NoC) ;
  novostq_N = mkN "новость" Fem Inanimate (ZN 8 No E NoC) ;
  nozh_N = mkN "нож" Masc Inanimate (ZN 4 No B NoC) ;
  ob6edinenie_N = mkN "объединение" Neut Inanimate n7a ;
  ob6ekt_N = mkN "объект" Masc Inanimate n1a ;
  ob6jasnenie_N = mkN "объяснение" Neut Inanimate n7a ;
  obed_N = mkN "обед" Masc Inanimate n1a ;
  obespechenie_N = mkN "обеспечение" Neut Inanimate n7a ;
  objazannostq_N = mkN "обязанность" Fem Inanimate n8a ;
  objazatelqstvo_N = mkN "обязательство" Neut Inanimate n1a ;
  oblastq_N = mkN "область" Fem Inanimate (ZN 8 No E NoC) ;
  oborona_N = mkN "оборона" Fem Inanimate n1a ;
  oborudovanie_N = mkN "оборудование" Neut Inanimate n7a ;
  obrabotka_N = mkN "обработка" Fem Inanimate (ZN 3 Ast A NoC) ;
  obraszenie_N = mkN "обращение" Neut Inanimate n7a ;
  obraz_N = mkN "образ" Masc Inanimate n1a ;
  obrazec_N = mkN "образец" Masc Inanimate (ZN 5 Ast B NoC) ;
  obrazovanie_N = mkN "образование" Neut Inanimate n7a ;
  obstanovka_N = mkN "обстановка" Fem Inanimate (ZN 3 Ast A NoC) ;
  obstojatelqstvo_N = mkN "обстоятельство" Neut Inanimate n1a ;
  obszenie_N = mkN "общение" Neut Inanimate n7a ;
  obszestvo_N = mkN "общество" Neut Inanimate n1a ;
  obuchenie_N = mkN "обучение" Neut Inanimate n7a ;
  ocenka_N = mkN "оценка" Fem Inanimate (ZN 3 Ast A NoC) ;
  ocheredq_N = mkN "очередь" Fem Inanimate (ZN 8 No E NoC) ;
  ochki_N = mkN "очки" Masc Inanimate (ZN 3 Ast B NoC) ;
  odezhda_N = mkN "одежда" Fem Inanimate n1a ;
  oficer_N = mkN "офицер" Masc Animate n1a ;
  ogonq_N = mkN "огонь" Masc Inanimate (ZN 2 Ast B NoC) ;
  ohrana_N = mkN "охрана" Fem Inanimate n1a ;
  okno_N = mkN "окно" Neut Inanimate (ZN 1 Ast D NoC) ;
  okonchanie_N = mkN "окончание" Neut Inanimate n7a ;
  okrug_N = mkN "округ" Masc Inanimate (ZN 3 No C ZC1) ;
  oktjabrq_N = mkN "октябрь" Masc Inanimate (ZN 2 No B NoC) ;
  opasnostq_N = mkN "опасность" Fem Inanimate n8a ;
  operacija_N = mkN "операция" Fem Inanimate n7a ;
  opisanie_N = mkN "описание" Neut Inanimate n7a ;
  oplata_N = mkN "оплата" Fem Inanimate n1a ;
  opredelenie_N = mkN "определение" Neut Inanimate n7a ;
  opyt_N = mkN "опыт" Masc Inanimate n1a ;
  organ_N = mkN "орган" Masc Inanimate n1a ;
  organizacija_N = mkN "организация" Fem Inanimate n7a ;
  organizm_N = mkN "организм" Masc Inanimate n1a ;
  oruzhie_N = mkN "оружие" Neut Inanimate n7a ;
  osenq_N = mkN "осень" Fem Inanimate n8a ;
  oshibka_N = mkN "ошибка" Fem Inanimate (ZN 3 Ast A NoC) ;
  osnova_N = mkN "основа" Fem Inanimate n1a ;
  osnovanie_N = mkN "основание" Neut Inanimate n7a ;
  osobennostq_N = mkN "особенность" Fem Inanimate n8a ;
  ostatok_N = mkN "остаток" Masc Inanimate (ZN 3 Ast A NoC) ;
  ostrov_N = mkN "остров" Masc Inanimate (ZN 1 No C ZC1) ;
  oszuszenie_N = mkN "ощущение" Neut Inanimate n7a ;
  otdel_N = mkN "отдел" Masc Inanimate n1a ;
  otdelenie_N = mkN "отделение" Neut Inanimate n7a ;
  otdyh_N = mkN "отдых" Masc Inanimate n3a ;
  otec_N = mkN "отец" Masc Animate (ZN 5 Ast B NoC) ;
  otkaz_N = mkN "отказ" Masc Inanimate n1a ;
  otkrytie_N = mkN "открытие" Neut Inanimate n7a ;
  otlichie_N = mkN "отличие" Neut Inanimate n7a ;
  otnoshenie_N = mkN "отношение" Neut Inanimate n7a ;
  otraslq_N = mkN "отрасль" Fem Inanimate (ZN 8 No E NoC) ;
  otsutstvie_N = mkN "отсутствие" Neut Inanimate n7a ;
  otvet_N = mkN "ответ" Masc Inanimate n1a ;
  otvetstvennostq_N = mkN "ответственность" Fem Inanimate n8a ;
  ozero_N = mkN "озеро" Neut Inanimate n1a ;
  ozhidanie_N = mkN "ожидание" Neut Inanimate n7a ;
  paket_N = mkN "пакет" Masc Inanimate n1a ;
  palata_N = mkN "палата" Fem Inanimate n1a ;
  palec_N = mkN "палец" Masc Inanimate (ZN 5 Ast A NoC) ;
  pamjatnik_N = mkN "памятник" Masc Inanimate n3a ;
  pamjatq_N = mkN "память" Fem Inanimate n8a ;
  papa_N = mkN "папа" Fem Animate n1a ;
  para_N = mkN "пара" Fem Inanimate n1a ;
  parametr_N = mkN "параметр" Masc Inanimate n1a ;
  parenq_N = mkN "парень" Masc Animate (ZN 2 Ast E NoC) ;
  park_N = mkN "парк" Masc Inanimate n3a ;
  partija_N = mkN "партия" Fem Inanimate n7a ;
  pechatq_N = mkN "печать" Fem Inanimate n8a ;
  pensija_N = mkN "пенсия" Fem Inanimate n7a ;
  peredacha_N = mkN "передача" Fem Inanimate (ZN 4 No A NoC) ;
  peregovory_N = mkN "переговоры" Masc Inanimate n1a ;
  perehod_N = mkN "переход" Masc Inanimate n1a ;
  perevod_N = mkN "перевод" Masc Inanimate n1a ;
  period_N = mkN "период" Masc Inanimate n1a ;
  perspektiva_N = mkN "перспектива" Fem Inanimate n1a ;
  pesnja_N = mkN "песня" Fem Inanimate (ZN 2 Ast A NoC) ;
  pesok_N = mkN "песок" Masc Inanimate (ZN 3 Ast B NoC) ;
  pisatelq_N = mkN "писатель" Masc Animate n2a ;
  pisqmo_N = mkN "письмо" Neut Inanimate (ZN 1 Ast D NoC) ;
  pistolet_N = mkN "пистолет" Masc Inanimate n1a ;
  pivo_N = mkN "пиво" Neut Inanimate n1a ;
  plan_N = mkN "план" Masc Inanimate n1a ;
  plata_N = mkN "плата" Fem Inanimate n1a ;
  platqe_N = mkN "платье" Neut Inanimate (ZN 6 Ast A ZC2) ;
  plecho_N = mkN "плечо" Neut Inanimate (ZN 4 No F ZC1) ;
  ploszadka_N = mkN "площадка" Fem Inanimate (ZN 3 Ast A NoC) ;
  ploszadq_N = mkN "площадь" Fem Inanimate (ZN 8 No E NoC) ;
  pobeda_N = mkN "победа" Fem Inanimate n1a ;
  pochva_N = mkN "почва" Fem Inanimate n1a ;
  pod6ezd_N = mkN "подъезд" Masc Inanimate n1a ;
  podarok_N = mkN "подарок" Masc Inanimate (ZN 3 Ast A NoC) ;
  podderzhka_N = mkN "поддержка" Fem Inanimate (ZN 3 Ast A NoC) ;
  podgotovka_N = mkN "подготовка" Fem Inanimate (ZN 3 Ast A NoC) ;
  podhod_N = mkN "подход" Masc Inanimate n1a ;
  podrazdelenie_N = mkN "подразделение" Neut Inanimate n7a ;
  podruga_N = mkN "подруга" Fem Animate n3a ;
  poeht_N = mkN "поэт" Masc Animate n1a ;
  poehzija_N = mkN "поэзия" Fem Inanimate n7a ;
  poezd_N = mkN "поезд" Masc Inanimate (ZN 1 No C ZC1) ;
  poezdka_N = mkN "поездка" Fem Inanimate (ZN 3 Ast A NoC) ;
  poisk_N = mkN "поиск" Masc Inanimate n3a ;
  pojavlenie_N = mkN "появление" Neut Inanimate n7a ;
  pokazatelq_N = mkN "показатель" Masc Inanimate n2a ;
  pokoj_N = mkN "покой" Masc Inanimate (ZN 6 No A NoC) ;
  pokolenie_N = mkN "поколение" Neut Inanimate n7a ;
  pokupatelq_N = mkN "покупатель" Masc Animate n2a ;
  pol_N = mkN "пол" Masc Inanimate (ZN 1 No C NoC) ;
  pole_N = mkN "поле" Neut Inanimate (ZN 2 No C NoC) ;
  politika_N = mkN "политика" Fem Inanimate n3a ;
  polkovnik_N = mkN "полковник" Masc Animate n3a ;
  polosa_N = mkN "полоса" Fem Inanimate (ZN 1 No F' NoC) ;
  polovina_N = mkN "половина" Fem Inanimate n1a ;
  polozhenie_N = mkN "положение" Neut Inanimate n7a ;
  polqza_N = mkN "польза" Fem Inanimate n1a ;
  poluchenie_N = mkN "получение" Neut Inanimate n7a ;
  pomeszenie_N = mkN "помещение" Neut Inanimate n7a ;
  pomosznik_N = mkN "помощник" Masc Animate n3a ;
  pomoszq_N = mkN "помощь" Fem Inanimate n8a ;
  ponimanie_N = mkN "понимание" Neut Inanimate n7a ;
  ponjatie_N = mkN "понятие" Neut Inanimate n7a ;
  popytka_N = mkN "попытка" Fem Inanimate (ZN 3 Ast A NoC) ;
  pora_N = mkN "пора" Fem Inanimate (ZN 1 No F' NoC) ;
  porjadok_N = mkN "порядок" Masc Inanimate (ZN 3 Ast A NoC) ;
  porog_N = mkN "порог" Masc Inanimate n3a ;
  portret_N = mkN "портрет" Masc Inanimate n1a ;
  posledstvie_N = mkN "последствие" Neut Inanimate n7a ;
  post_N = mkN "пост" Masc Inanimate (ZN 1 No B NoC) ;
  postanovlenie_N = mkN "постановление" Neut Inanimate n7a ;
  postelq_N = mkN "постель" Fem Inanimate n8a ;
  poterja_N = mkN "потеря" Fem Inanimate n2a ;
  potok_N = mkN "поток" Masc Inanimate n3a ;
  potolok_N = mkN "потолок" Masc Inanimate (ZN 3 Ast B NoC) ;
  potrebnostq_N = mkN "потребность" Fem Inanimate n8a ;
  povedenie_N = mkN "поведение" Neut Inanimate n7a ;
  poverhnostq_N = mkN "поверхность" Fem Inanimate n8a ;
  povod_N = mkN "повод" Masc Inanimate n1a ;
  povorot_N = mkN "поворот" Masc Inanimate n1a ;
  povyshenie_N = mkN "повышение" Neut Inanimate n7a ;
  pozicija_N = mkN "позиция" Fem Inanimate n7a ;
  pqesa_N = mkN "пьеса" Fem Inanimate n1a ;
  praktika_N = mkN "практика" Fem Inanimate n3a ;
  pravda_N = mkN "правда" Fem Inanimate n1a ;
  pravilo_N = mkN "правило" Neut Inanimate n1a ;
  pravitelqstvo_N = mkN "правительство" Neut Inanimate n1a ;
  pravo_N = mkN "право" Neut Inanimate (ZN 1 No C NoC) ;
  prazdnik_N = mkN "праздник" Masc Inanimate n3a ;
  predel_N = mkN "предел" Masc Inanimate n1a ;
  predlozhenie_N = mkN "предложение" Neut Inanimate n7a ;
  predmet_N = mkN "предмет" Masc Inanimate n1a ;
  predprijatie_N = mkN "предприятие" Neut Inanimate n7a ;
  predsedatelq_N = mkN "председатель" Masc Animate n2a ;
  predstavitelq_N = mkN "представитель" Masc Animate n2a ;
  predstavlenie_N = mkN "представление" Neut Inanimate n7a ;
  premija_N = mkN "премия" Fem Inanimate n7a ;
  preparat_N = mkN "препарат" Masc Inanimate n1a ;
  prestuplenie_N = mkN "преступление" Neut Inanimate n7a ;
  prezident_N = mkN "президент" Masc Animate n1a ;
  prichina_N = mkN "причина" Fem Inanimate n1a ;
  prijatelq_N = mkN "приятель" Masc Animate n2a ;
  prikaz_N = mkN "приказ" Masc Inanimate n1a ;
  primenenie_N = mkN "применение" Neut Inanimate n7a ;
  primer_N = mkN "пример" Masc Inanimate n1a ;
  princip_N = mkN "принцип" Masc Inanimate n1a ;
  prinjatie_N = mkN "принятие" Neut Inanimate n7a ;
  priroda_N = mkN "природа" Fem Inanimate n1a ;
  prisutstvie_N = mkN "присутствие" Neut Inanimate n7a ;
  priznak_N = mkN "признак" Masc Inanimate n3a ;
  priznanie_N = mkN "признание" Neut Inanimate n7a ;
  problema_N = mkN "проблема" Fem Inanimate n1a ;
  procedura_N = mkN "процедура" Fem Inanimate n1a ;
  procent_N = mkN "процент" Masc Inanimate n1a ;
  process_N = mkN "процесс" Masc Inanimate n1a ;
  prodazha_N = mkN "продажа" Fem Inanimate (ZN 4 No A NoC) ;
  produkcija_N = mkN "продукция" Fem Inanimate n7a ;
  produkt_N = mkN "продукт" Masc Inanimate n1a ;
  proekt_N = mkN "проект" Masc Inanimate n1a ;
  professija_N = mkN "профессия" Fem Inanimate n7a ;
  professor_N = mkN "профессор" Masc Animate (ZN 1 No C ZC1) ;
  programma_N = mkN "программа" Fem Inanimate n1a ;
  proizvedenie_N = mkN "произведение" Neut Inanimate n7a ;
  proizvoditelq_N = mkN "производитель" Masc Animate n2a ;
  proizvodstvo_N = mkN "производство" Neut Inanimate n1a ;
  prokuror_N = mkN "прокурор" Masc Animate n1a ;
  promyshlennostq_N = mkN "промышленность" Fem Inanimate n8a ;
  prosqba_N = mkN "просьба" Fem Inanimate n1a ;
  prostranstvo_N = mkN "пространство" Neut Inanimate n1a ;
  protivnik_N = mkN "противник" Masc Animate n3a ;
  provedenie_N = mkN "проведение" Neut Inanimate n7a ;
  proverka_N = mkN "проверка" Fem Inanimate (ZN 3 Ast A NoC) ;
  psihologija_N = mkN "психология" Fem Inanimate n7a ;
  ptica_N = mkN "птица" Fem Animate (ZN 5 No A NoC) ;
  publika_N = mkN "публика" Fem Inanimate n3a ;
  punkt_N = mkN "пункт" Masc Inanimate n1a ;
  putq_N = mkN "путь" Masc Inanimate (ZN 8 No B NoC) ;
  rabota_N = mkN "работа" Fem Inanimate n1a ;
  rabotnik_N = mkN "работник" Masc Animate n3a ;
  radostq_N = mkN "радость" Fem Inanimate n8a ;
  rajon_N = mkN "район" Masc Inanimate n1a ;
  raketa_N = mkN "ракета" Fem Inanimate n1a ;
  ramka_N = mkN "рамка" Fem Inanimate (ZN 3 Ast A NoC) ;
  rashod_N = mkN "расход" Masc Inanimate n1a ;
  rasskaz_N = mkN "рассказ" Masc Inanimate n1a ;
  rassmotrenie_N = mkN "рассмотрение" Neut Inanimate n7a ;
  rasstojanie_N = mkN "расстояние" Neut Inanimate n7a ;
  rastenie_N = mkN "растение" Neut Inanimate n7a ;
  raz_N = mkN "раз" Masc Inanimate (ZN 1 No C ZC2) ;
  razgovor_N = mkN "разговор" Masc Inanimate n1a ;
  razmer_N = mkN "размер" Masc Inanimate n1a ;
  raznica_N = mkN "разница" Fem Inanimate (ZN 5 No A NoC) ;
  razrabotka_N = mkN "разработка" Fem Inanimate (ZN 3 Ast A NoC) ;
  razreshenie_N = mkN "разрешение" Neut Inanimate n7a ;
  razvitie_N = mkN "развитие" Neut Inanimate n7a ;
  reakcija_N = mkN "реакция" Fem Inanimate n7a ;
  realizacija_N = mkN "реализация" Fem Inanimate n7a ;
  realqnostq_N = mkN "реальность" Fem Inanimate n8a ;
  rechq_N = mkN "речь" Fem Inanimate (ZN 8 No E NoC) ;
  redakcija_N = mkN "редакция" Fem Inanimate n7a ;
  redaktor_N = mkN "редактор" Masc Animate n1a ;
  reforma_N = mkN "реформа" Fem Inanimate n1a ;
  region_N = mkN "регион" Masc Inanimate n1a ;
  reka_N = mkN "река" Fem Inanimate (ZN 3 No D NoC) ;
  reklama_N = mkN "реклама" Fem Inanimate n1a ;
  remont_N = mkN "ремонт" Masc Inanimate n1a ;
  reshenie_N = mkN "решение" Neut Inanimate n7a ;
  respublika_N = mkN "республика" Fem Inanimate n3a ;
  restoran_N = mkN "ресторан" Masc Inanimate n1a ;
  resurs_N = mkN "ресурс" Masc Inanimate n1a ;
  revoljucija_N = mkN "революция" Fem Inanimate n7a ;
  rezhim_N = mkN "режим" Masc Inanimate n1a ;
  rezulqtat_N = mkN "результат" Masc Inanimate n1a ;
  risk_N = mkN "риск" Masc Inanimate n3a ;
  risunok_N = mkN "рисунок" Masc Inanimate (ZN 3 Ast A NoC) ;
  rjad_N = mkN "ряд" Masc Inanimate (ZN 1 No C NoC) ;
  rod_N = mkN "род" Masc Inanimate (ZN 1 No C NoC) ;
  rodina_N = mkN "родина" Fem Inanimate n1a ;
  roditelq_N = mkN "родитель" Masc Animate n2a ;
  rodstvennik_N = mkN "родственник" Masc Animate n3a ;
  rolq_N = mkN "роль" Fem Inanimate (ZN 8 No E NoC) ;
  roman_N = mkN "роман" Masc Inanimate n1a ;
  rost_N = mkN "рост" Masc Inanimate (ZN 1 No C ZC1) ;
  rot_N = mkN "рот" Masc Inanimate (ZN 1 Ast B NoC) ;
  rozhdenie_N = mkN "рождение" Neut Inanimate n7a ;
  rubezh_N = mkN "рубеж" Masc Inanimate (ZN 4 No B NoC) ;
  rublq_N = mkN "рубль" Masc Inanimate (ZN 2 No B NoC) ;
  ruchka_N = mkN "ручка" Fem Inanimate (ZN 3 Ast A NoC) ;
  ruka_N = mkN "рука" Fem Inanimate (ZN 3 No F' NoC) ;
  rukovoditelq_N = mkN "руководитель" Masc Animate n2a ;
  rukovodstvo_N = mkN "руководство" Neut Inanimate n1a ;
  rynok_N = mkN "рынок" Masc Inanimate (ZN 3 Ast A NoC) ;
  sad_N = mkN "сад" Masc Inanimate (ZN 1 No C NoC) ;
  sapog_N = mkN "сапог" Masc Inanimate (ZN 3 No B NoC) ;
  sbor_N = mkN "сбор" Masc Inanimate n1a ;
  scena_N = mkN "сцена" Fem Inanimate n1a ;
  schastqe_N = mkN "счастье" Neut Inanimate (ZN 6 Ast A NoC) ;
  sdelka_N = mkN "сделка" Fem Inanimate (ZN 3 Ast A NoC) ;
  sekretarq_N = mkN "секретарь" Masc Animate (ZN 2 No B NoC) ;
  sekunda_N = mkN "секунда" Fem Inanimate n1a ;
  selo_N = mkN "село" Neut Inanimate (ZN 1 No D NoC) ;
  semqja_N = mkN "семья" Fem Inanimate (ZN 6 Ast D NoC) ;
  sentjabrq_N = mkN "сентябрь" Masc Inanimate (ZN 2 No B NoC) ;
  serdce_N = mkN "сердце" Neut Inanimate (ZN 5 Ast C NoC) ;
  seredina_N = mkN "середина" Fem Inanimate n1a ;
  serija_N = mkN "серия" Fem Inanimate n7a ;
  sestra_N = mkN "сестра" Fem Animate (ZN 1 Ast D NoC) ;
  setq_N = mkN "сеть" Fem Inanimate (ZN 8 No E NoC) ;
  sezon_N = mkN "сезон" Masc Inanimate n1a ;
  sfera_N = mkN "сфера" Fem Inanimate n1a ;
  shag_N = mkN "шаг" Masc Inanimate (ZN 3 No C NoC) ;
  shans_N = mkN "шанс" Masc Inanimate n1a ;
  shema_N = mkN "схема" Fem Inanimate n1a ;
  shkola_N = mkN "школа" Fem Inanimate n1a ;
  shtab_N = mkN "штаб" Masc Inanimate (ZN 1 No C NoC) ;
  shtat_N = mkN "штат" Masc Inanimate n1a ;
  shtuka_N = mkN "штука" Fem Inanimate n3a ;
  shum_N = mkN "шум" Masc Inanimate n1a ;
  shutka_N = mkN "шутка" Fem Inanimate (ZN 3 Ast A NoC) ;
  sigareta_N = mkN "сигарета" Fem Inanimate n1a ;
  signal_N = mkN "сигнал" Masc Inanimate n1a ;
  sila_N = mkN "сила" Fem Inanimate n1a ;
  sistema_N = mkN "система" Fem Inanimate n1a ;
  situacija_N = mkN "ситуация" Fem Inanimate n7a ;
  sjuzhet_N = mkN "сюжет" Masc Inanimate n1a ;
  skazka_N = mkN "сказка" Fem Inanimate (ZN 3 Ast A NoC) ;
  skorostq_N = mkN "скорость" Fem Inanimate (ZN 8 No E NoC) ;
  slava_N = mkN "слава" Fem Inanimate n1a ;
  sled_N = mkN "след" Masc Inanimate (ZN 1 No C NoC) ;
  sledovatelq_N = mkN "следователь" Masc Animate n2a ;
  sledstvie_N = mkN "следствие" Neut Inanimate n7a ;
  sleza_N = mkN "слеза" Fem Inanimate (ZN 1 No F NoC) ;
  sloj_N = mkN "слой" Masc Inanimate (ZN 6 No C NoC) ;
  slovo_N = mkN "слово" Neut Inanimate (ZN 1 No C NoC) ;
  sluchaj_N = mkN "случай" Masc Inanimate (ZN 6 No A NoC) ;
  sluh_N = mkN "слух" Masc Inanimate n3a ;
  sluzhba_N = mkN "служба" Fem Inanimate n1a ;
  smeh_N = mkN "смех" Masc Inanimate n3a ;
  smena_N = mkN "смена" Fem Inanimate n1a ;
  smertq_N = mkN "смерть" Fem Inanimate (ZN 8 No E NoC) ;
  smysl_N = mkN "смысл" Masc Inanimate n1a ;
  sneg_N = mkN "снег" Masc Inanimate (ZN 3 No C ZC1) ;
  snizhenie_N = mkN "снижение" Neut Inanimate n7a ;
  sobaka_N = mkN "собака" Fem Animate n3a ;
  sobranie_N = mkN "собрание" Neut Inanimate n7a ;
  sobstvennostq_N = mkN "собственность" Fem Inanimate n8a ;
  sobytie_N = mkN "событие" Neut Inanimate n7a ;
  sochinenie_N = mkN "сочинение" Neut Inanimate n7a ;
  soderzhanie_N = mkN "содержание" Neut Inanimate n7a ;
  soedinenie_N = mkN "соединение" Neut Inanimate n7a ;
  soglashenie_N = mkN "соглашение" Neut Inanimate n7a ;
  sojuz_N = mkN "союз" Masc Inanimate n1a ;
  soldat_N = mkN "солдат" Masc Animate (ZN 1 No A ZC2) ;
  solnce_N = mkN "солнце" Neut Inanimate (ZN 5 No A NoC) ;
  somnenie_N = mkN "сомнение" Neut Inanimate n7a ;
  son_N = mkN "сон" Masc Inanimate (ZN 1 Ast B NoC) ;
  soobszenie_N = mkN "сообщение" Neut Inanimate n7a ;
  sootvetstvie_N = mkN "соответствие" Neut Inanimate n7a ;
  sosed_N = mkN "сосед" Masc Animate n1a ;
  sostav_N = mkN "состав" Masc Inanimate n1a ;
  sostojanie_N = mkN "состояние" Neut Inanimate n7a ;
  sotnja_N = mkN "сотня" Fem Inanimate (ZN 2 Ast A NoC) ;
  sotrudnichestvo_N = mkN "сотрудничество" Neut Inanimate n1a ;
  sotrudnik_N = mkN "сотрудник" Masc Animate n3a ;
  sovestq_N = mkN "совесть" Fem Inanimate n8a ;
  sovet_N = mkN "совет" Masc Inanimate n1a ;
  sozdanie_N = mkN "создание" Neut Inanimate n7a ;
  sozhalenie_N = mkN "сожаление" Neut Inanimate n7a ;
  soznanie_N = mkN "сознание" Neut Inanimate n7a ;
  specialist_N = mkN "специалист" Masc Animate n1a ;
  spektaklq_N = mkN "спектакль" Masc Inanimate n2a ;
  spina_N = mkN "спина" Fem Inanimate (ZN 1 No D' NoC) ;
  spisok_N = mkN "список" Masc Inanimate (ZN 3 Ast A NoC) ;
  spor_N = mkN "спор" Masc Inanimate n1a ;
  sport_N = mkN "спорт" Masc Inanimate n1a ;
  sposob_N = mkN "способ" Masc Inanimate n1a ;
  sposobnostq_N = mkN "способность" Fem Inanimate n8a ;
  sravnenie_N = mkN "сравнение" Neut Inanimate n7a ;
  sreda_N = mkN "среда" Fem Inanimate (ZN 1 No D NoC) ;
  sredstvo_N = mkN "средство" Neut Inanimate n1a ;
  srok_N = mkN "срок" Masc Inanimate n3a ;
  stakan_N = mkN "стакан" Masc Inanimate n1a ;
  stancija_N = mkN "станция" Fem Inanimate n7a ;
  starik_N = mkN "старик" Masc Animate n3a ;
  staruha_N = mkN "старуха" Fem Animate n3a ;
  statqja_N = mkN "статья" Fem Inanimate (ZN 6 Ast B NoC) ;
  status_N = mkN "статус" Masc Inanimate n1a ;
  stavka_N = mkN "ставка" Fem Inanimate (ZN 3 Ast A NoC) ;
  steklo_N = mkN "стекло" Neut Inanimate (ZN 1 Ast D NoC) ;
  stena_N = mkN "стена" Fem Inanimate (ZN 1 No D' NoC) ;
  stepenq_N = mkN "степень" Fem Inanimate (ZN 8 No E NoC) ;
  stilq_N = mkN "стиль" Masc Inanimate n2a ;
  stoimostq_N = mkN "стоимость" Fem Inanimate n8a ;
  stol_N = mkN "стол" Masc Inanimate (ZN 1 No B NoC) ;
  stolica_N = mkN "столица" Fem Inanimate (ZN 5 No A NoC) ;
  stolik_N = mkN "столик" Masc Inanimate n3a ;
  storona_N = mkN "сторона" Fem Inanimate (ZN 1 No F' NoC) ;
  strana_N = mkN "страна" Fem Inanimate (ZN 1 No D NoC) ;
  stranica_N = mkN "страница" Fem Inanimate (ZN 5 No A NoC) ;
  strastq_N = mkN "страсть" Fem Inanimate (ZN 8 No E NoC) ;
  stroitelqstvo_N = mkN "строительство" Neut Inanimate n1a ;
  stroj_N = mkN "строй" Masc Inanimate (ZN 6 No A NoC) ;
  stroka_N = mkN "строка" Fem Inanimate (ZN 3 No D NoC) ;
  struktura_N = mkN "структура" Fem Inanimate n1a ;
  student_N = mkN "студент" Masc Animate n1a ;
  stul_N = mkN "стул" Masc Inanimate n1a ;
  sub6ekt_N = mkN "субъект" Masc Inanimate n1a ;
  sud_N = mkN "суд" Masc Inanimate (ZN 1 No B NoC) ;
  sudqba_N = mkN "судьба" Fem Inanimate (ZN 1 Ast D NoC) ;
  sudqja_N = mkN "судья" Fem Animate (ZN 6 Ast D NoC) ;
  sumka_N = mkN "сумка" Fem Inanimate (ZN 3 Ast A NoC) ;
  summa_N = mkN "сумма" Fem Inanimate n1a ;
  suszestvo_N = mkN "существо" Neut Animate (ZN 1 No B NoC) ;
  suszestvovanie_N = mkN "существование" Neut Inanimate n7a ;
  susznostq_N = mkN "сущность" Fem Inanimate n8a ;
  sutki_N = mkN "сутка" Fem Inanimate  ;
  sutq_N = mkN "суть" Fem Inanimate n8a ;
  svedenie_N = mkN "сведение" Neut Inanimate n7a ;
  svet_N = mkN "свет" Masc Inanimate n1a ;
  svidetelq_N = mkN "свидетель" Masc Animate n2a ;
  svjazq_N = mkN "связь" Fem Inanimate n8a ;
  svoboda_N = mkN "свобода" Fem Inanimate n1a ;
  svojstvo_N = mkN "свойство" Neut Inanimate n1a ;
  syn_N = mkN "сын" Masc Animate (ZN 1 No C NoC) ;
  szeka_N = mkN "щека" Fem Inanimate (ZN 3 No F NoC) ;
  tablica_N = mkN "таблица" Fem Inanimate (ZN 5 No A NoC) ;
  tajna_N = mkN "тайна" Fem Inanimate n1a ;
  talant_N = mkN "талант" Masc Inanimate n1a ;
  tanec_N = mkN "танец" Masc Inanimate (ZN 5 Ast A NoC) ;
  teatr_N = mkN "театр" Masc Inanimate n1a ;
  techenie_N = mkN "течение" Neut Inanimate n7a ;
  tehnika_N = mkN "техника" Fem Inanimate n3a ;
  tehnologija_N = mkN "технология" Fem Inanimate n7a ;
  tekst_N = mkN "текст" Masc Inanimate n1a ;
  telefon_N = mkN "телефон" Masc Inanimate n1a ;
  televizor_N = mkN "телевизор" Masc Inanimate n1a ;
  telo_N = mkN "тело" Neut Inanimate (ZN 1 No C NoC) ;
  tema_N = mkN "тема" Fem Inanimate n1a ;
  temnota_N = mkN "темнота" Fem Inanimate (ZN 1 No D NoC) ;
  temperatura_N = mkN "температура" Fem Inanimate n1a ;
  tendencija_N = mkN "тенденция" Fem Inanimate n7a ;
  tenq_N = mkN "тень" Fem Inanimate (ZN 8 No E NoC) ;
  teorija_N = mkN "теория" Fem Inanimate n7a ;
  territorija_N = mkN "территория" Fem Inanimate n7a ;
  tip_N = mkN "тип" Masc Inanimate n1a ;
  tishina_N = mkN "тишина" Fem Inanimate (ZN 1 No D NoC) ;
  tjurqma_N = mkN "тюрьма" Fem Inanimate (ZN 1 Ast D NoC) ;
  tochka_N = mkN "точка" Fem Inanimate (ZN 3 Ast A NoC) ;
  tolpa_N = mkN "толпа" Fem Inanimate (ZN 1 No D NoC) ;
  tom_N = mkN "том" Masc Inanimate (ZN 1 No C ZC1) ;
  ton_N = mkN "тон" Masc Inanimate (ZN 1 No E NoC) ;
  torgovlja_N = mkN "торговля" Fem Inanimate (ZN 2 Ast A NoC) ;
  tovar_N = mkN "товар" Masc Inanimate n1a ;
  tovarisz_N = mkN "товарищ" Masc Animate (ZN 4 No A NoC) ;
  tradicija_N = mkN "традиция" Fem Inanimate n7a ;
  transport_N = mkN "транспорт" Masc Inanimate n1a ;
  trava_N = mkN "трава" Fem Inanimate (ZN 1 No D NoC) ;
  trebovanie_N = mkN "требование" Neut Inanimate n7a ;
  trubka_N = mkN "трубка" Fem Inanimate (ZN 3 Ast A NoC) ;
  trud_N = mkN "труд" Masc Inanimate (ZN 1 No B NoC) ;
  tvorchestvo_N = mkN "творчество" Neut Inanimate n1a ;
  tysjacha_N = mkN "тысяча" Fem Inanimate (ZN 4 No A NoC) ;
  ubijstvo_N = mkN "убийство" Neut Inanimate n1a ;
  uchastie_N = mkN "участие" Neut Inanimate n7a ;
  uchastnik_N = mkN "участник" Masc Animate n3a ;
  uchastok_N = mkN "участок" Masc Inanimate (ZN 3 Ast A NoC) ;
  uchenik_N = mkN "ученик" Masc Animate (ZN 3 No B NoC) ;
  uchitelq_N = mkN "учитель" Masc Animate (ZN 2 No C ZC1) ;
  uchrezhdenie_N = mkN "учреждение" Neut Inanimate n7a ;
  udar_N = mkN "удар" Masc Inanimate n1a ;
  udivlenie_N = mkN "удивление" Neut Inanimate n7a ;
  udovolqstvie_N = mkN "удовольствие" Neut Inanimate n7a ;
  ugol_N = mkN "угол" Masc Inanimate (ZN 1 Ast B NoC) ;
  ugroza_N = mkN "угроза" Fem Inanimate n1a ;
  uho_N = mkN "ухо" Neut Inanimate (ZN 3 No E NoC) ;
  uhod_N = mkN "уход" Masc Inanimate n1a ;
  ukazanie_N = mkN "указание" Neut Inanimate n7a ;
  ulica_N = mkN "улица" Fem Inanimate (ZN 5 No A NoC) ;
  ulybka_N = mkN "улыбка" Fem Inanimate (ZN 3 Ast A NoC) ;
  um_N = mkN "ум" Masc Inanimate (ZN 1 No B NoC) ;
  universitet_N = mkN "университет" Masc Inanimate n1a ;
  upravlenie_N = mkN "управление" Neut Inanimate n7a ;
  urok_N = mkN "урок" Masc Inanimate n3a ;
  urovenq_N = mkN "уровень" Masc Inanimate (ZN 2 Ast A NoC) ;
  usilie_N = mkN "усилие" Neut Inanimate n7a ;
  uslovie_N = mkN "условие" Neut Inanimate n7a ;
  usluga_N = mkN "услуга" Fem Inanimate n3a ;
  uspeh_N = mkN "успех" Masc Inanimate n3a ;
  ustanovka_N = mkN "установка" Fem Inanimate (ZN 3 Ast A NoC) ;
  ustrojstvo_N = mkN "устройство" Neut Inanimate n1a ;
  utro_N = mkN "утро" Neut Inanimate n1a ;
  uvelichenie_N = mkN "увеличение" Neut Inanimate n7a ;
  uzhas_N = mkN "ужас" Masc Inanimate n1a ;
  vagon_N = mkN "вагон" Masc Inanimate n1a ;
  variant_N = mkN "вариант" Masc Inanimate n1a ;
  vecher_N = mkN "вечер" Masc Inanimate (ZN 1 No C ZC1) ;
  vek_N = mkN "век" Masc Inanimate (ZN 3 No C ZC1) ;
  velichina_N = mkN "величина" Fem Inanimate (ZN 1 No D NoC) ;
  vera_N = mkN "вера" Fem Inanimate n1a ;
  vershina_N = mkN "вершина" Fem Inanimate n1a ;
  versija_N = mkN "версия" Fem Inanimate n7a ;
  vesna_N = mkN "весна" Fem Inanimate (ZN 1 Ast D NoC) ;
  veszestvo_N = mkN "вещество" Neut Inanimate (ZN 1 No B NoC) ;
  veszq_N = mkN "вещь" Fem Inanimate (ZN 8 No E NoC) ;
  veter_N = mkN "ветер" Masc Inanimate (ZN 1 Ast C ZC1) ;
  vhod_N = mkN "вход" Masc Inanimate n1a ;
  vid_N = mkN "вид" Masc Inanimate n1a ;
  vina_N = mkN "вина" Fem Inanimate (ZN 1 No D NoC) ;
  vino_N = mkN "вино" Neut Inanimate (ZN 1 No D NoC) ;
  virus_N = mkN "вирус" Masc Inanimate n1a ;
  vkus_N = mkN "вкус" Masc Inanimate n1a ;
  vladelec_N = mkN "владелец" Masc Animate (ZN 5 Ast A NoC) ;
  vlastq_N = mkN "власть" Fem Inanimate (ZN 8 No E NoC) ;
  vlijanie_N = mkN "влияние" Neut Inanimate n7a ;
  vnimanie_N = mkN "внимание" Neut Inanimate n7a ;
  voda_N = mkN "вода" Fem Animate n1a ;
  voditelq_N = mkN "водитель" Masc Animate n2a ;
  vodka_N = mkN "водка" Fem Inanimate (ZN 3 Ast A NoC) ;
  vojna_N = mkN "война" Fem Inanimate (ZN 1 No D NoC) ;
  vojsko_N = mkN "войско" Neut Inanimate (ZN 3 No C NoC) ;
  volja_N = mkN "воля" Fem Inanimate n2a ;
  volna_N = mkN "волна" Fem Inanimate (ZN 1 No D NoC) ;
  volos_N = mkN "волос" Masc Inanimate (ZN 1 No E ZC2) ;
  vopros_N = mkN "вопрос" Masc Inanimate n1a ;
  vorota_N = mkN "ворото" Neut Inanimate n1a ;
  vospitanie_N = mkN "воспитание" Neut Inanimate n7a ;
  vospominanie_N = mkN "воспоминание" Neut Inanimate n7a ;
  vostok_N = mkN "восток" Masc Inanimate n3a ;
  vostorg_N = mkN "восторг" Masc Inanimate n3a ;
  vozdejstvie_N = mkN "воздействие" Neut Inanimate n7a ;
  vozduh_N = mkN "воздух" Masc Inanimate n3a ;
  vozmozhnostq_N = mkN "возможность" Fem Inanimate n8a ;
  vozrast_N = mkN "возраст" Masc Inanimate n1a ;
  vozvraszenie_N = mkN "возвращение" Neut Inanimate n7a ;
  vpechatlenie_N = mkN "впечатление" Neut Inanimate n7a ;
  vrach_N = mkN "врач" Masc Animate (ZN 4 No B NoC) ;
  vrag_N = mkN "враг" Masc Animate (ZN 3 No B NoC) ;
  vremja_N = mkN "время" Neut Inanimate (ZN 8 Deg C NoC) ;
  vstrecha_N = mkN "встреча" Fem Inanimate (ZN 4 No A NoC) ;
  vybor_N = mkN "выбор" Masc Inanimate n1a ;
  vybory_N = mkN "выборы" Masc Inanimate n1a ;
  vyhod_N = mkN "выход" Masc Inanimate n1a ;
  vypolnenie_N = mkN "выполнение" Neut Inanimate n7a ;
  vypusk_N = mkN "выпуск" Masc Inanimate n3a ;
  vyrazhenie_N = mkN "выражение" Neut Inanimate n7a ;
  vysota_N = mkN "высота" Fem Inanimate (ZN 1 No D NoC) ;
  vystavka_N = mkN "выставка" Fem Inanimate (ZN 3 Ast A NoC) ;
  vystuplenie_N = mkN "выступление" Neut Inanimate n7a ;
  vyvod_N = mkN "вывод" Masc Inanimate n1a ;
  vzaimodejstvie_N = mkN "взаимодействие" Neut Inanimate n7a ;
  vzgljad_N = mkN "взгляд" Masc Inanimate n1a ;
  vzryv_N = mkN "взрыв" Masc Inanimate n1a ;
  zabota_N = mkN "забота" Fem Inanimate n1a ;
  zadacha_N = mkN "задача" Fem Inanimate (ZN 4 No A NoC) ;
  zajavlenie_N = mkN "заявление" Neut Inanimate n7a ;
  zakaz_N = mkN "заказ" Masc Inanimate n1a ;
  zakljuchenie_N = mkN "заключение" Neut Inanimate n7a ;
  zakon_N = mkN "закон" Masc Inanimate n1a ;
  zakonodatelqstvo_N = mkN "законодательство" Neut Inanimate n1a ;
  zal_N = mkN "зал" Masc Inanimate n1a ;
  zamestitelq_N = mkN "заместитель" Masc Animate n2a ;
  zamok_N = mkN "замок" Masc Inanimate (ZN 3 Ast A NoC) ;
  zanjatie_N = mkN "занятие" Neut Inanimate n7a ;
  zapad_N = mkN "запад" Masc Inanimate n1a ;
  zapah_N = mkN "запах" Masc Inanimate n3a ;
  zapas_N = mkN "запас" Masc Inanimate n1a ;
  zapiska_N = mkN "записка" Fem Inanimate (ZN 3 Ast A NoC) ;
  zapisq_N = mkN "запись" Fem Inanimate n8a ;
  zarplata_N = mkN "зарплата" Fem Inanimate n1a ;
  zasedanie_N = mkN "заседание" Neut Inanimate n7a ;
  zaszita_N = mkN "защита" Fem Inanimate n1a ;
  zatrata_N = mkN "затрата" Fem Inanimate n1a ;
  zavisimostq_N = mkN "зависимость" Fem Inanimate n8a ;
  zavod_N = mkN "завод" Masc Inanimate n1a ;
  zdanie_N = mkN "здание" Neut Inanimate n7a ;
  zdorovqe_N = mkN "здоровье" Neut Inanimate (ZN 6 Ast A NoC) ;
  zemlja_N = mkN "земля" Fem Inanimate (ZN 2 Ast D' NoC) ;
  zerkalo_N = mkN "зеркало" Neut Inanimate (ZN 1 No C NoC) ;
  zhena_N = mkN "жена" Fem Animate (ZN 1 No D NoC) ;
  zhenszina_N = mkN "женщина" Fem Animate n1a ;
  zhertva_N = mkN "жертва" Fem Inanimate n1a ;
  zhitelq_N = mkN "житель" Masc Animate n2a ;
  zhivot_N = mkN "живот" Masc Inanimate (ZN 1 No B NoC) ;
  zhiznq_N = mkN "жизнь" Fem Inanimate n8a ;
  zhurnal_N = mkN "журнал" Masc Inanimate n1a ;
  zhurnalist_N = mkN "журналист" Masc Animate n1a ;
  zima_N = mkN "зима" Fem Inanimate (ZN 1 No D' NoC) ;
  zlo_N = mkN "зло" Neut Inanimate (ZN 1 Ast B NoC) ;
  znachenie_N = mkN "значение" Neut Inanimate n7a ;
  znak_N = mkN "знак" Masc Inanimate n3a ;
  znanie_N = mkN "знание" Neut Inanimate n7a ;
  zoloto_N = mkN "золото" Neut Inanimate n1a ;
  zona_N = mkN "зона" Fem Inanimate n1a ;
  zrenie_N = mkN "зрение" Neut Inanimate n7a ;
  zritelq_N = mkN "зритель" Masc Animate n2a ;
  zub_N = mkN "зуб" Masc Inanimate (ZN 1 No E NoC) ;
  zvezda_N = mkN "звезда" Fem Inanimate (ZN 1 No D NoC) ;
  zvonok_N = mkN "звонок" Masc Inanimate (ZN 3 Ast B NoC) ;
  zvuk_N = mkN "звук" Masc Inanimate n3a ;

  -- arestovatq_V = mkV perfective transitive "арестовать" ;  ---- гл ru 2aСВ |основа=арестова́ |основа1=аресту́ |основа2=аресто́ва |соотв=арестовывать |коммент=По помета|устаревшей норме глагол считался двувидовым.
  begatq_V = mkV imperfective transitive "бегать" "бегаю" "бегает" ;
  -- bezhatq_V = mkV imperfective transitive "бежать" ;  ---- гл ru 5b-ж |основа=беж |основа1=бег |основа2=бе́г |2в=1 |коммент=В некоторых значениях «бежать» может использоваться как глагол совершенного вида, особенно в формах прош. времени: пример|преступники выдел|бежали из тюрьмы пример|враг выдел|бежал пример|он выдел|бежал городской суеты пример|суп выдел|бежал. В 3л. мн.ч. употребляется нестандартная форма «''бегу́т''». До XIX также равноправной формой была форма «''бежа́т''» (см. пример). |imper-1p=1
  -- besedovatq_V = mkV imperfective transitive "беседовать" ;  ---- гл ru 2a |основа=бесе́дова |основа1=бесе́ду |НП=1
  bespokoitqsja_V = mkV imperfective intransitive "беспокоиться" "беспокоюсь" "беспокоится" ;
  bitq_V = mkV imperfective transitive "бить" "бью" "бьёт" ;
  bitqsja_V = mkV imperfective intransitive "биться" "бьюсь" "бьётся" ;
  blagodaritq_V = mkV imperfective transitive "благодарить" "благодарю" "благодарит" ;
  -- blestetq_V = mkV imperfective transitive "блестеть" ;  ---- гл ru 5b-т |основа=блест |основа1=блещ |основа2=бле́щ |НП=1
  boletq_V = mkV imperfective transitive "болеть" "болею" "болеет" ;
  -- bormotatq_V = mkV imperfective transitive "бормотать" ;  ---- гл ru 6cX |основа=бормот |основа1=бормоч |основа2=бормо́ч |основа3=бормо́т |соотв=пробормотать
  borotqsja_V = mkV imperfective intransitive "бороться" "борюсь" "борется" ;
  bojatqsja_V = mkV imperfective intransitive "бояться" "боюсь" "боится" ;
  bratq_V = mkV imperfective transitive "брать" "бру" "брёт" ;
  -- bratqsja_V = mkV imperfective intransitive "браться" ;  ---- гл ru 6°b/c-ся |основа=бр |основа1=бер |основа2=бра |соотв=взяться
  -- broditq_V = mkV imperfective transitive "бродить" ;  ---- гл ru 4c-т |основа=брод |основа1=бро́д |основа2=брож |НП=1 |соотв=забродить
  brosatq_V = mkV imperfective transitive "бросать" "бросаю" "бросает" ;
  brosatqsja_V = mkV imperfective intransitive "бросаться" "бросаюсь" "бросается" ;
  -- brositq_V = mkV perfective transitive "бросить" ;  ---- гл ru 4a-т-ьСВ |основа=бро́с |основа1=бро́ш |соотв=бросать
  -- brositqsja_V = mkV perfective intransitive "броситься" ;  ---- гл ru 4a-т-сяСВ |основа=бро́с |основа1=бро́ш |соотв=бросаться
  byvatq_V = mkV imperfective transitive "бывать" "бываю" "бывает" ;
  -- bytq_V = mkV imperfective transitive "быть" ;  ---- гл ru ^a/c
  valjatqsja_V = mkV imperfective intransitive "валяться" "валяюсь" "валяется" ;
  varitq_V = mkV imperfective transitive "варить" "варю" "варит" ;
  vvesti_V = mkV perfective transitive "ввести" "введу" "введёт" ;
  -- vvoditq_V = mkV imperfective transitive "вводить" ;  ---- гл ru 4c-т |основа=ввод |основа1=вво́д |основа2=ввож |соотв=ввести
  vezti_V = mkV imperfective transitive "везти" "везу" "везёт" ;
  veletq_V = mkV imperfective transitive "велеть" "велю" "велит" ;
  veritq_V = mkV imperfective transitive "верить" "верю" "верит" ;
  vernutq_V = mkV perfective transitive "вернуть" "верну" "вернёт" ;
  vernutqsja_V = mkV perfective intransitive "вернуться" "вернусь" "вернётся" ;
  vesti_V = mkV imperfective transitive "вести" "веду" "ведёт" ;
  vestisq_V = mkV imperfective intransitive "вестись" "ведусь" "ведётся" ;
  vzgljanutq_V = mkV perfective transitive "взглянуть" "взгляну" "взглянет" ;
  vzdohnutq_V = mkV perfective transitive "вздохнуть" "вздохну" "вздохнёт" ;
  -- vzjatq_V = mkV perfective transitive "взять" ;  ---- гл ru 14b/c'СВ |основа=взя́ |основа1=взя |основа2=возьм |соотв=[[брать]], [[взымать]]
  -- vzjatqsja_V = mkV perfective transitive "взяться" ;  ---- гл ru 14b/c"-сяСВ |основа=вз |основа1=вз |основа2=возь |соотв=[[браться]], [[взыматься]]
  vidatq_V = mkV imperfective transitive "видать" "видаю" "видает" ;
  -- videtq_V = mkV imperfective transitive "видеть" ;  ---- гл ru 5a-т |основа=ви́д |основа1=ви́ж |соотв=[[увидеть]], [[завидеть]] |ПовелЗатрудн=1
  -- videtqsja_V = mkV imperfective intransitive "видеться" ;  ---- гл ru 5a-т-ся |основа=ви́д |основа1=ви́ж |соотв=увидеться
  -- visetq_V = mkV imperfective transitive "висеть" ;  ---- гл ru 5b-т |основа=вис |основа1=виш |НП=1 |соотв=[[повисеть]], [[повиснуть]]
  vkljuchatq_V = mkV imperfective transitive "включать" "включаю" "включает" ;
  vkljuchitq_V = mkV perfective transitive "включить" "включу" "включит" ;
  vladetq_V = mkV imperfective transitive "владеть" "владею" "владеет" ;
  vlijatq_V = mkV imperfective transitive "влиять" "влияю" "влияет" ;
  vlozhitq_V = mkV perfective transitive "вложить" "вложу" "вложит" ;
  vnesti_V = mkV perfective transitive "внести" "внесу" "внесёт" ;
  -- vnositq_V = mkV imperfective transitive "вносить" ;  ---- гл ru 4c-т |основа=внос |основа1=вно́с |основа2=внош |соотв=внести
  -- voditq_V = mkV imperfective transitive "водить" ;  ---- гл ru 4c-т |основа=вод |основа1=во́д |основа2=вож |основа3=во́ж
  -- voevatq_V = mkV imperfective transitive "воевать" ;  ---- гл ru 2a |основа=воева́ |основа1=вою́ |соотв=повоевать |ПричСтрадПрош=воёванный
  vozvraszatqsja_V = mkV imperfective intransitive "возвращаться" "возвращаюсь" "возвращается" ;
  vozglavljatq_V = mkV imperfective transitive "возглавлять" "возглавляю" "возглавляет" ;
  voznikatq_V = mkV imperfective transitive "возникать" "возникаю" "возникает" ;
  vozniknutq_V = mkV perfective transitive "возникнуть" "возникну" "возникнет" ;
  vozrazhatq_V = mkV imperfective transitive "возражать" "возражаю" "возражает" ;
  -- vozrazitq_V = mkV perfective transitive "возразить" ;  ---- гл ru 4b-тСВ |основа=возраз |основа1=возраж |НП=1 |соотв=возражать
  vozrasti_V = mkV perfective transitive "возрасти" "возрасту" "возрастёт" ;
  -- vojti_V = mkV perfective transitive "войти" "войду" "войдёт" ;
  -- volnovatq_V = mkV imperfective transitive "волновать" ;  ---- гл ru 2a |основа=волнова́ |основа1=волну́ |соотв=взволновать
  -- volnovatqsja_V = mkV imperfective intransitive "волноваться" ;  ---- гл ru 2a-ся |основа=волнова́ |основа1=волну́ |соотв=[[взволноваться]], [[заволноваться]], [[поволноваться]]
  voskliknutq_V = mkV perfective transitive "воскликнуть" "воскликну" "воскликнет" ;
  -- vospolqzovatqsja_V = mkV perfective intransitive "воспользоваться" ;  ---- гл ru 2a-сяСВ |основа=воспо́льзова |основа1=воспо́льзу |соотв=-
  vosprinimatq_V = mkV imperfective transitive "воспринимать" "воспринимаю" "воспринимает" ;
  vosstanovitq_V = mkV perfective transitive "восстановить" "восстановлю" "восстановит" ;
  vratq_V = mkV imperfective transitive "врать" "вру" "врёт" ;
  vskochitq_V = mkV perfective transitive "вскочить" "вскочу" "вскочит" ;
  vspominatq_V = mkV imperfective transitive "вспоминать" "вспоминаю" "вспоминает" ;
  vspomnitq_V = mkV perfective transitive "вспомнить" "вспомню" "вспомнит" ;
  -- vstavatq_V = mkV imperfective transitive "вставать" ;  ---- гл ru 13b |основа=встава́ |основа1=вста |НП=1 |соотв=встать
  vstatq_V = mkV perfective transitive "встать" "встану" "встанет" ;
  -- vstretitq_V = mkV perfective transitive "встретить" ;  ---- гл ru 4a-т-ьСВ |основа=встре́т |основа1=встре́ч |соотв=встреча́ть |коммент=Устаревшая форма деепричастия — ''[[встретя|встре́тя]]''.
  -- vstretitqsja_V = mkV perfective intransitive "встретиться" ;  ---- гл ru 4a-т-сяСВ |основа=встре́т |основа1=встре́ч |соотв=встречаться
  vstrechatq_V = mkV imperfective transitive "встречать" "встречаю" "встречает" ;
  vstrechatqsja_V = mkV imperfective intransitive "встречаться" "встречаюсь" "встречается" ;
  vstupatq_V = mkV imperfective transitive "вступать" "вступаю" "вступает" ;
  vstupitq_V = mkV perfective transitive "вступить" "вступлю" "вступит" ;
  -- vhoditq_V = mkV imperfective transitive "входить" ;  ---- гл ru 4c-т |основа = вход |основа1 = вхо́д |основа2 = вхож |соотв=войти |НП=1
  vybiratq_V = mkV imperfective transitive "выбирать" "выбираю" "выбирает" ;
  -- vybratq_V = mkV perfective transitive "выбрать" ;  ---- гл ru 6°aСВ |основа = вы́бр |основа1 = вы́бер |соотв=выбирать
  -- vybratqsja_V = mkV perfective intransitive "выбраться" ;  ---- гл ru 6°a-сяСВ |основа=вы́бр |основа1=вы́бер |НП= |соотв=выбираться
  -- vybrositq_V = mkV perfective transitive "выбросить" ;  ---- гл ru 4a((3))-тСВ |основа=вы́брос |основа1=вы́брош |соотв=выбрасывать
  vyvesti_V = mkV perfective transitive "вывести" "выведу" "выведет" ;
  -- vygljadetq_V = mkV imperfective transitive "выглядеть" ;  ---- гл ru 5a-т-г |основа=вы́гляд |основа1=вы́гляж |НП=1 |соотв=-
  -- vydavatq_V = mkV imperfective transitive "выдавать" ;  ---- гл ru 13b |основа=выдава́ |основа1=выда |соотв=выдать
  -- vydatq_V = mkV perfective transitive "выдать" "выдам" "выдаст" ;
  vydelitq_V = mkV perfective transitive "выделить" "выделю" "выделит" ;
  vydeljatq_V = mkV imperfective transitive "выделять" "выделяю" "выделяет" ;
  vydeljatqsja_V = mkV imperfective intransitive "выделяться" "выделяюсь" "выделяется" ;
  vyderzhatq_V = mkV perfective transitive "выдержать" "выдержу" "выдержит" ;
  vyzhitq_V = mkV perfective transitive "выжить" "выживу" "выживет" ;
  -- vyzvatq_V = mkV perfective transitive "вызвать" ;  ---- гл ru 6°aСВ |основа = вы́зв |основа1 = вы́зов |соотв=вызывать
  vyzyvatq_V = mkV imperfective transitive "вызывать" "вызываю" "вызывает" ;
  vyigratq_V = mkV perfective transitive "выиграть" "выиграю" "выиграет" ;
  -- vyjti_V = mkV perfective intransitive "выйти" "выйду" "выйдет" ;
  vynesti_V = mkV perfective transitive "вынести" "вынесу" "вынесет" ;
  -- vynositq_V = mkV perfective transitive "выносить" ;  ---- гл ru 4a-тСВ |основа=вы́нос |основа1=вы́нош |соотв=вынашивать
  vynuditq_V = mkV perfective transitive "вынудить" "вынудю" "вынудит" ;
  vynutq_V = mkV perfective transitive "вынуть" "выну" "вынет" ;
  vypastq_V = mkV perfective transitive "выпасть" "выпаду" "выпадет" ;
  vypitq_V = mkV perfective transitive "выпить" "выпью" "выпьет" ;
  vypolnitq_V = mkV perfective transitive "выполнить" "выполню" "выполнит" ;
  vypolnjatq_V = mkV imperfective transitive "выполнять" "выполняю" "выполняет" ;
  vypuskatq_V = mkV imperfective transitive "выпускать" "выпускаю" "выпускает" ;
  -- vypustitq_V = mkV perfective transitive "выпустить" ;  ---- гл ru 4a-тСВ |основа=вы́пуст |основа1=вы́пущ |соотв=выпускать
  vyrazhatq_V = mkV imperfective transitive "выражать" "выражаю" "выражает" ;
  vyrazhatqsja_V = mkV imperfective intransitive "выражаться" "выражаюсь" "выражается" ;
  -- vyrazitq_V = mkV perfective transitive "выразить" ;  ---- гл ru 4a-тСВ |основа=вы́раз |основа1=вы́раж |соотв=выражать
  vyrasti_V = mkV perfective transitive "вырасти" "вырасту" "вырастет" ;
  vyrvatqsja_V = mkV perfective intransitive "вырваться" "вырвусь" "вырвется" ;
  -- vyskazatq_V = mkV perfective transitive "высказать" ;  ---- гл ru 6a-т-иСВ |основа=вы́сказ |основа1=вы́скаж |соотв=высказывать
  vyskochitq_V = mkV perfective transitive "выскочить" "выскочу" "выскочит" ;
  vyslushatq_V = mkV perfective transitive "выслушать" "выслушаю" "выслушает" ;
  -- vystavitq_V = mkV perfective transitive "выставить" ;  ---- гл ru 4a((3))СВ |основа=вы́став |основа1=вы́ставл |соотв=выставлять
  vystupatq_V = mkV imperfective transitive "выступать" "выступаю" "выступает" ;
  vystupitq_V = mkV perfective transitive "выступить" "выступлю" "выступит" ;
  vytaszitq_V = mkV perfective transitive "вытащить" "вытащу" "вытащит" ;
  vytjanutq_V = mkV perfective transitive "вытянуть" "вытяну" "вытянет" ;
  -- vyhoditq_V = mkV perfective transitive "выходить" ;  ---- гл ru 4a-тСВ |основа=вы́ход |основа1=вы́хож |соотв=выхаживать
  -- vyjavitq_V = mkV perfective transitive "выявить" ;  ---- гл ru 4a-лСВ |основа=вы́яв |соотв=выявлять
  vyjasnitq_V = mkV perfective transitive "выяснить" "выясню" "выяснит" ;
  vyjasnitqsja_V = mkV perfective intransitive "выясниться" "выяснюсь" "выяснится" ;
  -- garantirovatq_V = mkV imperfective transitive "гарантировать" ;  ---- гл ru 2a |основа=гаранти́рова |основа1=гаранти́ру |2в=1 |основа2=гаранти́ров
  -- gljadetq_V = mkV imperfective transitive "глядеть" ;  ---- гл ru 5b^-т2 |основа = гляд |основа1 = гляж |основа2 = гля́д
  gljanutq_V = mkV perfective transitive "глянуть" "гляну" "глянет" ;
  -- gnatq_V = mkV imperfective transitive "гнать" ;  ---- гл ru 5c/c |основа=гн |основа1=гон |основа2=го́н |соотв=без ссылок|приставочные типа [[погнать]], [[загнать]]
  govoritq_V = mkV imperfective transitive "говорить" "говорю" "говорит" ;
  govoritqsja_V = mkV imperfective intransitive "говориться" "говорюсь" "говорится" ;
  -- gorditqsja_V = mkV imperfective intransitive "гордиться" ;  ---- гл ru 4b-т-ся |основа=горд |основа1=горж |соотв=возгордиться
  goretq_V = mkV imperfective transitive "гореть" "горю" "горит" ;
  gotovitq_V = mkV imperfective transitive "готовить" "готовлю" "готовит" ;
  gotovitqsja_V = mkV imperfective intransitive "готовиться" "готовлюсь" "готовится" ;
  -- grozitq_V = mkV imperfective transitive "грозить" ;  ---- гл ru 4b-т |основа=гроз |основа1=грож |НП=1
  guljatq_V = mkV imperfective transitive "гулять" "гуляю" "гуляет" ;
  -- davatq_V = mkV imperfective transitive "давать" ;  ---- гл ru 13b |основа = дава́ |основа1 = да |основа2 = да́ |соотв=дать
  -- davatqsja_V = mkV imperfective intransitive "даваться" ;  ---- гл ru 13b-ся |основа=дава́ |основа1=да |соотв=даться
  -- datq_V = mkV perfective transitive "дать" "дам" "даст" ;  ---- △ b/c'
  -- dvigatqsja_V = mkV imperfective intransitive "двигаться" ;  ---- гл ru 6a-т-ся |основа=дви́г |основа1=дви́ж |hide-text=1
  dvinutqsja_V = mkV perfective intransitive "двинуться" "двинусь" "двинется" ;
  -- dejstvovatq_V = mkV imperfective transitive "действовать" ;  ---- гл ru 2a |основа=де́йствова |основа1=де́йству |НП=1 |соотв=-
  delatq_V = mkV imperfective transitive "делать" "делаю" "делает" ;
  delatqsja_V = mkV imperfective intransitive "делаться" "делаюсь" "делается" ;
  delitqsja_V = mkV imperfective intransitive "делиться" "делюсь" "делится" ;
  -- demonstrirovatq_V = mkV imperfective transitive "демонстрировать" ;  ---- гл ru 2a |основа = демонстри́рова |основа1 = демонстри́ру |соотв=продемонстрировать
  derzhatq_V = mkV imperfective transitive "держать" "держу" "держит" ;
  derzhatqsja_V = mkV imperfective intransitive "держаться" "держусь" "держится" ;
  dlitqsja_V = mkV imperfective intransitive "длиться" "длюсь" "длится" ;
  dobavitq_V = mkV perfective transitive "добавить" "добавлю" "добавит" ;
  dobavljatq_V = mkV imperfective transitive "добавлять" "добавляю" "добавляет" ;
  dobivatqsja_V = mkV imperfective intransitive "добиваться" "добиваюсь" "добивается" ;
  dobitqsja_V = mkV perfective intransitive "добиться" "добьюсь" "добьётся" ;
  -- dobratqsja_V = mkV perfective intransitive "добраться" ;  ---- гл ru 6°b/c-сяСВ |основа=добр |основа1=добер |соотв=добираться
  doverjatq_V = mkV imperfective transitive "доверять" "доверяю" "доверяет" ;
  dovesti_V = mkV perfective transitive "довести" "доведу" "доведёт" ;
  dogadatqsja_V = mkV perfective intransitive "догадаться" "догадаюсь" "догадается" ;
  dogadyvatqsja_V = mkV imperfective intransitive "догадываться" "догадываюсь" "догадывается" ;
  dogovoritqsja_V = mkV perfective intransitive "договориться" "договорюсь" "договорится" ;
  dozhdatqsja_V = mkV perfective intransitive "дождаться" "дождусь" "дождётся" ;
  dozhidatqsja_V = mkV imperfective intransitive "дожидаться" "дожидаюсь" "дожидается" ;
  -- dojti_V = mkV perfective transitive "дойти" "дойду" "дойдёт" ;  ---- св нп △ b/b
  -- dokazatq_V = mkV perfective transitive "доказать" ;  ---- гл ru 6cСВ |основа=доказ |основа1=докаж |основа3=дока́з |основа2=дока́ж |соотв=доказывать
  dokazyvatq_V = mkV imperfective transitive "доказывать" "доказываю" "доказывает" ;
  dolozhitq_V = mkV perfective transitive "доложить" "доложу" "доложит" ;
  dopuskatq_V = mkV imperfective transitive "допускать" "допускаю" "допускает" ;
  -- dopustitq_V = mkV perfective transitive "допустить" ;  ---- гл ru 4c-тСВ |основа=допуст |основа1=допу́ст |основа2=допущ |основа3=допу́ще |соотв=допускать
  -- dostavatq_V = mkV imperfective transitive "доставать" ;  ---- гл ru 13b |основа=достава́ |основа1=доста |соотв=достать
  dostavitq_V = mkV perfective transitive "доставить" "доставлю" "доставит" ;
  dostatq_V = mkV perfective transitive "достать" "достану" "достанет" ;
  dostatqsja_V = mkV perfective intransitive "достаться" "достанусь" "достанется" ;
  dostigatq_V = mkV imperfective transitive "достигать" "достигаю" "достигает" ;
  dostignutq_V = mkV perfective transitive "достигнуть" "достигну" "достигнет" ;
  -- dohoditq_V = mkV imperfective transitive "доходить" ;  ---- гл ru 4c-т |основа=доход |основа1=дохо́д |основа2=дохож |НП=1
  drozhatq_V = mkV imperfective transitive "дрожать" "дрожу" "дрожит" ;
  druzhitq_V = mkV imperfective transitive "дружить" "дружу" "дружит" ;
  dumatq_V = mkV imperfective transitive "думать" "думаю" "думает" ;
  dyshatq_V = mkV imperfective transitive "дышать" "дышу" "дышит" ;
  -- ezditq_V = mkV imperfective transitive "ездить" ;  ---- гл ru 4a-т2 |основа=е́зд |основа1=е́зж |НП=1 |соотв=поездить
  -- estq_V = mkV imperfective transitive "есть" "ем" "ест" ;  ----- нсв △b
  -- ehatq_V = mkV imperfective transitive "ехать" ;  ---- гл ru ^a-ех |основа=е́ха |основа1=е́д |НП=1 |соотв=- |коммент=Литературных форм повелительного наклонения нет, вместо них могут использоваться формы ''[[поезжать|поезжа́й(те)]], [[съездить|съе́зди(те)]], (не) [[ездить|е́зди(те)]]''; в разговорной речи широко распространена форма ''езжа́й(те)''; формы ''е́хай(те), едь(те)'' присущи просторечию. Встречается также устаревшая форма деепричастия ''е́дучи''. |imper-1p=1
  zhaletq_V = mkV imperfective transitive "жалеть" "жалею" "жалеет" ;
  -- zhalovatqsja_V = mkV imperfective intransitive "жаловаться" ;  ---- гл ru 2a-ся |основа=жа́лова |основа1=жа́лу |соотв=пожаловаться
  zhdatq_V = mkV imperfective transitive "ждать" "жду" "ждёт" ;
  zhelatq_V = mkV imperfective transitive "желать" "желаю" "желает" ;
  zhenitqsja_V = mkV imperfective intransitive "жениться" "женюсь" "женится" ;
  zhitq_V = mkV imperfective transitive "жить" "живу" "живёт" ;
  zaboletq_V = mkV perfective transitive "заболеть" "заболею" "заболеет" ;
  -- zabotitqsja_V = mkV imperfective intransitive "заботиться" ;  ---- гл ru 4a-т-ся |основа=забо́т |основа1=забо́ч |соотв=позаботиться
  -- zabratq_V = mkV perfective transitive "забрать" ;  ---- гл ru 6°b/cСВ |основа=забр |основа1=забер |основа2=за́бр |соотв=забирать
  zabyvatq_V = mkV imperfective transitive "забывать" "забываю" "забывает" ;
  -- zabytq_V = mkV perfective transitive "забыть" ;  ---- гл ru ^a-бытьСВ |основа=забы́ |основа1=забу́д |соотв=забывать
  zavershitq_V = mkV perfective transitive "завершить" "завершу" "завершит" ;
  zavesti_V = mkV perfective transitive "завести" "заведу" "заведёт" ;
  -- zavisetq_V = mkV imperfective transitive "зависеть" ;  ---- гл ru 5a-т |основа=зави́с |основа1=зави́ш |НП=1 |соотв=-
  zagljadyvatq_V = mkV imperfective transitive "заглядывать" "заглядываю" "заглядывает" ;
  zagljanutq_V = mkV perfective transitive "заглянуть" "загляну" "заглянет" ;
  zagovoritq_V = mkV perfective transitive "заговорить" "заговорю" "заговорит" ;
  -- zadavatq_V = mkV imperfective transitive "задавать" ;  ---- гл ru 13b |основа=задава́ |основа1=зада |НП= |соотв=задать
  -- zadatq_V = mkV perfective transitive "задать" "задам" "задаст" ;
  zaderzhatq_V = mkV perfective transitive "задержать" "задержу" "задержит" ;
  zadumatqsja_V = mkV perfective intransitive "задуматься" "задумаюсь" "задумается" ;
  zadumyvatqsja_V = mkV imperfective intransitive "задумываться" "задумываюсь" "задумывается" ;
  -- zainteresovatq_V = mkV perfective transitive "заинтересовать" ;  ---- гл ru 2aСВ |основа=заинтересова́ |основа1=заинтересу́ |основа2=заинтересо́ва |соотв=заинтересовывать
  -- zajti_V = mkV perfective transitive "зайти" "зайду" "зайдёт" ;
  -- zakazatq_V = mkV perfective transitive "заказать" ;  ---- гл ru 6cСВ |основа=заказ |основа1=закаж |основа2=зака́ж |основа3=зака́з |соотв=заказывать
  zakanchivatqsja_V = mkV imperfective intransitive "заканчиваться" "заканчиваюсь" "заканчивается" ;
  -- zakljuchatqsja_V = mkV imperfective transitive "заключаться" ;  ---- гл ru -сяНСВ |основа= |соотв=
  zakljuchitq_V = mkV perfective transitive "заключить" "заключу" "заключит" ;
  zakonchitq_V = mkV perfective transitive "закончить" "закончу" "закончит" ;
  zakonchitqsja_V = mkV perfective intransitive "закончиться" "закончусь" "закончится" ;
  zakrichatq_V = mkV perfective transitive "закричать" "закричу" "закричит" ;
  zakryvatq_V = mkV imperfective transitive "закрывать" "закрываю" "закрывает" ;
  -- zakrytq_V = mkV perfective transitive "закрыть" ;  ---- гл ru 12aСВ |основа=закры́ |основа1=закро́ |соотв=закрывать
  zakuritq_V = mkV perfective transitive "закурить" "закурю" "закурит" ;
  zalozhitq_V = mkV perfective transitive "заложить" "заложу" "заложит" ;
  zamenitq_V = mkV perfective transitive "заменить" "заменю" "заменит" ;
  -- zameretq_V = mkV perfective transitive "замереть" ;  ---- гл ru 9b/c(1)СВ |основа=замер |основа1=замр |основа2=за́мер |основа3=за́ме́р |НП=1 |соотв=замирать
  -- zametitq_V = mkV perfective transitive "заметить" ;  ---- гл ru 4a-т-ьСВ |основа=заме́т |основа1=заме́ч |соотв=замеча́ть |коммент=Устаревшая форма деепричастия — ''[[заметя|заме́тя]]''.
  zamechatq_V = mkV imperfective transitive "замечать" "замечаю" "замечает" ;
  zamolchatq_V = mkV perfective transitive "замолчать" "замолчу" "замолчит" ;
  zanimatq_V = mkV imperfective transitive "занимать" "занимаю" "занимает" ;
  zanimatqsja_V = mkV imperfective intransitive "заниматься" "занимаюсь" "занимается" ;
  zanjatq_V = mkV perfective transitive "занять" "займу" "займёт" ;
  -- zanjatqsja_V = mkV perfective intransitive "заняться" ;  ---- гл ru 14b/b^-сяСВ |основа=заня́ |основа1=заня |основа2=займ |соотв=заниматься
  -- zapisatq_V = mkV perfective transitive "записать" ;  ---- гл ru 6cСВ |основа=запис |основа1=запиш |основа2=запи́ш |основа3=запи́с |соотв=записывать
  zapisyvatq_V = mkV imperfective transitive "записывать" "записываю" "записывает" ;
  -- zaplakatq_V = mkV perfective transitive "заплакать" ;  ---- гл ru 6a-тСВ |основа=запла́к |основа1=запла́ч |соотв=плакать
  -- zaplatitq_V = mkV perfective transitive "заплатить" ;  ---- гл ru 4c-тСВ |основа=заплат |основа1=запла́т |основа2=заплач |основа3=запла́че |соотв=платить
  zapolnitq_V = mkV perfective transitive "заполнить" "заполню" "заполнит" ;
  zapomnitq_V = mkV perfective transitive "запомнить" "запомню" "запомнит" ;
  -- zapretitq_V = mkV perfective transitive "запретить" ;  ---- гл ru 4b-тСВ |основа=запрет |основа1=запрещ |соотв=запрещать
  zarabatyvatq_V = mkV imperfective transitive "зарабатывать" "зарабатываю" "зарабатывает" ;
  zarabotatq_V = mkV perfective transitive "заработать" "заработаю" "заработает" ;
  -- zaregistrirovatq_V = mkV perfective transitive "зарегистрировать" ;  ---- гл ru 2aСВ |основа=зарегистри́рова |основа1=зарегистри́ру |2в= |НП= |соотв=регистрировать
  zasluzhitq_V = mkV perfective transitive "заслужить" "заслужу" "заслужит" ;
  zasmejatqsja_V = mkV perfective intransitive "засмеяться" "засмеюсь" "засмеётся" ;
  zasnutq_V = mkV perfective transitive "заснуть" "засну" "заснёт" ;
  zastavitq_V = mkV perfective transitive "заставить" "заставлю" "заставит" ;
  zastavljatq_V = mkV imperfective transitive "заставлять" "заставляю" "заставляет" ;
  -- zahvatitq_V = mkV perfective transitive "захватить" ;  ---- гл ru 4c-тСВ |основа=захват |основа1=захва́т |основа2=захвач |основа3=захва́че |соотв=захватывать
  -- zahoditq_V = mkV imperfective transitive "заходить" ;  ---- гл ru 4c-т |основа=заход |основа1=захо́д |основа2=захож |НП=1 |соотв=зайти
  -- zahotetq_V = mkV perfective transitive "захотеть" ;  ---- гл ru 5c'^-тСВ |основа=захот |основа2=захоч |основа1=захо́ч |соотв=хотеть |ПовелЗатрудн=1 |ПричСтрад=—
  -- zahotetqsja_V = mkV perfective intransitive "захотеться" ;  ---- гл ru 5c'^-т-сяСВ |основа=захот |основа1=захо́ч |безличный=1 |соотв=хотеться
  -- zaszititq_V = mkV perfective transitive "защитить" ;  ---- гл ru 4b-тСВ |основа=защит |основа1=защищ |соотв=защищать
  zasziszatq_V = mkV imperfective transitive "защищать" "защищаю" "защищает" ;
  zajavitq_V = mkV perfective transitive "заявить" "заявлю" "заявит" ;
  zajavljatq_V = mkV imperfective transitive "заявлять" "заявляю" "заявляет" ;
  -- zvatq_V = mkV imperfective transitive "звать" ;  ---- гл ru 6°b/c |основа=зв |основа1=зов
  zvonitq_V = mkV imperfective transitive "звонить" "звоню" "звонит" ;
  zvuchatq_V = mkV imperfective transitive "звучать" "звучу" "звучит" ;
  -- zdravstvovatq_V = mkV imperfective transitive "здравствовать" ;  ---- гл ru 2a |основа=здра́вствова |основа1=здра́вству
  znatq_V = mkV imperfective transitive "знать" "знаю" "знает" ;
  znachitq_V = mkV imperfective transitive "значить" "значу" "значит" ;
  igratq_V = mkV imperfective transitive "играть" "играю" "играет" ;
  -- idti_V = mkV imperfective intransitive "идти" "иду" "идёт" ;  ---- нсв нп △ b/b
  izbavitqsja_V = mkV perfective intransitive "избавиться" "избавлюсь" "избавится" ;
  -- izbezhatq_V = mkV perfective transitive "избежать" ;  ---- гл ru 5b-жСВ |основа=избеж |основа1=избег |НП=1 |соотв=избегать
  -- izbratq_V = mkV perfective transitive "избрать" ;  ---- гл ru 6°b/cСВ |основа=избр |основа1=избер |основа2=и́збр |соотв=избирать
  izvinitq_V = mkV perfective transitive "извинить" "извиню" "извинит" ;
  -- izdatq_V = mkV perfective transitive "издать" "издам" "издаст" ;
  izlozhitq_V = mkV perfective transitive "изложить" "изложу" "изложит" ;
  izmenitq_V = mkV perfective transitive "изменить" "изменю" "изменит" ;
  izmenitqsja_V = mkV perfective intransitive "измениться" "изменюсь" "изменится" ;
  izobrazhatq_V = mkV imperfective transitive "изображать" "изображаю" "изображает" ;
  -- izobrazitq_V = mkV perfective transitive "изобразить" ;  ---- гл ru 4b-тСВ |основа=изобраз |основа1=изображ |2в= |НП= |соотв=изображать
  izuchatq_V = mkV imperfective transitive "изучать" "изучаю" "изучает" ;
  izuchitq_V = mkV perfective transitive "изучить" "изучу" "изучит" ;
  imetq_V = mkV imperfective transitive "иметь" "имею" "имеет" ;
  imetqsja_V = mkV imperfective intransitive "иметься" "имеюсь" "имеется" ;
  -- interesovatq_V = mkV imperfective transitive "интересовать" ;  ---- гл ru 2a |основа=интересова́ |основа1=интересу́ |соотв=заинтересовать
  -- interesovatqsja_V = mkV imperfective intransitive "интересоваться" ;  ---- гл ru 2a-ся |основа=интересова́ |основа1=интересу́ |соотв=заинтересоваться
  -- iskatq_V = mkV imperfective transitive "искать" ;  ---- гл ru 6c |основа=иск |основа1=ищ |основа2=и́щ |основа3=и́ск |ПричСтрад=иско́мый |соотв=[[отыскать]], [[поискать]]
  iskljuchitq_V = mkV perfective transitive "исключить" "исключу" "исключит" ;
  ispolnitq_V = mkV perfective transitive "исполнить" "исполню" "исполнит" ;
  ispolnjatq_V = mkV imperfective transitive "исполнять" "исполняю" "исполняет" ;
  -- ispolqzovatq_V = mkV imperfective transitive "использовать" ;  ---- гл ru 2a |основа=испо́льзова |основа1=испо́льзу |основа2=испо́льзов |2в=1 |соотв=
  -- ispolqzovatqsja_V = mkV imperfective intransitive "использоваться" ;  ---- гл ru 2a-ся |основа=испо́льзова |основа1=испо́льзу |2в=1
  ispugatqsja_V = mkV perfective intransitive "испугаться" "испугаюсь" "испугается" ;
  ispytatq_V = mkV perfective transitive "испытать" "испытаю" "испытает" ;
  ispytyvatq_V = mkV imperfective transitive "испытывать" "испытываю" "испытывает" ;
  -- issledovatq_V = mkV imperfective transitive "исследовать" ;  ---- гл ru 2a |основа=иссле́дова |основа1=иссле́ду |основа2=иссле́дов |2в=1
  -- ishoditq_V = mkV perfective transitive "исходить" ;  ---- гл ru 4c-тСВ |основа=исход |основа1=исхо́д |основа2=исхож |основа3=исхо́же |соотв=исхаживать
  ischezatq_V = mkV imperfective transitive "исчезать" "исчезаю" "исчезает" ;
  ischeznutq_V = mkV perfective transitive "исчезнуть" "исчезну" "исчезнет" ;
  -- kazatqsja_V = mkV imperfective intransitive "казаться" ;  ---- гл ru 6c-ся |основа=каз |основа1=каж |основа2=ка́ж |соотв=показаться
  kasatqsja_V = mkV imperfective intransitive "касаться" "касаюсь" "касается" ;
  kivatq_V = mkV imperfective transitive "кивать" "киваю" "кивает" ;
  kivnutq_V = mkV perfective transitive "кивнуть" "кивну" "кивнёт" ;
  kinutqsja_V = mkV perfective intransitive "кинуться" "кинусь" "кинется" ;
  klastq_V = mkV imperfective transitive "класть" "кладу" "кладёт" ;
  -- komandovatq_V = mkV imperfective transitive "командовать" ;  ---- гл ru 2a |основа = кома́ндова |основа1 =кома́нду |НП=!
  -- kontrolirovatq_V = mkV imperfective transitive "контролировать" ;  ---- гл ru 2a | основа = контроли́рова | основа1 = контроли́ру
  konchatqsja_V = mkV imperfective intransitive "кончаться" "кончаюсь" "кончается" ;
  konchitq_V = mkV perfective transitive "кончить" "кончу" "кончит" ;
  konchitqsja_V = mkV perfective intransitive "кончиться" "кончусь" "кончится" ;
  kormitq_V = mkV imperfective transitive "кормить" "кормлю" "кормит" ;
  kosnutqsja_V = mkV perfective intransitive "коснуться" "коснусь" "коснётся" ;
  kriknutq_V = mkV perfective transitive "крикнуть" "крикну" "крикнет" ;
  krichatq_V = mkV imperfective transitive "кричать" "кричу" "кричит" ;
  -- krutitq_V = mkV imperfective transitive "крутить" ;  ---- гл ru 4c-т |основа=крут |основа2=круч |основа3=кру́ч |основа1=кру́т |соотв-мн=[[скрутить]], [[закрутить]]
  kupitq_V = mkV perfective transitive "купить" "куплю" "купит" ;
  kuritq_V = mkV imperfective transitive "курить" "курю" "курит" ;
  lezhatq_V = mkV imperfective transitive "лежать" "лежу" "лежит" ;
  leztq_V = mkV imperfective transitive "лезть" "лезу" "лезет" ;
  letatq_V = mkV imperfective transitive "летать" "летаю" "летает" ;
  -- letetq_V = mkV imperfective transitive "лететь" ;  ---- гл ru 5b-т |основа=лет |основа1=леч |НП=1 |дореф=летѣть |imper-1p=1
  lechitq_V = mkV imperfective transitive "лечить" "лечу" "лечит" ;
  -- lechq_V = mkV perfective transitive "лечь" ;  ---- гл ru 8a/bСВ |основа=ле |основа1=ля́ |основа2=лё |НП=1 |соотв=ложиться
  lishitq_V = mkV perfective transitive "лишить" "лишу" "лишит" ;
  lovitq_V = mkV imperfective transitive "ловить" "ловлю" "ловит" ;
  lozhitqsja_V = mkV imperfective intransitive "ложиться" "ложусь" "ложится" ;
  lomatq_V = mkV imperfective transitive "ломать" "ломаю" "ломает" ;
  ljubitq_V = mkV imperfective transitive "любить" "люблю" "любит" ;
  mahnutq_V = mkV perfective transitive "махнуть" "махну" "махнёт" ;
  menjatq_V = mkV imperfective transitive "менять" "меняю" "меняет" ;
  menjatqsja_V = mkV imperfective intransitive "меняться" "меняюсь" "меняется" ;
  mechtatq_V = mkV imperfective transitive "мечтать" "мечтаю" "мечтает" ;
  meshatq_V = mkV imperfective transitive "мешать" "мешаю" "мешает" ;
  -- minovatq_V = mkV imperfective transitive "миновать" ;  ---- гл ru 2aX |основа=минова́ |основа1=мину́ |2в=1
  molitqsja_V = mkV imperfective intransitive "молиться" "молюсь" "молится" ;
  molchatq_V = mkV imperfective transitive "молчать" "молчу" "молчит" ;
  mochq_V = mkV imperfective transitive "мочь" "могу" "может" ;
  muchitq_V = mkV imperfective transitive "мучить" "мучу" "мучит" ;
  -- mytq_V = mkV imperfective transitive "мыть" ;  ---- гл ru 12a-ы |основа=мы́ |основа1=мо́ |соотв=без ссылок|приставочные типа [[вымыть]], [[отмыть]] и [[помыть]]
  nabiratq_V = mkV imperfective transitive "набирать" "набираю" "набирает" ;
  nabljudatq_V = mkV imperfective transitive "наблюдать" "наблюдаю" "наблюдает" ;
  nabljudatqsja_V = mkV imperfective intransitive "наблюдаться" "наблюдаюсь" "наблюдается" ;
  -- nabratq_V = mkV perfective transitive "набрать" ;  ---- гл ru 6°b/cСВ |основа=набр |основа2=на́бр |основа1=набер |соотв=набирать
  nadetq_V = mkV perfective transitive "надеть" "надену" "наденет" ;
  nadejatqsja_V = mkV imperfective intransitive "надеяться" "надеюсь" "надеется" ;
  -- nadoestq_V = mkV perfective transitive "надоесть" "надоем" "надоест" ;  ---- св нп △b
  -- nazvatq_V = mkV perfective transitive "назвать" ;  ---- гл ru 6°b/cСВ |основа=назв |основа1=назов |основа2=на́зв |соотв=называть
  naznachitq_V = mkV perfective transitive "назначить" "назначу" "назначит" ;
  nazyvatq_V = mkV imperfective transitive "называть" "называю" "называет" ;
  nazyvatqsja_V = mkV imperfective intransitive "называться" "называюсь" "называется" ;
  -- najti_V = mkV perfective transitive "найти" "найду" "найдёт" ;  ---- св △ b/b⑨
  -- najtisq_V = mkV perfective intransitive "найтись" "найдусь" "найдётся" ;
  nalitq_V = mkV perfective transitive "налить" "налью" "нальёт" ;
  nanesti_V = mkV perfective transitive "нанести" "нанесу" "нанесёт" ;
  napechatatq_V = mkV perfective transitive "напечатать" "напечатаю" "напечатает" ;
  -- napisatq_V = mkV perfective transitive "написать" ;  ---- гл ru 6cСВ |основа=напис |основа1=напиш |основа2=напи́ш |основа3=напи́с |соотв=[[писать|писа́ть]]
  napolnitq_V = mkV perfective transitive "наполнить" "наполню" "наполнит" ;
  napominatq_V = mkV imperfective transitive "напоминать" "напоминаю" "напоминает" ;
  napomnitq_V = mkV perfective transitive "напомнить" "напомню" "напомнит" ;
  napravitq_V = mkV perfective transitive "направить" "направлю" "направит" ;
  napravitqsja_V = mkV perfective intransitive "направиться" "направлюсь" "направится" ;
  -- narisovatq_V = mkV perfective transitive "нарисовать" ;  ---- гл ru 2aСВ |основа=нарисова́ |основа1=нарису́ |основа2=нарисо́ва |соотв=рисовать
  narushatq_V = mkV imperfective transitive "нарушать" "нарушаю" "нарушает" ;
  narushitq_V = mkV perfective transitive "нарушить" "нарушу" "нарушит" ;
  nastaivatq_V = mkV imperfective transitive "настаивать" "настаиваю" "настаивает" ;
  nastupatq_V = mkV imperfective transitive "наступать" "наступаю" "наступает" ;
  nastupitq_V = mkV perfective transitive "наступить" "наступлю" "наступит" ;
  nauchitq_V = mkV perfective transitive "научить" "научу" "научит" ;
  nauchitqsja_V = mkV perfective intransitive "научиться" "научусь" "научится" ;
  -- nahoditq_V = mkV imperfective transitive "находить" ;  ---- гл ru 4c-т |основа=наход |основа1=нахо́д |основа2=нахож |соотв=найти
  -- nahoditqsja_V = mkV imperfective intransitive "находиться" ;  ---- гл ru 4c-т-ся |основа=наход |основа1=нахо́д |основа2=нахож
  nachatq_V = mkV perfective transitive "начать" "начну" "начнёт" ;
  nachatqsja_V = mkV perfective intransitive "начаться" "начнусь" "начнётся" ;
  nachinatq_V = mkV imperfective transitive "начинать" "начинаю" "начинает" ;
  nachinatqsja_V = mkV imperfective intransitive "начинаться" "начинаюсь" "начинается" ;
  -- nenavidetq_V = mkV imperfective transitive "ненавидеть" ;  ---- гл ru 5a-тX |основа=ненави́д |основа1=ненави́ж
  nesti_V = mkV imperfective transitive "нести" "несу" "несёт" ;
  -- nositq_V = mkV imperfective transitive "носить" ;  ---- гл ru 4c-т |основа=нос |основа1=но́с |основа2=нош |основа3=но́ш |соотв=без ссылок|приставочные типа [[сносить]], [[износить]], [[наносить]], [[относить]]
  nravitqsja_V = mkV imperfective intransitive "нравиться" "нравлюсь" "нравится" ;
  nuzhdatqsja_V = mkV imperfective intransitive "нуждаться" "нуждаюсь" "нуждается" ;
  obernutqsja_V = mkV perfective intransitive "обернуться" "обернусь" "обернётся" ;
  obespechivatq_V = mkV imperfective transitive "обеспечивать" "обеспечиваю" "обеспечивает" ;
  obespechitq_V = mkV perfective transitive "обеспечить" "обеспечу" "обеспечит" ;
  obeszatq_V = mkV imperfective transitive "обещать" "обещаю" "обещает" ;
  -- obidetq_V = mkV perfective transitive "обидеть" ;  ---- гл ru 5a^-дСВ |основа=оби́д |основа1=оби́ж |соотв=обижать
  -- obidetqsja_V = mkV perfective intransitive "обидеться" ;  ---- гл ru 5a-т-сяСВ |основа=оби́д |основа1=оби́ж |соотв=обижа́ться
  obladatq_V = mkV imperfective transitive "обладать" "обладаю" "обладает" ;
  obmanutq_V = mkV perfective transitive "обмануть" "обману" "обманет" ;
  obnaruzhitq_V = mkV perfective transitive "обнаружить" "обнаружу" "обнаружит" ;
  -- obnjatq_V = mkV perfective transitive "обнять" ;  ---- гл ru 14c/c((1))СВ |основа=обня́ |основа1=о́бня́ |основа2=обня |основа3=обним |основа4=обни́м |основа5=о́бня |соотв=обнимать
  oboznachitq_V = mkV perfective transitive "обозначить" "обозначу" "обозначит" ;
  -- obojti_V = mkV perfective transitive "обойти" "обойду" "обойдёт" ;
  -- obojtisq_V = mkV perfective intransitive "обойтись" "обойдусь" "обойдётся" ;
  -- obradovatqsja_V = mkV perfective intransitive "обрадоваться" ;  ---- гл ru 2a-сяСВ |основа=обра́дова |основа1=обра́ду |соотв=радоваться
  -- obrazovatqsja_V = mkV perfective intransitive "образоваться" ;  ---- гл ru 2a-сяСВ |основа=образова́ |основа1=образу́ |соотв=образовываться
  obrazovyvatq_V = mkV imperfective transitive "образовывать" "образовываю" "образовывает" ;
  -- obratitq_V = mkV perfective transitive "обратить" ;  ---- гл ru 4b-тСВ |основа=обрат |основа1=обращ |соотв=обращать
  -- obratitqsja_V = mkV perfective intransitive "обратиться" ;  ---- гл ru 4b-т-сяСВ |основа=обрат |основа1=обращ |соотв=обращаться
  obraszatq_V = mkV imperfective transitive "обращать" "обращаю" "обращает" ;
  obraszatqsja_V = mkV imperfective intransitive "обращаться" "обращаюсь" "обращается" ;
  obresti_V = mkV perfective transitive "обрести" "обрету" "обретёт" ;
  -- obsuditq_V = mkV perfective transitive "обсудить" ;  ---- гл ru 4c(7)-тСВ |основа=обсуд |основа1=обсу́д |основа2=обсуж |основа3=обсужд |соотв=обсуждать
  obsuzhdatq_V = mkV imperfective transitive "обсуждать" "обсуждаю" "обсуждает" ;
  obsuzhdatqsja_V = mkV imperfective intransitive "обсуждаться" "обсуждаюсь" "обсуждается" ;
  obuslovitq_V = mkV perfective transitive "обусловить" "обусловлю" "обусловит" ;
  obszatqsja_V = mkV imperfective intransitive "общаться" "общаюсь" "общается" ;
  ob6edinitq_V = mkV perfective transitive "объединить" "объединю" "объединит" ;
  ob6javitq_V = mkV perfective transitive "объявить" "объявлю" "объявит" ;
  ob6jasnitq_V = mkV perfective transitive "объяснить" "объясню" "объяснит" ;
  ob6jasnjatq_V = mkV imperfective transitive "объяснять" "объясняю" "объясняет" ;
  ob6jasnjatqsja_V = mkV imperfective intransitive "объясняться" "объясняюсь" "объясняется" ;
  -- objazatq_V = mkV perfective transitive "обязать" ;  ---- гл ru 6cСВ |основа=обяз |основа1=обяж |основа2=обя́ж |основа3=обя́з |соотв=обязывать
  ogljadyvatqsja_V = mkV imperfective intransitive "оглядываться" "оглядываюсь" "оглядывается" ;
  ogljanutqsja_V = mkV perfective intransitive "оглянуться" "оглянусь" "оглянется" ;
  ogranichitq_V = mkV perfective transitive "ограничить" "ограничу" "ограничит" ;
  odetq_V = mkV perfective transitive "одеть" "одену" "оденет" ;
  ozhidatq_V = mkV imperfective transitive "ожидать" "ожидаю" "ожидает" ;
  oznachatq_V = mkV imperfective transitive "означать" "означаю" "означает" ;
  -- okazatq_V = mkV perfective transitive "оказать" ;  ---- гл ru 6cСВ |основа=оказ |основа1=окаж |основа2=ока́ж |основа3=ока́з |НП= |соотв=оказывать
  -- okazatqsja_V = mkV perfective intransitive "оказаться" ;  ---- гл ru 6c-т-сяСВ |основа=оказ |основа1=окаж |основа2=ока́ж |соотв=ока́зываться
  okazyvatq_V = mkV imperfective transitive "оказывать" "оказываю" "оказывает" ;
  okazyvatqsja_V = mkV imperfective intransitive "оказываться" "оказываюсь" "оказывается" ;
  okonchitq_V = mkV perfective transitive "окончить" "окончу" "окончит" ;
  okruzhatq_V = mkV imperfective transitive "окружать" "окружаю" "окружает" ;
  okruzhitq_V = mkV perfective transitive "окружить" "окружу" "окружит" ;
  opasatqsja_V = mkV imperfective intransitive "опасаться" "опасаюсь" "опасается" ;
  opiratqsja_V = mkV imperfective intransitive "опираться" "опираюсь" "опирается" ;
  -- opisatq_V = mkV perfective transitive "описать" ;  ---- гл ru 6cСВ |основа=опис |основа1=опиш |основа2=опи́ш |основа3=опи́с |соотв=описывать
  opisyvatq_V = mkV imperfective transitive "описывать" "описываю" "описывает" ;
  opredelitq_V = mkV perfective transitive "определить" "определю" "определит" ;
  opredeljatq_V = mkV imperfective transitive "определять" "определяю" "определяет" ;
  opredeljatqsja_V = mkV imperfective intransitive "определяться" "определяюсь" "определяется" ;
  -- opublikovatq_V = mkV perfective transitive "опубликовать" ;  ---- гл ru 2aСВ |основа=опубликова́ |основа1=опублику́ |2в= |НП= |соотв=опублико́вывать
  -- opustitq_V = mkV perfective transitive "опустить" ;  ---- гл ru 4c-тСВ |основа=опуст |основа1=опу́ст |основа2=опущ |основа3=опу́ще |соотв=опускать
  -- opustitqsja_V = mkV perfective intransitive "опуститься" ;  ---- гл ru 4c-т-сяСВ |основа=опуст |основа1=опущ |основа2=опу́ст |соотв=опускаться
  oratq_V = mkV imperfective transitive "орать" "ору" "орёт" ;
  -- organizovatq_V = mkV imperfective transitive "организовать" ;  ---- гл ru 2a |основа=организова́ |основа1=организу́ |основа2=организо́в |2в=1
  -- osvetitq_V = mkV perfective transitive "осветить" ;  ---- гл ru 4b-тСВ |основа=освет |основа1=освещ |НП= |соотв=освещать
  -- osvoboditq_V = mkV perfective transitive "освободить" ;  ---- гл ru 4b-тСВ |основа=освобод |основа1=освобож |основа2=освобожд |соотв=освобождать
  -- osnovatq_V = mkV perfective transitive "основать" ;  ---- гл ru 2bСВ |основа=основ |основа1=осну |основа2=осну́ |основа3=осно́в |соотв=основывать
  -- ostavatqsja_V = mkV imperfective intransitive "оставаться" ;  ---- гл ru 13b-ся |основа=остава́ |основа1=оста |соотв=остаться
  ostavitq_V = mkV perfective transitive "оставить" "оставлю" "оставит" ;
  ostavljatq_V = mkV imperfective transitive "оставлять" "оставляю" "оставляет" ;
  ostanavlivatqsja_V = mkV imperfective intransitive "останавливаться" "останавливаюсь" "останавливается" ;
  ostanovitq_V = mkV perfective transitive "остановить" "остановлю" "остановит" ;
  ostanovitqsja_V = mkV perfective intransitive "остановиться" "остановлюсь" "остановится" ;
  ostatqsja_V = mkV perfective intransitive "остаться" "останусь" "останется" ;
  -- osuszestvitq_V = mkV perfective transitive "осуществить" ;  ---- гл ru 4b-лСВ |основа=осуществ |основа1=осуществ |соотв=осуществлять
  osuszestvljatq_V = mkV imperfective transitive "осуществлять" "осуществляю" "осуществляет" ;
  osuszestvljatqsja_V = mkV imperfective intransitive "осуществляться" "осуществляюсь" "осуществляется" ;
  otvernutqsja_V = mkV perfective intransitive "отвернуться" "отвернусь" "отвернётся" ;
  otvesti_V = mkV perfective transitive "отвести" "отведу" "отведёт" ;
  -- otvetitq_V = mkV perfective transitive "ответить" ;  ---- гл ru 4a-т-ьСВ |основа=отве́т |основа1=отве́ч |соотв=отвечать |НП=1
  otvechatq_V = mkV imperfective transitive "отвечать" "отвечаю" "отвечает" ;
  -- otdavatq_V = mkV imperfective transitive "отдавать" ;  ---- гл ru 13b |основа=отдава́ |основа1=отда |соотв=отдать
  -- otdatq_V = mkV perfective transitive "отдать" "отдам" "отдаст" ;
  otdohnutq_V = mkV perfective transitive "отдохнуть" "отдохну" "отдохнёт" ;
  otdyhatq_V = mkV imperfective transitive "отдыхать" "отдыхаю" "отдыхает" ;
  -- otkazatq_V = mkV perfective transitive "отказать" ;  ---- гл ru 6cСВ |основа=отказ |основа1=откаж |основа2=отка́ж |основа3=отка́з |соотв=отказывать |НП=
  -- otkazatqsja_V = mkV perfective intransitive "отказаться" ;  ---- гл ru 6c-т-сяСВ |основа=отказ |основа1=откаж |основа2=отка́ж |соотв=отказываться
  otkazyvatqsja_V = mkV imperfective intransitive "отказываться" "отказываюсь" "отказывается" ;
  otkryvatq_V = mkV imperfective transitive "открывать" "открываю" "открывает" ;
  otkryvatqsja_V = mkV imperfective intransitive "открываться" "открываюсь" "открывается" ;
  -- otkrytq_V = mkV perfective transitive "открыть" ;  ---- гл ru 12aСВ |основа=откры́ |основа1=откро́ |соотв=открывать
  -- otkrytqsja_V = mkV perfective intransitive "открыться" ;  ---- гл ru 12a-сяСВ |основа=откры́ |основа1=откро́ |соотв=открываться
  otlichatqsja_V = mkV imperfective intransitive "отличаться" "отличаюсь" "отличается" ;
  otlozhitq_V = mkV perfective transitive "отложить" "отложу" "отложит" ;
  otmenitq_V = mkV perfective transitive "отменить" "отменю" "отменит" ;
  -- otmetitq_V = mkV perfective transitive "отметить" ;  ---- гл ru 4a-т-ьСВ |основа=отме́т |основа1=отме́ч |соотв=отмечать
  otmechatq_V = mkV imperfective transitive "отмечать" "отмечаю" "отмечает" ;
  otmechatqsja_V = mkV imperfective intransitive "отмечаться" "отмечаюсь" "отмечается" ;
  otnesti_V = mkV perfective transitive "отнести" "отнесу" "отнесёт" ;
  -- otnositqsja_V = mkV imperfective intransitive "относиться" ;  ---- гл ru 4c-т-ся |основа=относ |основа1=отно́с |основа2=отнош |соотв=отнестись
  -- otobratq_V = mkV perfective transitive "отобрать" ;  ---- гл ru 6°*b/c^СВ |основа=отобр |основа1=отбер |основа2=ото́бр |соотв=отбирать
  -- otozvatqsja_V = mkV perfective intransitive "отозваться" ;  ---- гл ru 6°b/c-сяСВ |основа=отозв |основа1=отзов |соотв=отзываться
  -- otojti_V = mkV perfective transitive "отойти" "отойду" "отойдёт" ;
  otorvatq_V = mkV perfective transitive "оторвать" "оторву" "оторвёт" ;
  otpravitq_V = mkV perfective transitive "отправить" "отправлю" "отправит" ;
  otpravitqsja_V = mkV perfective intransitive "отправиться" "отправлюсь" "отправится" ;
  otpravljatqsja_V = mkV imperfective intransitive "отправляться" "отправляюсь" "отправляется" ;
  -- otpustitq_V = mkV perfective transitive "отпустить" ;  ---- гл ru 4c-тСВ |основа=отпуст |основа1=отпу́ст |основа2=отпущ |основа3=отпу́ще |соотв=отпускать
  otrazhatq_V = mkV imperfective transitive "отражать" "отражаю" "отражает" ;
  -- otrezatq_V = mkV perfective transitive "отрезать" ;  ---- гл ru 6a-тСВ |основа=отре́з |основа1=отре́ж |соотв=[[отрезать#отреза́ть|отреза́ть]]
  -- otsutstvovatq_V = mkV imperfective transitive "отсутствовать" ;  ---- гл ru 2a |основа=отсу́тствова |основа1=отсу́тству |НП=1 |соотв=-
  -- oformitq_V = mkV perfective transitive "оформить" ;  ---- гл ru 4a-лСВ |основа=офо́рм |соотв=оформлять
  -- ohvatitq_V = mkV perfective transitive "охватить" ;  ---- гл ru 4c-тСВ |основа=охват |основа1=охва́т |основа2=охвач |основа3=охва́че |соотв=охватывать
  ocenivatq_V = mkV imperfective transitive "оценивать" "оцениваю" "оценивает" ;
  ocenitq_V = mkV perfective transitive "оценить" "оценю" "оценит" ;
  -- oshibitqsja_V = mkV perfective intransitive "ошибиться" "ошибусь" "ошибётся" ;  ---- св △b
  -- oszutitq_V = mkV perfective transitive "ощутить" ;  ---- гл ru 4b-тСВ |основа=ощут |основа1=ощущ |соотв=ощущать
  oszuszatq_V = mkV imperfective transitive "ощущать" "ощущаю" "ощущает" ;
  padatq_V = mkV imperfective transitive "падать" "падаю" "падает" ;
  pahnutq_V = mkV imperfective transitive "пахнуть" "пахну" "пахнет" ;
  perebitq_V = mkV perfective transitive "перебить" "перебью" "перебьёт" ;
  perevesti_V = mkV perfective transitive "перевести" "переведу" "переведёт" ;
  -- perevoditq_V = mkV imperfective transitive "переводить" ;  ---- гл ru 4c-т |основа=перевод |основа1=перево́д |основа2=перевож |соотв=перевести
  -- peredavatq_V = mkV imperfective transitive "передавать" ;  ---- гл ru 13b |основа=передава́ |основа1=переда |основа2=переда́ |соотв=передать
  -- peredatq_V = mkV perfective transitive "передать" "передам" "передаст" ;
  -- pereehatq_V = mkV perfective intransitive "переехать" ;  ---- гл ru ^a-ехСВ |основа=перее́ха |основа1=перее́д |основа2=переезжа́й |соотв=переезжать
  perezhivatq_V = mkV imperfective transitive "переживать" "переживаю" "переживает" ;
  perezhitq_V = mkV perfective transitive "пережить" "переживу" "переживёт" ;
  -- perejti_V = mkV perfective transitive "перейти" "перейду" "перейдёт" ;
  perenesti_V = mkV perfective transitive "перенести" "перенесу" "перенесёт" ;
  -- perestavatq_V = mkV imperfective transitive "переставать" ;  ---- гл ru 13b |основа=перестава́ |основа1=переста |НП=1 |соотв=перестать
  perestatq_V = mkV perfective transitive "перестать" "перестану" "перестанет" ;
  -- perehoditq_V = mkV imperfective transitive "переходить" ;  ---- гл ru 4c-т |основа = переход |основа1 = перехо́д |основа2 = перехож |соотв=перейти |ПричСтрадНет=1
  petq_V = mkV imperfective transitive "петь" "пою" "поёт" "12b";
  -- pisatq_V = mkV imperfective transitive "писать" ;  ---- гл ru 6c |основа =пис |основа1 =пиш |основа2 =пи́ш |основа3 =пи́с |ДеепрНастЗатрудн=1 |соотв=[[записать]], [[написать]]
  pitq_V = mkV imperfective transitive "пить" "пью" "пьёт" ;
  plavatq_V = mkV imperfective transitive "плавать" "плаваю" "плавает" ;
  -- plakatq_V = mkV imperfective transitive "плакать" ;  ---- гл ru 6a-т |основа=пла́к |основа1=пла́ч |НП=1 |соотв=[[заплакать]], [[поплакать]]
  -- planirovatq_V = mkV imperfective transitive "планировать" ;  ---- гл ru 2a |основа=плани́рова |основа1=плани́ру |НП=1
  -- planirovatqsja_V = mkV imperfective intransitive "планироваться" ;  ---- гл ru 2a-ся |основа=плани́рова |основа1=плани́ру |соотв=
  -- platitq_V = mkV imperfective transitive "платить" ;  ---- гл ru 4c-т |основа=плат |основа1=пла́т |основа2=плач |основа3=пла́ч |соотв=без ссылок|приставочные типа [[выплатить]], [[заплатить]]
  plytq_V = mkV imperfective transitive "плыть" "плыву" "плывёт" ;
  -- pobeditq_V = mkV perfective transitive "победить" ;  ---- гл ru 4b-тСВ |основа=побед |основа1=побеж |основа2=побежд |соотв=побеждать |Ед1лЗатрудн=1
  -- pobezhatq_V = mkV perfective transitive "побежать" ;  ---- гл ru 5b-жСВ |основа=побеж |основа1=побег |НП=1 |соотв=бежать
  pobyvatq_V = mkV perfective transitive "побывать" "побываю" "побывает" ;
  povezti_V = mkV perfective transitive "повезти" "повезу" "повезёт" ;
  poveritq_V = mkV perfective transitive "поверить" "поверю" "поверит" ;
  povernutq_V = mkV perfective transitive "повернуть" "поверну" "повернёт" ;
  povernutqsja_V = mkV perfective intransitive "повернуться" "повернусь" "повернётся" ;
  -- povesitq_V = mkV perfective transitive "повесить" ;  ---- гл ru 4a-т-ьСВ |основа=пове́с |основа1=пове́ш |соотв=вешать
  povesti_V = mkV perfective transitive "повести" "поведу" "поведёт" ;
  povtoritq_V = mkV perfective transitive "повторить" "повторю" "повторит" ;
  povtorjatq_V = mkV imperfective transitive "повторять" "повторяю" "повторяет" ;
  -- povysitq_V = mkV perfective transitive "повысить" ;  ---- гл ru 4a-т-ьСВ |основа=повы́с |основа1=повы́ш |соотв=повышать
  pogibnutq_V = mkV perfective transitive "погибнуть" "погибну" "погибнет" ;
  -- pogljadetq_V = mkV perfective transitive "поглядеть" ;  ---- гл ru 5b-тСВ |основа=погляд |основа1=погляж |ПричСтрадНет=1 |соотв=глядеть, поглядывать
  pogljadyvatq_V = mkV imperfective transitive "поглядывать" "поглядываю" "поглядывает" ;
  pogovoritq_V = mkV perfective transitive "поговорить" "поговорю" "поговорит" ;
  -- podavatq_V = mkV imperfective transitive "подавать" ;  ---- гл ru 13b |основа=подава́ |основа1=пода |соотв=подать
  podaritq_V = mkV perfective transitive "подарить" "подарю" "подарит" ;
  -- podatq_V = mkV perfective transitive "подать" "подам" "подаст" ;
  podvesti_V = mkV perfective transitive "подвести" "подведу" "подведёт" ;
  podgotovitq_V = mkV perfective transitive "подготовить" "подготовлю" "подготовит" ;
  podderzhatq_V = mkV perfective transitive "поддержать" "поддержу" "поддержит" ;
  podderzhivatq_V = mkV imperfective transitive "поддерживать" "поддерживаю" "поддерживает" ;
  podelitqsja_V = mkV perfective intransitive "поделиться" "поделюсь" "поделится" ;
  podlezhatq_V = mkV imperfective transitive "подлежать" "подлежу" "подлежит" ;
  podnimatq_V = mkV imperfective transitive "поднимать" "поднимаю" "поднимает" ;
  podnimatqsja_V = mkV imperfective intransitive "подниматься" "поднимаюсь" "поднимается" ;
  -- podnjatq_V = mkV perfective transitive "поднять" ;  ---- гл ru 14c/c((1))СВ |основа=подня́ |основа1=по́дня́ |основа2=подня |основа3=подним |основа4=подни́м |основа5=по́дня |соотв=[[поднимать]], [[подымать]]
  -- podnjatqsja_V = mkV perfective transitive "подняться" ;  ---- гл ru 14c/c"-сяСВ |основа=подня́ |основа1=подня |основа2=подним |основа3=подни́м |соотв=подниматься, подыматься
  -- podobratq_V = mkV perfective transitive "подобрать" ;  ---- гл ru 6°*b/c^СВ |основа=подобр |основа1=подбер |основа2=подо́бр |соотв=подбирать
  podozhdatq_V = mkV perfective transitive "подождать" "подожду" "подождёт" ;
  podozrevatq_V = mkV imperfective transitive "подозревать" "подозреваю" "подозревает" ;
  -- podojti_V = mkV perfective transitive "подойти" "подойду" "подойдёт" ;
  -- podpisatq_V = mkV perfective transitive "подписать" ;  ---- гл ru 6cСВ |основа=подпис |основа1=подпиш |основа3=подпи́с |основа2=подпи́ш |НП= |соотв=подписывать
  -- podtverditq_V = mkV perfective transitive "подтвердить" ;  ---- гл ru 4b-тСВ |основа=подтверд |основа1=подтверж |основа2=подтвержд |соотв=подтверждать
  podtverzhdatq_V = mkV imperfective transitive "подтверждать" "подтверждаю" "подтверждает" ;
  podumatq_V = mkV perfective transitive "подумать" "подумаю" "подумает" ;
  -- podhvatitq_V = mkV perfective transitive "подхватить" ;  ---- гл ru 4c-тСВ |основа=подхват |основа1=подхва́т |основа2=подхвач |основа3=подхва́че |соотв=подхватывать
  -- podhoditq_V = mkV imperfective transitive "подходить" ;  ---- гл ru 4c-т |основа = подход |основа1 = подхо́д |основа2 = подхож |соотв=подойти |НП=1
  podcherknutq_V = mkV perfective transitive "подчеркнуть" "подчеркну" "подчеркнёт" ;
  -- poehatq_V = mkV perfective intransitive "поехать" ;  ---- гл ru ^a-ехСВ |основа=пое́ха |основа1=пое́д |основа2=поезжа́й |НП=1 |соотв=ехать
  pozhaletq_V = mkV perfective transitive "пожалеть" "пожалею" "пожалеет" ;
  -- pozhatq_V = mkV perfective transitive "пожать" ;  ---- гл ru 14bСВ |основа=пожа́ |основа1=пожм |соотв=пожимать
  pozhelatq_V = mkV perfective transitive "пожелать" "пожелаю" "пожелает" ;
  -- pozvatq_V = mkV perfective transitive "позвать" ;  ---- гл ru 6°b/cСВ | основа = позв | основа1 = позов | основа2 = по́зв | НП = | соотв = звать
  pozvolitq_V = mkV perfective transitive "позволить" "позволю" "позволит" ;
  pozvoljatq_V = mkV imperfective transitive "позволять" "позволяю" "позволяет" ;
  pozvonitq_V = mkV perfective transitive "позвонить" "позвоню" "позвонит" ;
  pozdravljatq_V = mkV imperfective transitive "поздравлять" "поздравляю" "поздравляет" ;
  poznakomitqsja_V = mkV perfective intransitive "познакомиться" "познакомлюсь" "познакомится" ;
  -- pointeresovatqsja_V = mkV perfective intransitive "поинтересоваться" ;  ---- гл ru 2a-сяСВ |основа=поинтересова́ |основа1=поинтересу́ |соотв=интересоваться
  pojmatq_V = mkV perfective transitive "поймать" "поймаю" "поймает" ;
  -- pojti_V = mkV perfective transitive "пойти" "пойду" "пойдёт" ;
  -- pokazatq_V = mkV perfective transitive "показать" ;  ---- гл ru 6cСВ |основа=показ |основа1=покаж |основа2=пока́ж |основа3=пока́з |соотв=показывать
  -- pokazatqsja_V = mkV perfective intransitive "показаться" ;  ---- гл ru 6c-т-сяСВ |основа=показ |основа1=покаж |основа2=пока́ж |соотв=[[показываться]], [[казаться]]
  pokazyvatq_V = mkV imperfective transitive "показывать" "показываю" "показывает" ;
  pokachatq_V = mkV perfective transitive "покачать" "покачаю" "покачает" ;
  pokidatq_V = mkV imperfective transitive "покидать" "покидаю" "покидает" ;
  pokinutq_V = mkV perfective transitive "покинуть" "покину" "покинет" ;
  -- pokrytq_V = mkV perfective transitive "покрыть" ;  ---- гл ru 12aСВ |основа = покры́ |основа1 = покро́ |соотв=покрывать
  pokupatq_V = mkV imperfective transitive "покупать" "покупаю" "покупает" ;
  polagatq_V = mkV imperfective transitive "полагать" "полагаю" "полагает" ;
  polagatqsja_V = mkV imperfective intransitive "полагаться" "полагаюсь" "полагается" ;
  poleztq_V = mkV perfective transitive "полезть" "полезу" "полезет" ;
  -- poletetq_V = mkV perfective transitive "полететь" ;  ---- гл ru 5b-тСВ |основа=полет |основа1=полеч |НП=1 |соотв=лететь, летать
  polozhitq_V = mkV perfective transitive "положить" "положу" "положит" ;
  poluchatq_V = mkV imperfective transitive "получать" "получаю" "получает" ;
  poluchatqsja_V = mkV imperfective intransitive "получаться" "получаюсь" "получается" ;
  poluchitq_V = mkV perfective transitive "получить" "получу" "получит" ;
  poluchitqsja_V = mkV perfective intransitive "получиться" "получусь" "получится" ;
  -- polqzovatqsja_V = mkV imperfective intransitive "пользоваться" ;  ---- гл ru 2a-ся |основа=по́льзова |основа1=по́льзу |соотв=[[попользоваться]], [[воспользоваться]]
  poljubitq_V = mkV perfective transitive "полюбить" "полюблю" "полюбит" ;
  pomeshatq_V = mkV perfective transitive "помешать" "помешаю" "помешает" ;
  pomnitq_V = mkV imperfective transitive "помнить" "помню" "помнит" ;
  pomogatq_V = mkV imperfective transitive "помогать" "помогаю" "помогает" ;
  pomolchatq_V = mkV perfective transitive "помолчать" "помолчу" "помолчит" ;
  pomochq_V = mkV perfective transitive "помочь" "помогу" "поможет" ;
  ponadobitqsja_V = mkV perfective intransitive "понадобиться" "понадоблюсь" "понадобится" ;
  ponesti_V = mkV perfective transitive "понести" "понесу" "понесёт" ;
  ponimatq_V = mkV imperfective transitive "понимать" "понимаю" "понимает" ;
  ponravitqsja_V = mkV perfective intransitive "понравиться" "понравлюсь" "понравится" ;
  ponjatq_V = mkV perfective transitive "понять" "пойму" "поймёт" ;
  poobeszatq_V = mkV perfective transitive "пообещать" "пообещаю" "пообещает" ;
  popadatq_V = mkV perfective transitive "попадать" "попадаю" "попадает" ;
  popastq_V = mkV perfective transitive "попасть" "попаду" "попадёт" ;
  popastqsja_V = mkV perfective intransitive "попасться" "попадусь" "попадётся" ;
  -- poprobovatq_V = mkV perfective transitive "попробовать" ;  ---- гл ru 2aСВ |основа=попро́бова |основа1=попро́бу |соотв=пробовать
  -- poprositq_V = mkV perfective transitive "попросить" ;  ---- гл ru 4c-тСВ |основа = попрос |основа1 = попро́с |основа2 = попрош |основа3 = попро́ше |соотв=просить
  popytatqsja_V = mkV perfective intransitive "попытаться" "попытаюсь" "попытается" ;
  -- porazitq_V = mkV perfective transitive "поразить" ;  ---- гл ru 4b-тСВ |основа=пораз |основа1=пораж |соотв=поражать
  poruchitq_V = mkV perfective transitive "поручить" "поручу" "поручит" ;
  -- posaditq_V = mkV perfective transitive "посадить" ;  ---- гл ru 4c-тСВ |основа=посад |основа1=поса́д |основа2=посаж |основа3=поса́же |НП=
  -- posvjatitq_V = mkV perfective transitive "посвятить" ;  ---- гл ru 4b-тСВ |основа=посвят |основа1=посвящ |соотв=посвящать
  -- posetitq_V = mkV perfective transitive "посетить" ;  ---- гл ru 4b-тСВ |основа=посет |основа1=посещ |соотв=посеща́ть
  poseszatq_V = mkV imperfective transitive "посещать" "посещаю" "посещает" ;
  -- posidetq_V = mkV perfective transitive "посидеть" ;  ---- гл ru 5b-тСВ |основа=посид |основа1=посиж |НП=1
  -- poslatq_V = mkV perfective transitive "послать" ;  ---- гл ru 6b^СВ |основа=посл |основа1=пошл |основа2=по́сл |соотв=слать, посылать
  -- posledovatq_V = mkV perfective transitive "последовать" ;  ---- гл ru 2aСВ |основа=последова́ |основа1=последу́ |2в= |НП=1 |соотв=
  poslushatq_V = mkV perfective transitive "послушать" "послушаю" "послушает" ;
  poslyshatqsja_V = mkV perfective intransitive "послышаться" "послышусь" "послышится" ;
  posmotretq_V = mkV perfective transitive "посмотреть" "посмотрю" "посмотрит" ;
  -- posovetovatq_V = mkV perfective transitive "посоветовать" ;  ---- гл ru 2aСВ |основа=посове́това |основа1=посове́ту |НП=1 |соотв=советовать
  postavitq_V = mkV perfective transitive "поставить" "поставлю" "поставит" ;
  postaratqsja_V = mkV perfective intransitive "постараться" "постараюсь" "постарается" ;
  postojatq_V = mkV perfective transitive "постоять" "постою" "постоит" ;
  postradatq_V = mkV perfective transitive "пострадать" "пострадаю" "пострадает" ;
  postroitq_V = mkV perfective transitive "построить" "построю" "построит" ;
  postupatq_V = mkV imperfective transitive "поступать" "поступаю" "поступает" ;
  postupitq_V = mkV perfective transitive "поступить" "поступлю" "поступит" ;
  posylatq_V = mkV imperfective transitive "посылать" "посылаю" "посылает" ;
  poterjatq_V = mkV perfective transitive "потерять" "потеряю" "потеряет" ;
  -- potrebovatq_V = mkV perfective transitive "потребовать" ;  ---- гл ru 2aСВ |основа=потре́бова |основа1=потре́бу |соотв=требовать
  -- potrebovatqsja_V = mkV perfective intransitive "потребоваться" ;  ---- гл ru 2a-сяСВ |основа=потре́бова |основа1=потре́бу |соотв=требоваться
  potrjasti_V = mkV perfective transitive "потрясти" "потрясу" "потрясёт" ;
  potjanutq_V = mkV perfective transitive "потянуть" "потяну" "потянет" ;
  potjanutqsja_V = mkV perfective intransitive "потянуться" "потянусь" "потянется" ;
  -- pohoditq_V = mkV imperfective transitive "походить" ;  ---- гл ru 4c-т |основа=поход |основа1=похо́д |основа2=похож |НП=1 |соотв=-
  -- pocelovatq_V = mkV perfective transitive "поцеловать" ;  ---- гл ru 2aСВ |основа=поцелова́ |основа1=поцелу́ |2в= |НП= |соотв=
  pochitatq_V = mkV perfective transitive "почитать" "почитаю" "почитает" ;
  -- pochuvstvovatq_V = mkV perfective transitive "почувствовать" ;  ---- гл ru 2aСВ |основа=почу́вствова |основа1=почу́вству |соотв=чувствовать
  pojavitqsja_V = mkV perfective intransitive "появиться" "появлюсь" "появится" ;
  pojavljatqsja_V = mkV imperfective intransitive "появляться" "появляюсь" "появляется" ;
  pojasnitq_V = mkV perfective transitive "пояснить" "поясню" "пояснит" ;
  -- prevratitq_V = mkV perfective transitive "превратить" ;  ---- гл ru 4b-тСВ |основа=преврат |основа1=превращ |соотв=превращать
  -- prevratitqsja_V = mkV perfective intransitive "превратиться" ;  ---- гл ru 4b-т-сяСВ |основа=преврат |основа1=превращ
  prevraszatqsja_V = mkV imperfective intransitive "превращаться" "превращаюсь" "превращается" ;
  prevyshatq_V = mkV imperfective transitive "превышать" "превышаю" "превышает" ;
  predlagatq_V = mkV imperfective transitive "предлагать" "предлагаю" "предлагает" ;
  predlagatqsja_V = mkV imperfective intransitive "предлагаться" "предлагаюсь" "предлагается" ;
  predlozhitq_V = mkV perfective transitive "предложить" "предложу" "предложит" ;
  prednaznachitq_V = mkV perfective transitive "предназначить" "предназначу" "предназначит" ;
  predostavitq_V = mkV perfective transitive "предоставить" "предоставлю" "предоставит" ;
  predostavljatq_V = mkV imperfective transitive "предоставлять" "предоставляю" "предоставляет" ;
  predpolagatq_V = mkV imperfective transitive "предполагать" "предполагаю" "предполагает" ;
  predpolagatqsja_V = mkV imperfective intransitive "предполагаться" "предполагаюсь" "предполагается" ;
  predpolozhitq_V = mkV perfective transitive "предположить" "предположу" "предположит" ;
  predpochitatq_V = mkV imperfective transitive "предпочитать" "предпочитаю" "предпочитает" ;
  predstavitq_V = mkV perfective transitive "представить" "представлю" "представит" ;
  predstavljatq_V = mkV imperfective transitive "представлять" "представляю" "представляет" ;
  predstavljatqsja_V = mkV imperfective intransitive "представляться" "представляюсь" "представляется" ;
  predstojatq_V = mkV imperfective transitive "предстоять" "предстою" "предстоит" ;
  -- predupreditq_V = mkV perfective transitive "предупредить" ;  ---- гл ru 4b-тСВ |основа=предупред |основа1=предупреж |основа2=предупрежд |соотв=предупреждать
  preduprezhdatq_V = mkV imperfective transitive "предупреждать" "предупреждаю" "предупреждает" ;
  predusmatrivatq_V = mkV imperfective transitive "предусматривать" "предусматриваю" "предусматривает" ;
  predusmotretq_V = mkV perfective transitive "предусмотреть" "предусмотрю" "предусмотрит" ;
  pred6javitq_V = mkV perfective transitive "предъявить" "предъявлю" "предъявит" ;
  -- prekratitq_V = mkV perfective transitive "прекратить" ;  ---- гл ru 4b-тСВ |основа=прекрат |основа1=прекращ |соотв=прекращать
  preodoletq_V = mkV perfective transitive "преодолеть" "преодолею" "преодолеет" ;
  prervatq_V = mkV perfective transitive "прервать" "прерву" "прервёт" ;
  priblizhatqsja_V = mkV imperfective intransitive "приближаться" "приближаюсь" "приближается" ;
  -- pribytq_V = mkV perfective transitive "прибыть" "прибуду" "прибудет" ;
  privezti_V = mkV perfective transitive "привезти" "привезу" "привезёт" ;
  privesti_V = mkV perfective transitive "привести" "приведу" "приведёт" ;
  privlekatq_V = mkV imperfective transitive "привлекать" "привлекаю" "привлекает" ;
  -- privlechq_V = mkV perfective transitive "привлечь" ;  ---- гл ru 8b/bСВ |основа=привле́ч |основа1=привлек |основа2=привлёк |основа3=привлеч |НП= |соотв=привлека́ть
  -- privoditq_V = mkV imperfective transitive "приводить" ;  ---- гл ru 4c-т |основа=привод |основа1=приво́д |основа2=привож |основа3=приво́ж |соотв=привести
  privyknutq_V = mkV perfective transitive "привыкнуть" "привыкну" "привыкнет" ;
  -- priglasitq_V = mkV perfective transitive "пригласить" ;  ---- гл ru 4b-тСВ |основа=приглас |основа1=приглаш |соотв=приглашать
  priglashatq_V = mkV imperfective transitive "приглашать" "приглашаю" "приглашает" ;
  prigotovitq_V = mkV perfective transitive "приготовить" "приготовлю" "приготовит" ;
  -- pridavatq_V = mkV imperfective transitive "придавать" ;  ---- гл ru 13b |основа=придава́ |основа1=прида
  pridumatq_V = mkV perfective transitive "придумать" "придумаю" "придумает" ;
  priezzhatq_V = mkV imperfective transitive "приезжать" "приезжаю" "приезжает" ;
  -- priehatq_V = mkV perfective intransitive "приехать" ;  ---- гл ru ^a-ехСВ |основа=прие́ха |основа1=прие́д |основа2=приезжа́й |соотв=приезжать |НП=1
  -- prizhatq_V = mkV perfective transitive "прижать" ;  ---- гл ru 14bСВ |основа=прижа́ |основа1=прижм |соотв=прижимать
  -- prizvatq_V = mkV perfective transitive "призвать" ;  ---- гл ru 6°b/cСВ |основа=призв |основа1=призов |основа2=при́зв |соотв=призывать  также|тип=s|стиль='''!''' ''не рек.''|''призвало́'' также|тип=s|стиль='''!''' ''неправ.''|''призва́ла
  -- priznavatq_V = mkV imperfective transitive "признавать" ;  ---- гл ru 13b |основа = признава́ |основа1 = призна |соотв=признать
  -- priznavatqsja_V = mkV imperfective intransitive "признаваться" ;  ---- гл ru 13b-ся |основа=признава́ |основа1=призна |соотв=признаться
  priznatq_V = mkV perfective transitive "признать" "признаю" "признает" ;
  priznatqsja_V = mkV perfective intransitive "признаться" "признаюсь" "признается" ;
  prizyvatq_V = mkV imperfective transitive "призывать" "призываю" "призывает" ;
  -- prijti_V = mkV perfective transitive "прийти" "приду" "придёт" ;
  -- prijtisq_V = mkV perfective intransitive "прийтись" "придусь" "придётся" ;
  -- prikazatq_V = mkV perfective transitive "приказать" ;  ---- гл ru 6cСВ |основа=приказ |основа1=прикаж |основа3=прика́з |основа2=прика́ж |соотв=приказывать
  -- prikrytq_V = mkV perfective transitive "прикрыть" ;  ---- гл ru 12aСВ |основа=прикры́ |основа1=прикро́ |соотв=прикрывать
  primenjatq_V = mkV imperfective transitive "применять" "применяю" "применяет" ;
  primenjatqsja_V = mkV imperfective intransitive "применяться" "применяюсь" "применяется" ;
  prinadlezhatq_V = mkV imperfective transitive "принадлежать" "принадлежу" "принадлежит" ;
  prinesti_V = mkV perfective transitive "принести" "принесу" "принесёт" ;
  prinimatq_V = mkV imperfective transitive "принимать" "принимаю" "принимает" ;
  prinimatqsja_V = mkV imperfective intransitive "приниматься" "принимаюсь" "принимается" ;
  -- prinositq_V = mkV imperfective transitive "приносить" ;  ---- гл ru 4c-т |основа=принос |основа1=прино́с |основа2=принош |основа3=принес |соотв=принести
  -- prinjatq_V = mkV perfective transitive "принять" ;  ---- гл ru 14c(1)СВ |основа = прин |основа1 = прим |основа2 = при́ня |основа3 = при́м |соотв=принимать
  -- prinjatqsja_V = mkV perfective intransitive "приняться" ;  ---- гл ru 14c/b-сяСВ |основа=прин |основа1=прим |основа2=при́м |соотв=приниматься
  priobresti_V = mkV perfective transitive "приобрести" "приобрету" "приобретёт" ;
  priobretatq_V = mkV imperfective transitive "приобретать" "приобретаю" "приобретает" ;
  -- prisestq_V = mkV perfective transitive "присесть" ;  ---- гл ru 7aСВ-д |основа=присе́ |основа1=прися́ |НП=1 |соотв=присаживаться, приседать
  -- prislatq_V = mkV perfective transitive "прислать" ;  ---- гл ru 6b^СВ |основа=присл |основа1=пришл |основа2=при́сл |соотв=присылать
  prislushivatqsja_V = mkV imperfective intransitive "прислушиваться" "прислушиваюсь" "прислушивается" ;
  pristupitq_V = mkV perfective transitive "приступить" "приступлю" "приступит" ;
  -- prisutstvovatq_V = mkV imperfective transitive "присутствовать" ;  ---- гл ru 2a |основа=прису́тствова |основа1=прису́тству |НП=1
  -- prihoditq_V = mkV imperfective transitive "приходить" ;  ---- гл ru 4c-т |основа = приход |основа1 = прихо́д |основа2 = прихож |соотв=прийти |НП=1
  -- prihoditqsja_V = mkV imperfective intransitive "приходиться" ;  ---- гл ru 4c-т-ся |основа = приход |основа1 = прихо́д |основа2 = прихож |соотв=прийтись
  -- probovatq_V = mkV imperfective transitive "пробовать" ;  ---- гл ru 2a |основа=про́бова |основа1=про́бу |соотв=без ссылок|приставочные типа [[опробовать]], [[попробовать]]
  -- probormotatq_V = mkV perfective transitive "пробормотать" ;  ---- гл ru 6cСВ |основа=пробормот |основа1=пробормоч |основа2=пробормо́ч |НП=1 |соотв=
  proveritq_V = mkV perfective transitive "проверить" "проверю" "проверит" ;
  proverjatq_V = mkV imperfective transitive "проверять" "проверяю" "проверяет" ;
  provesti_V = mkV perfective transitive "провести" "проведу" "проведёт" ;
  -- provoditq_V = mkV imperfective transitive "проводить" ;  ---- гл ru 4c-т |основа=провод |основа1=прово́д |основа2=провож |ПричСтрадНет=1 |соотв=провести
  -- provoditqsja_V = mkV imperfective intransitive "проводиться" ;  ---- гл ru 4c-т-ся |основа=провод |основа1=прово́д |основа2=провож |НП= |соотв=провестись
  provozhatq_V = mkV imperfective transitive "провожать" "провожаю" "провожает" ;
  progovoritq_V = mkV perfective transitive "проговорить" "проговорю" "проговорит" ;
  -- prodavatq_V = mkV imperfective transitive "продавать" ;  ---- гл ru 13b |основа=продава́ |основа1=прода |соотв=продать
  -- prodatq_V = mkV perfective transitive "продать" "продам" "продаст" ;
  prodolzhatq_V = mkV imperfective transitive "продолжать" "продолжаю" "продолжает" ;
  prodolzhatqsja_V = mkV imperfective intransitive "продолжаться" "продолжаюсь" "продолжается" ;
  prodolzhitq_V = mkV perfective transitive "продолжить" "продолжу" "продолжит" ;
  prozhivatq_V = mkV imperfective transitive "проживать" "проживаю" "проживает" ;
  prozhitq_V = mkV perfective transitive "прожить" "проживу" "проживёт" ;
  prozvuchatq_V = mkV perfective transitive "прозвучать" "прозвучу" "прозвучит" ;
  proigratq_V = mkV perfective transitive "проиграть" "проиграю" "проиграет" ;
  proizvesti_V = mkV perfective transitive "произвести" "произведу" "произведёт" ;
  -- proizvoditq_V = mkV imperfective transitive "производить" ;  ---- гл ru 4c-т |основа=производ |основа1=произво́д |основа2=произвож |соотв=произвести
  -- proizvoditqsja_V = mkV imperfective intransitive "производиться" ;  ---- гл ru 4c-т-ся |основа=производ |основа1=произво́д |основа2=произвож |соотв=
  proiznesti_V = mkV perfective transitive "произнести" "произнесу" "произнесёт" ;
  -- proiznositq_V = mkV imperfective transitive "произносить" ;  ---- гл ru 4c-т |основа=произнос |основа1=произно́с |основа2=произнош |основа3=произнес |соотв=произнести
  -- proizojti_V = mkV perfective transitive "произойти" "произойду" "произойдёт" ;
  -- proishoditq_V = mkV imperfective transitive "происходить" ;  ---- гл ru 4c-т |основа=происход |основа2=происхож |основа1=происхо́д |НП=1 |соотв=произойти
  -- projti_V = mkV perfective transitive "пройти" "пройду" "пройдёт" ;
  propastq_V = mkV perfective transitive "пропасть" "пропаду" "пропадёт" ;
  -- propustitq_V = mkV perfective transitive "пропустить" ;  ---- гл ru 4c-тСВ |основа=пропуст |основа1=пропу́ст |основа2=пропущ |основа3=пропу́ще |соотв=пропускать
  -- prositq_V = mkV imperfective transitive "просить" ;  ---- гл ru 4c-т |основа = прос |основа1 = про́с |основа2 = прош |основа3 = про́ш |соотв=попросить
  prosnutqsja_V = mkV perfective intransitive "проснуться" "проснусь" "проснётся" ;
  -- prostitq_V = mkV perfective transitive "простить" ;  ---- гл ru 4b-тСВ |основа = прост |основа1 = прощ |основа2 = прощ |соотв=прощать
  protivorechitq_V = mkV imperfective transitive "противоречить" "противоречу" "противоречит" ;
  protjanutq_V = mkV perfective transitive "протянуть" "протяну" "протянет" ;
  -- prohoditq_V = mkV imperfective transitive "проходить" ;  ---- гл ru 4c-т |основа = проход |основа1 = прохо́д |основа2 = прохож |основа3 = про́йд |соотв=пройти
  prochestq_V = mkV perfective transitive "прочесть" "прочту" "прочтёт" ;
  prochitatq_V = mkV perfective transitive "прочитать" "прочитаю" "прочитает" ;
  -- prosheptatq_V = mkV perfective transitive "прошептать" ;  ---- гл ru 6cСВ |основа=прошепт |основа1=прошепч |основа2=проше́пч |основа3=прошёпт |соотв=шептать
  proszatq_V = mkV imperfective transitive "прощать" "прощаю" "прощает" ;
  projavitq_V = mkV perfective transitive "проявить" "проявлю" "проявит" ;
  projavljatq_V = mkV imperfective transitive "проявлять" "проявляю" "проявляет" ;
  projavljatqsja_V = mkV imperfective intransitive "проявляться" "проявляюсь" "проявляется" ;
  prygatq_V = mkV imperfective transitive "прыгать" "прыгаю" "прыгает" ;
  -- prjatatq_V = mkV imperfective transitive "прятать" ;  ---- гл ru 6a-т |основа=пря́т |основа1=пря́ч |соотв=[[спрятать]], [[запрятать]]
  -- prjatatqsja_V = mkV imperfective intransitive "прятаться" ;  ---- гл ru 6a-т-ся |основа=пря́т |основа1=пря́ч |соотв=спрятаться
  pugatq_V = mkV imperfective transitive "пугать" "пугаю" "пугает" ;
  puskatq_V = mkV imperfective transitive "пускать" "пускаю" "пускает" ;
  -- pustitq_V = mkV perfective transitive "пустить" ;  ---- гл ru 4c-тСВ |основа=пуст |основа1=пу́ст |основа2=пущ |основа3=пу́ще |соотв=пускать
  pytatqsja_V = mkV imperfective intransitive "пытаться" "пытаюсь" "пытается" ;
  rabotatq_V = mkV imperfective transitive "работать" "работаю" "работает" ;
  -- radovatqsja_V = mkV imperfective intransitive "радоваться" ;  ---- гл ru 2a-ся |основа=ра́дова |основа1=ра́ду |соотв=[[обрадоваться]], [[порадоваться]]
  razbiratqsja_V = mkV imperfective intransitive "разбираться" "разбираюсь" "разбирается" ;
  -- razbitq_V = mkV perfective transitive "разбить" ;  ---- гл ru 11*bСВ |основа=разб |основа1=разоб |соотв=разбивать
  -- razbuditq_V = mkV perfective transitive "разбудить" ;  ---- гл ru 4c-тСВ |основа=разбуд |основа1=разбу́д |основа2=разбуж |основа3=разбу́же |соотв=будить
  razvernutq_V = mkV perfective transitive "развернуть" "разверну" "развернёт" ;
  razvesti_V = mkV perfective transitive "развести" "разведу" "разведёт" ;
  razvivatq_V = mkV imperfective transitive "развивать" "развиваю" "развивает" ;
  razvivatqsja_V = mkV imperfective intransitive "развиваться" "развиваюсь" "развивается" ;
  -- razgljadetq_V = mkV perfective transitive "разглядеть" ;  ---- гл ru 5bXСВ |основа=разгляд |основа1=разгляж |соотв=-
  razgljadyvatq_V = mkV imperfective transitive "разглядывать" "разглядываю" "разглядывает" ;
  razgovarivatq_V = mkV imperfective transitive "разговаривать" "разговариваю" "разговаривает" ;
  -- razdatqsja_V = mkV perfective intransitive "раздаться" "раздамся" "раздастся" ;
  razdelitq_V = mkV perfective transitive "разделить" "разделю" "разделит" ;
  razdeljatq_V = mkV imperfective transitive "разделять" "разделяю" "разделяет" ;
  razmyshljatq_V = mkV imperfective transitive "размышлять" "размышляю" "размышляет" ;
  -- razobratq_V = mkV perfective transitive "разобрать" ;  ---- гл ru 6°*b/c^ |основа=разобр |основа1=разбер |основа2=разо́бр |соотв=разбирать
  -- razobratqsja_V = mkV perfective transitive "разобраться" ;  ---- гл ru 6°*b/c"-сяСВ |основа=разобр |основа1=разбер |соотв=разбираться
  -- razojtisq_V = mkV perfective intransitive "разойтись" "разойдусь" "разойдётся" ;
  razrabotatq_V = mkV perfective transitive "разработать" "разработаю" "разработает" ;
  razreshitq_V = mkV perfective transitive "разрешить" "разрешу" "разрешит" ;
  razrushitq_V = mkV perfective transitive "разрушить" "разрушу" "разрушит" ;
  ranitq_V = mkV imperfective transitive "ранить" "раню" "ранит" ;
  -- raskrytq_V = mkV perfective transitive "раскрыть" ;  ---- гл ru 12aСВ |основа=раскры |основа1=раскро |соотв=раскрывать
  raspahnutq_V = mkV perfective transitive "распахнуть" "распахну" "распахнёт" ;
  raspolagatq_V = mkV imperfective transitive "располагать" "располагаю" "располагает" ;
  raspolagatqsja_V = mkV imperfective intransitive "располагаться" "располагаюсь" "располагается" ;
  raspolozhitq_V = mkV perfective transitive "расположить" "расположу" "расположит" ;
  rasprostranitq_V = mkV perfective transitive "распространить" "распространю" "распространит" ;
  rasprostranjatqsja_V = mkV imperfective intransitive "распространяться" "распространяюсь" "распространяется" ;
  -- rasskazatq_V = mkV perfective transitive "рассказать" ;  ---- гл ru 6cСВ | основа = рассказ | основа1 = расскаж | основа2 = расска́ж | основа3 = расска́з | соотв = рассказывать
  rasskazyvatq_V = mkV imperfective transitive "рассказывать" "рассказываю" "рассказывает" ;
  rassmatrivatq_V = mkV imperfective transitive "рассматривать" "рассматриваю" "рассматривает" ;
  rassmatrivatqsja_V = mkV imperfective intransitive "рассматриваться" "рассматриваюсь" "рассматривается" ;
  rassmejatqsja_V = mkV perfective intransitive "рассмеяться" "рассмеюсь" "рассмеётся" ;
  rassmotretq_V = mkV perfective transitive "рассмотреть" "рассмотрю" "рассмотрит" ;
  rasstatqsja_V = mkV perfective intransitive "расстаться" "расстанусь" "расстанется" ;
  rasstreljatq_V = mkV perfective transitive "расстрелять" "расстреляю" "расстреляет" ;
  rassuzhdatq_V = mkV imperfective transitive "рассуждать" "рассуждаю" "рассуждает" ;
  rasschitatq_V = mkV perfective transitive "рассчитать" "рассчитаю" "рассчитает" ;
  rasschityvatq_V = mkV imperfective transitive "рассчитывать" "рассчитываю" "рассчитывает" ;
  rasti_V = mkV imperfective transitive "расти" "расту" "растёт" ;
  rasshiritq_V = mkV perfective transitive "расширить" "расширю" "расширит" ;
  -- rvatqsja_V = mkV imperfective intransitive "рваться" ;  ---- гл ru 6°b/c-ся |основа=рв |основа1=рв |основа2=рва |ДеепрНастЗатрудн=1 |соотв=[[порваться]], [[разорваться]]
  -- reagirovatq_V = mkV imperfective transitive "реагировать" ;  ---- гл ru 2a |основа=реаги́рова |основа1=реаги́ру |НП=1
  -- realizovatq_V = mkV imperfective transitive "реализовать" ;  ---- гл ru 2a |основа=реализова́ |основа1=реализу́ |основа2=реализо́в |2в=1
  -- rekomendovatq_V = mkV imperfective transitive "рекомендовать" ;  ---- гл ru 2a |основа=рекомендова́ |основа1=рекоменду́ |основа2=рекомендо́в |2в=1 |соотв=порекомендовать
  reshatq_V = mkV imperfective transitive "решать" "решаю" "решает" ;
  reshatqsja_V = mkV imperfective intransitive "решаться" "решаюсь" "решается" ;
  reshitq_V = mkV perfective transitive "решить" "решу" "решит" ;
  reshitqsja_V = mkV perfective intransitive "решиться" "решусь" "решится" ;
  -- riskovatq_V = mkV imperfective transitive "рисковать" ;  ---- гл ru 2a |основа=рискова́ |основа1=риску́ |НП=1 |соотв=рискнуть
  -- risovatq_V = mkV imperfective transitive "рисовать" ;  ---- гл ru 2a |основа = рисова́ |основа1 = рису́ |ПричСтрадПрош=рисо́ванный
  -- roditq_V = mkV perfective transitive "родить" ;  ---- гл ru 4b/c-тСВ |основа=род |основа1=рож |основа2=рожд |соотв=[[рожать]], [[рождать]]
  -- roditqsja_V = mkV perfective transitive "родиться" ;  ---- гл ru 4b/c"-сяСВ |основа=род |основа1=рож |соотв=рождаться
  rozhdatqsja_V = mkV imperfective intransitive "рождаться" "рождаюсь" "рождается" ;
  -- rukovoditq_V = mkV imperfective transitive "руководить" ;  ---- гл ru 4b-т |основа=руковод |основа1=руковож |основа2=руковожд |НП=2 |соотв=поруководить
  ruhnutq_V = mkV perfective transitive "рухнуть" "рухну" "рухнет" ;
  -- saditqsja_V = mkV imperfective intransitive "садиться" ;  ---- гл ru 4b-т-ся |основа=сад |основа1=саж |соотв=сесть
  -- sbitq_V = mkV perfective transitive "сбить" ;  ---- гл ru 11*bСВ |основа=сб |основа1=соб |соотв=сбива́ть
  -- sbrositq_V = mkV perfective transitive "сбросить" ;  ---- гл ru 4a-т-ьСВ |основа=сбро́с |основа1=сбро́ш |соотв=сбрасывать
  svernutq_V = mkV perfective transitive "свернуть" "сверну" "свернёт" ;
  svesti_V = mkV perfective transitive "свести" "сведу" "сведёт" ;
  -- svidetelqstvovatq_V = mkV imperfective transitive "свидетельствовать" ;  ---- гл ru 2a |основа=свиде́тельствова |основа1=свиде́тельству |соотв=засвидетельствовать
  -- svjazatq_V = mkV perfective transitive "связать" ;  ---- гл ru 6cСВ |основа=связ |основа1=свяж |основа2=свя́ж |основа3=свя́з |соотв=вязать
  svjazyvatq_V = mkV imperfective transitive "связывать" "связываю" "связывает" ;
  -- sdavatq_V = mkV imperfective transitive "сдавать" ;  ---- гл ru 13b |основа = сдава́ |основа1 = сда |основа2 = сда́ |соотв=сдать
  -- sdatq_V = mkV perfective transitive "сдать" "сдам" "сдаст" ;
  sdelatq_V = mkV perfective transitive "сделать" "сделаю" "сделает" v1a ;
  sdelatqsja_V = mkV perfective intransitive "сделаться" "сделаюсь" "сделается" ;
  -- sestq_V = mkV perfective transitive "сесть" ;  ---- гл ru 7aСВ-д |основа=се́ |основа1=ся́ |НП=1 |соотв=сади́ться
  -- sidetq_V = mkV imperfective transitive "сидеть" ;  ---- гл ru 5b^-т |основа=сид |основа1=сиж |основа2=си́д |НП=1
  sijatq_V = mkV imperfective transitive "сиять" "сияю" "сияет" ;
  -- skazatq_V = mkV perfective transitive "сказать" ;  ---- гл ru 6cСВ |основа=сказ |основа1=скаж |основа2=ска́ж |основа3=ска́з |соотв=[[сказывать]], [[говорить]]
  skladyvatqsja_V = mkV imperfective intransitive "складываться" "складываюсь" "складывается" ;
  skryvatq_V = mkV imperfective transitive "скрывать" "скрываю" "скрывает" ;
  -- skrytq_V = mkV perfective transitive "скрыть" ;  ---- гл ru 12aСВ |основа=скры́ |основа1=скро́ |соотв=скрывать
  -- skrytqsja_V = mkV perfective intransitive "скрыться" ;  ---- гл ru 12a-сяСВ |основа=скры́ |основа1=скро́ |соотв=скрываться
  -- sleditq_V = mkV imperfective transitive "следить" ;  ---- гл ru 4b-т |основа=след |основа1=слеж |НП=1 |соотв=проследить, отследить, выследить
  -- sledovatq_V = mkV imperfective transitive "следовать" ;  ---- гл ru 2a |основа=сле́дова |основа1=сле́ду |НП=1
  slozhitq_V = mkV perfective transitive "сложить" "сложу" "сложит" ;
  slozhitqsja_V = mkV perfective intransitive "сложиться" "сложусь" "сложится" ;
  slomatq_V = mkV perfective transitive "сломать" "сломаю" "сломает" ;
  sluzhitq_V = mkV imperfective transitive "служить" "служу" "служит" ;
  sluchatqsja_V = mkV imperfective intransitive "случаться" "случаюсь" "случается" ;
  sluchitqsja_V = mkV perfective intransitive "случиться" "случусь" "случится" ;
  slushatq_V = mkV imperfective transitive "слушать" "слушаю" "слушает" ;
  slyshatq_V = mkV imperfective transitive "слышать" "слышу" "слышит" ;
  smenitq_V = mkV perfective transitive "сменить" "сменю" "сменит" ;
  smejatqsja_V = mkV imperfective intransitive "смеяться" "смеюсь" "смеётся" ;
  smotretq_V = mkV imperfective transitive "смотреть" "смотрю" "смотрит" ;
  smochq_V = mkV perfective transitive "смочь" "смогу" "сможет" ;
  snimatq_V = mkV imperfective transitive "снимать" "снимаю" "снимает" ;
  snimatqsja_V = mkV imperfective intransitive "сниматься" "снимаюсь" "снимается" ;
  snitqsja_V = mkV imperfective intransitive "сниться" "снюсь" "снится" ;
  -- snjatq_V = mkV perfective transitive "снять" ;  ---- гл ru 14c/cСВ | основа = сня́ | основа1 = сня | основа2 = сним | основа3 = сни́м | соотв = снимать
  sobiratq_V = mkV imperfective transitive "собирать" "собираю" "собирает" ;
  sobiratqsja_V = mkV imperfective intransitive "собираться" "собираюсь" "собирается" ;
  -- sobratq_V = mkV perfective transitive "собрать" ;  ---- гл ru 6°b/cСВ |основа=собр |основа2=со́бр |основа1=собер |соотв=собирать
  -- sobratqsja_V = mkV perfective intransitive "собраться" ;  ---- гл ru 6°b/cX^-сяСВ |основа=собр |основа1=собер |соотв=собираться
  sovershatq_V = mkV imperfective transitive "совершать" "совершаю" "совершает" ;
  sovershitq_V = mkV perfective transitive "совершить" "совершу" "совершит" ;
  -- sovetovatq_V = mkV imperfective transitive "советовать" ;  ---- гл ru 2a |основа=сове́това |основа1=сове́ту |НП=1 |соотв=посоветовать
  sovpadatq_V = mkV imperfective transitive "совпадать" "совпадаю" "совпадает" ;
  -- soglasitqsja_V = mkV perfective intransitive "согласиться" ;  ---- гл ru 4b-т-сяСВ |основа=соглас |основа1=соглаш |соотв=соглашаться
  soglashatqsja_V = mkV imperfective intransitive "соглашаться" "соглашаюсь" "соглашается" ;
  soderzhatq_V = mkV imperfective transitive "содержать" "содержу" "содержит" ;
  -- soderzhatqsja_V = mkV perfective intransitive "содержаться" ;  ---- гл ru 5c-ш-сяСВ |основа=содерж |основа1=соде́рж |соотв=
  soedinitq_V = mkV perfective transitive "соединить" "соединю" "соединит" ;
  -- sozdavatq_V = mkV imperfective transitive "создавать" ;  ---- гл ru 13b |основа=создава́ |основа1=созда |НП= |соотв=создать
  -- sozdavatqsja_V = mkV imperfective intransitive "создаваться" ;  ---- гл ru 13b-ся |основа=создава́ |основа1=созда |соотв=создаться
  -- sozdatq_V = mkV perfective transitive "создать" "создам" "создаст" ;
  -- sojti_V = mkV perfective transitive "сойти" "сойду" "сойдёт" ;
  -- sokratitq_V = mkV perfective transitive "сократить" ;  ---- гл ru 4b-тСВ |основа=сократ |основа1=сокращ |соотв=сокращать
  somnevatqsja_V = mkV imperfective intransitive "сомневаться" "сомневаюсь" "сомневается" ;
  -- soobrazitq_V = mkV perfective transitive "сообразить" ;  ---- гл ru 4b-тСВ |основа = сообраз |основа1 = соображ |основа2 = соображ |соотв=соображать
  soobszatq_V = mkV imperfective transitive "сообщать" "сообщаю" "сообщает" ;
  soobszitq_V = mkV perfective transitive "сообщить" "сообщу" "сообщит" ;
  -- sootvetstvovatq_V = mkV imperfective transitive "соответствовать" ;  ---- гл ru 2a |основа=соотве́тствова |основа1=соотве́тству |соотв= |НП=1
  soprovozhdatq_V = mkV imperfective transitive "сопровождать" "сопровождаю" "сопровождает" ;
  sostavitq_V = mkV perfective transitive "составить" "составлю" "составит" ;
  sostavljatq_V = mkV imperfective transitive "составлять" "составляю" "составляет" ;
  sostojatq_V = mkV imperfective transitive "состоять" "состою" "состоит" ;
  sostojatqsja_V = mkV perfective intransitive "состояться" "состоюсь" "состоится" ;
  sohranitq_V = mkV perfective transitive "сохранить" "сохраню" "сохранит" ;
  sohranitqsja_V = mkV perfective intransitive "сохраниться" "сохранюсь" "сохранится" ;
  sohranjatq_V = mkV imperfective transitive "сохранять" "сохраняю" "сохраняет" ;
  spasatq_V = mkV imperfective transitive "спасать" "спасаю" "спасает" ;
  spasti_V = mkV perfective transitive "спасти" "спасу" "спасёт" ;
  spatq_V = mkV imperfective transitive "спать" "сплю" "спит" ;
  speshitq_V = mkV perfective transitive "спешить" "спешу" "спешит" ;
  sporitq_V = mkV imperfective transitive "спорить" "спорю" "спорит" ;
  -- sposobstvovatq_V = mkV imperfective transitive "способствовать" ;  ---- гл ru 2a |основа=спосо́бствова |основа1=спосо́бству |НП=1 |соотв=поспособствовать
  spravitqsja_V = mkV perfective intransitive "справиться" "справлюсь" "справится" ;
  sprashivatq_V = mkV imperfective transitive "спрашивать" "спрашиваю" "спрашивает" ;
  -- sprositq_V = mkV perfective transitive "спросить" ;  ---- гл ru 4c-тСВ |основа=спрос |основа1=спро́с |основа2=спрош |основа3=спро́ше |соотв=спрашивать
  -- sprjatatq_V = mkV perfective transitive "спрятать" ;  ---- гл ru 6a-тСВ |основа=спря́т |основа1=спря́ч |соотв=прятать
  spuskatqsja_V = mkV imperfective intransitive "спускаться" "спускаюсь" "спускается" ;
  -- spustitqsja_V = mkV perfective intransitive "спуститься" ;  ---- гл ru 4c-т-сяСВ |основа=спуст |основа1=спущ |основа2=спу́ст |соотв=спускаться
  sravnitq_V = mkV imperfective transitive "сравнить" "сравню" "сравнит" ;
  stavitq_V = mkV imperfective transitive "ставить" "ставлю" "ставит" ;
  stanovitqsja_V = mkV imperfective intransitive "становиться" "становлюсь" "становится" ;
  staratqsja_V = mkV imperfective intransitive "стараться" "стараюсь" "старается" ;
  statq_V = mkV perfective transitive "стать" "стану" "станет" ;
  stesnjatqsja_V = mkV imperfective intransitive "стесняться" "стесняюсь" "стесняется" ;
  stoitq_V = mkV imperfective transitive "стоить" "стою" "стоит" ;
  stolknutqsja_V = mkV perfective intransitive "столкнуться" "столкнусь" "столкнётся" ;
  stojatq_V = mkV imperfective transitive "стоять" "стою" "стоит" ;
  stradatq_V = mkV imperfective transitive "страдать" "страдаю" "страдает" ;
  streljatq_V = mkV imperfective transitive "стрелять" "стреляю" "стреляет" ;
  stremitqsja_V = mkV imperfective intransitive "стремиться" "стремлюсь" "стремится" ;
  stroitq_V = mkV imperfective transitive "строить" "строю" "строит" ;
  stroitqsja_V = mkV imperfective intransitive "строиться" "строюсь" "строится" ;
  stuchatq_V = mkV imperfective transitive "стучать" "стучу" "стучит" ;
  -- suditq_V = mkV imperfective transitive "судить" ;  ---- гл ru 4c((4))-т |основа=суд |основа1=су́д |основа2=суж |основа3=су́ж |соотв=[[высудить]], [[засудить]], [[подсудить]], [[обсудить]], [[осудить]], [[отсудить]], [[пересудить]], [[посудить]], [[присудить]], [[рассудить]]
  sumetq_V = mkV perfective transitive "суметь" "сумею" "сумеет" ;
  sunutq_V = mkV perfective transitive "сунуть" "суну" "сунет" ;
  -- suszestvovatq_V = mkV imperfective transitive "существовать" ;  ---- гл ru 2a |основа=существова́ |основа1=существу́ |соотв=просуществова́ть |НП=1
  -- sformulirovatq_V = mkV perfective transitive "сформулировать" ;  ---- гл ru 2aСВ |основа=сформули́рова |основа1=сформули́ру |НП= |соотв=формулировать
  -- shvatitq_V = mkV perfective transitive "схватить" ;  ---- гл ru 4c-тСВ |основа=схват |основа1=схва́т |основа2=схвач |основа3=схва́че |соотв=схва́тывать
  -- shoditq_V = mkV imperfective transitive "сходить" ;  ---- гл ru 4c-т |основа=сход |основа1=схо́д |основа2=схож |НП=1 |соотв=сойти́
  -- schestq_V = mkV perfective transitive "счесть" ;  ---- гл ru 7b/b(9)СВ^ |основа=сч |основа1=соч |соотв=считать
  schitatq_V = mkV imperfective transitive "считать" "считаю" "считает" ;
  schitatqsja_V = mkV imperfective intransitive "считаться" "считаюсь" "считается" ;
  -- s6estq_V = mkV perfective transitive "съесть" "съем" "съест" ;
  sygratq_V = mkV perfective transitive "сыграть" "сыграю" "сыграет" ;
  -- tancevatq_V = mkV imperfective transitive "танцевать" ;  ---- гл ru 2a |основа=танцева́ |основа1=танцу́ |соотв=станцевать, оттанцевать
  taszitq_V = mkV imperfective transitive "тащить" "тащу" "тащит" ;
  tvoritq_V = mkV imperfective transitive "творить" "творю" "творит" ;
  terpetq_V = mkV imperfective transitive "терпеть" "терплю" "терпит" ;
  terjatq_V = mkV imperfective transitive "терять" "теряю" "теряет" ;
  techq_V = mkV imperfective transitive "течь" "теку" "течёт" ;
  -- torgovatq_V = mkV imperfective transitive "торговать" ;  ---- гл ru 2a |основа=торгова́ |основа1=торгу́ |соотн=-
  toropitqsja_V = mkV imperfective intransitive "торопиться" "тороплюсь" "торопится" ;
  torchatq_V = mkV imperfective transitive "торчать" "торчу" "торчит" ;
  -- tratitq_V = mkV imperfective transitive "тратить" ;  ---- гл ru 4a-т |основа=тра́т |основа1=тра́ч |соотв=без ссылок|приставочные типа [[затратить]], [[истратить]], [[потратить]]
  -- trebovatq_V = mkV imperfective transitive "требовать" ;  ---- гл ru 2a |основа = тре́бова |основа1 = тре́бу |соотв=потребовать
  -- trebovatqsja_V = mkV imperfective intransitive "требоваться" ;  ---- гл ru 2a-ся |основа=тре́бова |основа1=тре́бу |соотв=потребоваться
  trogatq_V = mkV imperfective transitive "трогать" "трогаю" "трогает" ;
  tronutq_V = mkV perfective transitive "тронуть" "трону" "тронет" ;
  -- truditqsja_V = mkV imperfective intransitive "трудиться" ;  ---- гл ru 4c-т-ся |основа=труд |основа1=тру́д |основа2=труж |соотв=потрудиться
  -- tjanutq_V = mkV imperfective transitive "тянуть" ;  ---- гл ru 3c |основа = тяну́ |основа1 = тя́н |основа2 = тян
  tjanutqsja_V = mkV imperfective intransitive "тянуться" "тянусь" "тянется" ;
  -- ubeditq_V = mkV perfective transitive "убедить" ;  ---- гл ru 4b-тСВ |основа = убед |основа1 = убеж |основа2 = убежд |соотв=убеждать |Ед1лЗатрудн=1
  -- ubeditqsja_V = mkV perfective intransitive "убедиться" ;  ---- гл ru 4b-т-сяСВ |основа=убед |основа1=убеж |соотв=убеждаться |Ед1лЗатрудн=1
  -- ubezhatq_V = mkV perfective transitive "убежать" ;  ---- гл ru 5b-жСВ |основа=убеж |основа1=убег |соотв=убегать |НП=1
  ubivatq_V = mkV imperfective transitive "убивать" "убиваю" "убивает" ;
  ubitq_V = mkV perfective transitive "убить" "убью" "убьёт" ;
  -- ubratq_V = mkV perfective transitive "убрать" ;  ---- гл ru 6°b/cСВ |основа=убр |основа1=убер |основа2=у́бр |соотв=убирать
  uvazhatq_V = mkV imperfective transitive "уважать" "уважаю" "уважает" ;
  uvelichitq_V = mkV perfective transitive "увеличить" "увеличу" "увеличит" ;
  uvelichitqsja_V = mkV perfective intransitive "увеличиться" "увеличусь" "увеличится" ;
  uverjatq_V = mkV imperfective transitive "уверять" "уверяю" "уверяет" ;
  -- uvidetq_V = mkV perfective transitive "увидеть" ;  ---- гл ru 5a-тСВ |основа=уви́д |основа1=уви́ж |соотв=видеть
  -- udavatqsja_V = mkV imperfective intransitive "удаваться" ;  ---- гл ru 13b-ся |основа=удава́ |основа1=уда |соотв=удаться
  udaritq_V = mkV perfective transitive "ударить" "ударю" "ударит" ;
  -- udatqsja_V = mkV perfective transitive "удаться" ;  ---- гл ru ^b/c"-сяСВ |основа=уда́ |основа1=уда |соотв=удаваться
  -- uderzhatqsja_V = mkV perfective intransitive "удержаться" ;  ---- гл ru 5c-ш-сяСВ |основа=удерж |основа1=уде́рж |соотв=удерживаться
  -- udivitq_V = mkV perfective transitive "удивить" ;  ---- гл ru 4b-бСВ |основа=удив |соотв=удивлять
  udivitqsja_V = mkV perfective intransitive "удивиться" "удивлюсь" "удивится" ;
  udivljatqsja_V = mkV imperfective intransitive "удивляться" "удивляюсь" "удивляется" ;
  uezzhatq_V = mkV imperfective transitive "уезжать" "уезжаю" "уезжает" ;
  -- uehatq_V = mkV perfective intransitive "уехать" ;  ---- гл ru ^a-ехСВ |основа=уе́ха |основа1=уе́д |основа2=уезжа́й |НП=1 |соотв=уезжать
  -- uznavatq_V = mkV imperfective transitive "узнавать" ;  ---- гл ru 13b |основа=узнава́ |основа1=узна |соотв=узнать
  uznatq_V = mkV perfective transitive "узнать" "узнаю" "узнает" ;
  -- ujti_V = mkV perfective transitive "уйти" "уйду" "уйдёт" ;
  -- ukazatq_V = mkV perfective transitive "указать" ;  ---- гл ru 6cСВ |основа=указ |основа1=укаж |основа2=ука́ж |основа3=ука́з |НП= |соотв=указывать
  ukazyvatq_V = mkV imperfective transitive "указывать" "указываю" "указывает" ;
  ukrastq_V = mkV perfective transitive "украсть" "украду" "украдёт" ;
  ulybatqsja_V = mkV imperfective intransitive "улыбаться" "улыбаюсь" "улыбается" ;
  ulybnutqsja_V = mkV perfective intransitive "улыбнуться" "улыбнусь" "улыбнётся" ;
  -- umeretq_V = mkV perfective transitive "умереть" ;  ---- гл ru 9b/c(1)СВ |основа=умер |основа1=умр |основа2=у́мер |основа3=уме́р |НП=1 |соотв=умирать
  umetq_V = mkV imperfective transitive "уметь" "умею" "умеет" ;
  umiratq_V = mkV imperfective transitive "умирать" "умираю" "умирает" ;
  unichtozhitq_V = mkV perfective transitive "уничтожить" "уничтожу" "уничтожит" ;
  upastq_V = mkV perfective transitive "упасть" "упаду" "упадёт" ;
  upomjanutq_V = mkV perfective transitive "упомянуть" "упомяну" "упомянет" ;
  upravljatq_V = mkV imperfective transitive "управлять" "управляю" "управляет" ;
  uslyshatq_V = mkV perfective transitive "услышать" "услышу" "услышит" ;
  usmehnutqsja_V = mkV perfective intransitive "усмехнуться" "усмехнусь" "усмехнётся" ;
  usnutq_V = mkV perfective transitive "уснуть" "усну" "уснёт" ;
  uspevatq_V = mkV imperfective transitive "успевать" "успеваю" "успевает" ;
  uspetq_V = mkV perfective transitive "успеть" "успею" "успеет" ;
  uspokoitq_V = mkV perfective transitive "успокоить" "успокою" "успокоит" ;
  uspokoitqsja_V = mkV perfective intransitive "успокоиться" "успокоюсь" "успокоится" ;
  ustavitqsja_V = mkV perfective intransitive "уставиться" "уставлюсь" "уставится" ;
  ustanavlivatq_V = mkV imperfective transitive "устанавливать" "устанавливаю" "устанавливает" ;
  ustanovitq_V = mkV perfective transitive "установить" "установлю" "установит" ;
  ustatq_V = mkV perfective transitive "устать" "устану" "устанет" ;
  ustraivatq_V = mkV imperfective transitive "устраивать" "устраиваю" "устраивает" ;
  ustroitq_V = mkV perfective transitive "устроить" "устрою" "устроит" ;
  ustroitqsja_V = mkV perfective intransitive "устроиться" "устроюсь" "устроится" ;
  ustupatq_V = mkV imperfective transitive "уступать" "уступаю" "уступает" ;
  -- utverditq_V = mkV perfective transitive "утвердить" ;  ---- гл ru 4b-тСВ |основа=утверд |основа1=утверж |основа2=утвержд |соотв=утверждать
  utverzhdatq_V = mkV imperfective transitive "утверждать" "утверждаю" "утверждает" ;
  utochnitq_V = mkV perfective transitive "уточнить" "уточню" "уточнит" ;
  -- utratitq_V = mkV perfective transitive "утратить" ;  ---- гл ru 4a-т-ьСВ |основа=утра́т |основа1=утра́ч |соотв=утра́чивать |2в= |НП=
  -- uhoditq_V = mkV imperfective transitive "уходить" ;  ---- гл ru 4c-т |основа = уход |основа1 = ухо́д |основа2 = ухож |НП=1 |соотв=уйти
  -- uchastvovatq_V = mkV imperfective transitive "участвовать" ;  ---- гл ru 2a |основа=уча́ствова |основа1=уча́ству |соотв=поучаствовать |НП=1
  uchestq_V = mkV perfective transitive "учесть" "учту" "учтёт" ;
  uchityvatq_V = mkV imperfective transitive "учитывать" "учитываю" "учитывает" ;
  uchitq_V = mkV imperfective transitive "учить" "учу" "учит" ;
  uchitqsja_V = mkV imperfective intransitive "учиться" "учусь" "учится" ;
  -- formirovatqsja_V = mkV imperfective intransitive "формироваться" ;  ---- гл ru 2a-ся |основа=формирова́ |основа1=формиру́ |соотв=сформироваться
  hvatatq_V = mkV imperfective transitive "хватать" "хватаю" "хватает" ;
  hvatitq_V = mkV perfective transitive "хватить" "хватю" "хватит" ;
  -- hoditq_V = mkV imperfective transitive "ходить" ;  ---- гл ru 4c-т |основа=ход |основа1=хо́д |основа2=хож |основа3=хо́ж |НП=1 |соотв=сходить Некратный подвид - [[идти]]. морфо-ru|ход|-и|+ть|и=т
  -- hotetq_V = mkV imperfective transitive "хотеть" ;  ---- гл ru 5c'^-т |основа=хот |основа1=хо́ч |основа2=хоч |соотв=захотеть |ПричСтрадПрош=— |ПовелЗатрудн=1
  -- hotetqsja_V = mkV imperfective intransitive "хотеться" ;  ---- гл ru 5c'^-т-ся |основа=хот |основа1=хо́ч |соотв=захотеться |безличный=1
  -- hohotatq_V = mkV imperfective transitive "хохотать" ;  ---- гл ru 6c-т |основа=хохот |основа1=хохо́ч |основа2=хохоч |НП=1
  hranitq_V = mkV imperfective transitive "хранить" "храню" "хранит" ;
  hranitqsja_V = mkV imperfective intransitive "храниться" "хранюсь" "хранится" ;
  -- celovatq_V = mkV imperfective transitive "целовать" ;  ---- гл ru 2a |основа=целова́ |основа1=целу́ |соотв=поцеловать
  cenitq_V = mkV imperfective transitive "ценить" "ценю" "ценит" ;
  chitatq_V = mkV imperfective transitive "читать" "читаю" "читает" ;
  -- chuvstvovatq_V = mkV imperfective transitive "чувствовать" ;  ---- гл ru 2a |основа = чу́вствова |основа1 =чу́вству |ПричСтрадПрош=чу́вствованный |соотв=почу́вствовать
  -- sheptatq_V = mkV imperfective transitive "шептать" ;  ---- гл ru 6c-т |основа=шепт |основа1=ше́пч |основа2=шепч |основа3=шёпт |соотв=прошептать
  -- shutitq_V = mkV imperfective transitive "шутить" ;  ---- гл ru 4c-т |основа=шут |основа1=шу́т |основа2=шуч |НП=1 |соотв=пошути́ть
  javitqsja_V = mkV perfective intransitive "явиться" "явлюсь" "явится" ;
  javljatqsja_V = mkV imperfective intransitive "являться" "являюсь" "является" ;

}