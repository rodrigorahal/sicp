(rule (lives-near ?person-1 ?person-2)
      (and (address ?person-1 (?town . ?rest-1))
           (address ?person-2 (?town . ?rest-2))
           (not (same ?person-1 ?person-2))))

; the rule finds the reciprocals (lives-near ?a ?b) that is (lives-near ?b ?a)
; we can test if the symbols given are sorted to avoid running the reciprocal
; query
