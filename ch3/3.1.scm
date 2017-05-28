(define (make-accumulator accumulated)
  (define (add value)
    (set! accumulated (+ accumulated value))
    accumulated)
  add)

(define A (make-accumulator 5))
(A 10)
;=> 15

(A 10)
;=> 25
