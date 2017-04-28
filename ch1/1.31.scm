; Sum recursive
(define (sum-rec term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-rec term (next a) next b))))

; Sum iterative
(define (sum-it term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

; Product recursive
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))

; Product iterative
(define (product-it term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (inc x) (+ x 1))
(define (identity x) x)

(define (fact-rec n)
  (product-rec identity 1 inc n))

(fact-rec 0)
;=> 1

(fact-rec 1)
;=> 1

(fact-rec 2)
;=> 2

(fact-rec 3)
;=> 6

(fact-rec 4)
;=> 24

(define (fact-it n)
  (product-it identity 1 inc n))

(fact-it 0)
;=> 1

(fact-it 1)
;=> 1

(fact-it 2)
;=> 2

(fact-it 3)
;=> 6

(fact-it 4)
;=> 24

(define (wallis-pi n)
  (define (term a)
    (/ (* 4 (square a))
       (- (* 4 (square a)) 1)))
  (* (product-rec term 1 inc n)
      2.0))

(wallis-pi 10)
;=> 3.067703806643499

(wallis-pi 1000)
;=> 3.1408077460303945

(wallis-pi 10000)
;=> 3.141514118681922
