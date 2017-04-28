; golden_ratio = (1 + sqrt(5)) ~ 1.6180

(define tolerance 0.0001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (one-plus-one-over-x x) (+ 1 (/ 1 x)))

(fixed-point one-plus-one-over-x 1.0)
;=> 1.6180555555555556

; The golden ratio is the fixed-point of (1 + 1/x)
