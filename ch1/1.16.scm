;; Square
(define (square x) (* x x))

;; Linear recursion
(define (expt-recur b n)
  (if (= n 0)
      1
      (* b (expt-recur b (- n 1)))))

;; Linear iteration
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                (- counter 1)
                (* b product))))

;: (expt-iter 3 4 1)
;: (expt-iter 3 3 3)
;: (expt-iter 3 2 9)
;: (expt-iter 3 1 27)
;: (expt-iter 3 0 81)

;; Logarithmic recursion
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;: (fast-expt 3 4)
;: (square (fast-expt 3 2))
;: (square (square (fast-expt 3 1)))
;: (square (square (* 3 (fast-expt 3 0))))
;: (square (square (* 3 1)))
;: (square (square 3))
;: (square 9)
;: 81

(define (even? n)
  (= (remainder n 2) 0))

;; Logarithmic iterative
(define (fast-expt-it b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b counter a)
  (cond ((= counter 0) a)
        ((even? counter) (fast-expt-iter (square b) (/ counter 2) a))
        (else (fast-expt-iter b (- counter 1) (* b a)))))

(fast-expt-it 2 6)
;: (fast-expt-it 2 6)
;: (fast-expt-iter 2 6 1)
;: (fast-expt-iter 4 3 1)
;: (fast-expt-iter 4 2 4)
;: (fast-expt-iter 16 1 4)
;: (fast-expt-iter 16 0 64)
;: 64
