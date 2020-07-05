concrete AdjectiveRus of Adjective = CatRus ** open ResRus, Prelude in {
  lin
    PositA a = adjFormsAdjective a ** {isPost = False} ;
    UseA2 a = adjFormsAdjective a ** {isPost = False} ;
    --UseComparA a = adjFormsAdjective a ** {isPost = False} ; ---- TODO: this gives positive forms
    --AdvAP ap adv = ap ** {s = \\g,n,c => ap.s ! g ! n ! c ++ adv.s ; isPost = True} ;
}
