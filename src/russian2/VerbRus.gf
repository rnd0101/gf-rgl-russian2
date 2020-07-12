concrete VerbRus of Verb = CatRus ** open ResRus, Prelude in {

lin
  -- : V   -> VP ;        -- sleep
  UseV v = {
    verb = v ;
    compl = \\_ => []
    } ;

  -- : V2 -> VP ;         -- be loved
  PassV2 v2 = {
    verb = passivate v2 ;
    compl = agree v2.c
  } ;

}
