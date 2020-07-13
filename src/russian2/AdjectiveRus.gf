concrete AdjectiveRus of Adjective = CatRus ** open ResRus, Prelude in {
  lin
    -- : A -> AP ;        -- warm - тёплый
    PositA a = adjFormsAdjective a ** {isPost = False} ;
    -- : A2 -> AP ;       -- married
    UseA2 a = adjFormsAdjective a ** {isPost = False} ;
    -- : A  -> AP ;       -- warmer - теплее
    UseComparA a = adjFormsAdjective (immutableAdjForms a.comp)
                   ** {isPost = False; preferShort = PrefShort} ;  -- TODO: non-qual
    -- : AP -> Adv -> AP ; -- warm by nature
    AdvAP ap adv = ap ** {s = \\gn,a,c => ap.s ! gn ! a ! c ++ adv.s ; isPost = False} ;
    -- : AP -> SC -> AP ;  -- good that she is here
    SentAP ap sc = ap ** {s = \\gn,a,c => ap.s ! gn ! a ! c ++ [", "] ++ sc.s ; isPost = True} ;

    -- : A  -> NP -> AP ;  -- warmer than I
    ComparA
      = \a,np ->
        let af = adjFormsAdjective (immutableAdjForms a.comp) in {
          s = \\gn,anim,cas => a.comp ++ np.s ! Gen ;
          isPost = False ;
          preferShort = PrefShort
          } ;
}