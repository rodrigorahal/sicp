(define (adjoin-set x set)
  (define (iter smaller bigger)
    (cond ((null? bigger) (append smaller (list x)))
          ((= x (car bigger)) set)
          ((> x (car bigger)) (iter (append smaller (list (car bigger)))
                                    (cdr bigger)))
          (else (append (append smaller (list x))
                        bigger))))
  (iter '() set))

(adjoin-set 3 (list 1 2 4 5))
;=> (1 2 3 4 5)

(adjoin-set 3 (list 1 2))
;=> (1 2 3)

(adjoin-set 3 (list 1 3))
;=> (1 3)
