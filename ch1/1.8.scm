(define (square x) (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (newtons-approx guess x)
  (/ (+ (* 2 guess)
        (/ x (square guess)))
     3
  )
)

(define (cube x) (* x x x))

(define (cube-good-enough? guess x)
  (< (abs (- (- (cube guess)x ))) 0.001))

(define (cube-improve guess x)
  (newtons-approx guess x))

(define (cubert-iter guess x)
  (if (cube-good-enough? guess x)
      guess
      (cubert-iter (cube-improve guess x)
                    x)))

(cubert-iter 1.0 8)

;; ~ 2.0

(cubert-iter 1.5 5)

;; ~ 1.7099
