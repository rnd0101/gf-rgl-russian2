concrete PhraseRus of Phrase = CatRus ** open Prelude, ResRus in {

lin
    UttS s = {s = s.s ! Ind} ;
    UttAdv adv = adv ;
    UttCN cn = {s = cn.s ! Sg ! Nom} ;
    UttAP ap = {s = ap.s ! Sg ! Masc ! Animate ! Nom } ;
    UttNP np = {s = np.s ! Nom} ;
    UttInterj i = i ;

    PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;

    NoPConj = {s = []} ;
    PConjConj conj = {s = conj.s2} ;

    NoVoc = {s = []} ;
    VocNP np = {s = "," ++ np.s ! VocRus } ;
}
