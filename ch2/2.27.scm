(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(define x (list (list 1 2) (list 3 4)))

(reverse x)
;=> ((3 4) (1 2))

(append (list 3 4) (list (reverse (list 1 2))))

(define (deep-reverse items)
  (cond ((null? items) items)
        ((pair? (car items)) (append (deep-reverse (cdr items))
                                     (list (deep-reverse (car items)))))
        (else (append (deep-reverse (cdr items))
                      (list (car items)))))
)

(deep-reverse x)

(define y (list (list 1 2) (list (list 3 4) (list 5 6 7))))
;=> ((1 2) ((3 4) (5 6 7)))

(deep-reverse y)
;=> (((7 6 5) (4 3)) (2 1))
