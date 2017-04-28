(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline) (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (f x) (/ (log 1000) (log x)))

(fixed-point f 2.0)
;=> 4.555532270803653

(expt 4.555532270803653 4.555532270803653)
;=> 999.9913579312362


(define (average x y) (/ (+ x y) 2))

(fixed-point (lambda (x) (average x (f x)))
             2.0)
;=> 4.555537551999825

(expt 4.555537551999825 4.555537551999825)
;=> 1000.0046472054871
