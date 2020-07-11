concrete AdjectiveRus of Adjective = CatRus ** open ResRus, Prelude in {
  lin
    -- : A -> AP ;        -- warm - тёплый
    PositA a = adjFormsAdjective a ** {isPost = False} ;
    -- : A2 -> AP ;       -- married
    UseA2 a = adjFormsAdjective a ** {isPost = False} ;
    -- : A  -> AP ;       -- warmer - теплее
    UseComparA a = adjFormsAdjective (immutableAdjForms a.comp) ** {isPost = False} ;  -- prefer short?

    --AdvAP ap adv = ap ** {s = \\g,n,c => ap.s ! g ! n ! c ++ adv.s ; isPost = True} ;
}
