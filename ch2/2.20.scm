(define (same-parity target . items)
  (define (same-parity-list lst)
    (if (null? lst)
        lst
        (if (same-parity? target (car lst))
            (cons (car lst) (same-parity-list (cdr lst)))
            (same-parity-list (cdr lst)))))
  (cons target (same-parity-list items))
)

(define (same-parity? a b)
  (even? (+ a b)))

(same-parity? 1 2)
;=> #f

(same-parity? 1 3)
;=> #t

(same-parity? 2 4)
;=> #t

(same-parity 1 2 3 4 5 6 7)
;=> (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;=> (2 4 6)
