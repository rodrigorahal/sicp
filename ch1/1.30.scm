(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (sum-integers a b)
  (sum identity a inc b))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-integers 1 10)
;=> 55

(sum-cubes 1 10)
;=> 3025
