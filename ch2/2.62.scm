(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1))
                    (x2 (car set2)))
                (cond ((= x1 x2)
                        (cons x1 (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2)
                        (cons x1
                                (union-set (cdr set1) set2)))
                      ((< x2 x1)
                        (cons x2
                                (union-set set1 (cdr set2)))))))))

(union-set '(1 2 3) '(4 5 6))
;=> (1 4 2 5 3 6)

(union-set '(4 5 6) '(1 2 3))
;=> (1 4 2 5 3 6)

(union-set '(3 4 6) '(1 2 3 5))
