(define (iterative-improvement good-enough? improve)
  (define (try guess)
    (if (good-enough? guess)
        guess
        (try (improve guess))))
  try
)

(define (average x y)
  (/ (+ x y) 2))

(average 1.0 9.0)

(define (square x)
  (* x x))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improvement good-enough? improve) 1.0))

(sqrt 9)
;=> 3.00009155413138

(sqrt (+ 100 37))
;=> 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
;=> 1.7739279023207892

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- (improve guess) guess)) tolerance))
  (define (improve guess) (f guess))
  ((iterative-improvement close-enough? improve) first-guess))

(fixed-point cos 1.0)
;=> .7390822985224023

(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)
;=> 1.2587228743052672
