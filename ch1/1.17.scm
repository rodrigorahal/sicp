;; Exponentiation logarithmic recursion
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; Multiplication recursive
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

;: a * b = 2 * (a * b/2) if b is even
;: a * b = a + a * (b - 1) if b is odd

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(fast-mult 2 3)
(fast-mult 5 30)
