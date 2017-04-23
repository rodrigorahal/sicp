;; Exponentiation Logarithmic iterative
(define (fast-expt-it b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b counter a)
  (cond ((= counter 0) a)
        ((even? counter) (fast-expt-iter (square b) (/ counter 2) a))
        (else (fast-expt-iter b (- counter 1) (* b a)))))

;; Multiplication iterative
(define (mult-it a b)
  (mult-iter a b 0))

(define (mult-iter a counter product)
  (if (= counter 0)
      product
      (mult-iter a
                 (- counter 1)
                 (+ product a))))

(mult-it 2 3)
; Substitution model for mult-it
; (mult-it 2 3)
; (mult-iter 2 3 0)
; (mult-iter 2 2 2)
; (mult-iter 2 1 4)
; (mult-iter 2 0 6)
;=> 6

; The invariant maintained throughout the iterations is:
; inv = a * b + product
; we take advantage of the fact that a * b = 2 * (a * b/2) if b is even

;; Fast Multiplication iterative with double and halve

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (fast-mult-it a b)
  (fast-mult-iter a b 0))

(define (fast-mult-iter a counter product)
  (cond ((= counter 0) product)
        ((even? counter) (fast-mult-iter (double a) (halve counter) product))
        (else (fast-mult-iter a (- counter 1) (+ product a)))))

(fast-mult-it 2 3)
; Substitution model for fast-mult-it
; (fast-mult-iter 2 3 0)
; (fast-mult-iter 2 2 2)
; (fast-mult-iter 4 1 2)
; (fast-mult-iter 4 0 6)
;=> 6
