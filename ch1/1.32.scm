(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-rec combiner null-value term (next a) next b))))

(define (add a result) (+ a result))

(define (mult a result) (* a result))

(define (sum term a next b)
  (accumulate-rec add 0 term a next b))

(define (product term a next b)
  (accumulate-rec mult 1 term a next b))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)
;=> 3025

(define (fact n)
  (product identity 1 inc n))

(fact 4)
;=> 24

(define (accumulate-it combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value)

(define (sum-it term a next b)
  (accumulate-it add 0 term a next b))

(define (product-it term a next b)
  (accumulate-it mult 0 term a next b))

(define (sum-cubes-it a b)
  (sum cube a inc b))

(sum-cubes-it 1 10)
;=> 3025

(define (fact-it n)
  (product identity 1 inc n))

(fact-it 4)
;=> 24
