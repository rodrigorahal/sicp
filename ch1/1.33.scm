(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (combiner null-value
                        (filtered-accumulate combiner null-value term (next a) next b filter)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (add a result) (+ a result))

(define (identity x) x)

(define (square x) (* x x))

(define (inc n) (+ n 1))

(define (sum-square-primes a b)
  (filtered-accumulate add 0 square a inc b prime?))

(sum-square-primes 2 3)
;=> 13

(sum-square-primes 2 10)
;=> 87

(define (mult a result) (* a result))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-relative-primes n)
  (define (relative-prime? a) (= 1 (gcd a n)))
  (filtered-accumulate mult 1 identity 1 inc (- n 1) relative-prime?))

(product-relative-primes 10)
;=> 189

(product-relative-primes 11)
;=> 3628800 = (10!)
