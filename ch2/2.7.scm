(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(lower-bound (make-interval 3.35 4.35))
;=> 3.35

(upper-bound (make-interval 3.35 4.35))
;=> 4.35
