(define (last-pair lst)
  (list (list-ref lst
                  (- (length lst) 1)))
)

(last-pair (list 23 72 149 34))
;=> (34)

(last-pair (list 1 2 3 4))
;=> (4)
