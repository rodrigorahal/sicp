(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.00001)

(define (cube x) (* x x x))

(define (square x) (* x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
              (* a (square x))
              (* b x)
              c)))
; cubic returns a procedure

(define (newton-transform g)
 (lambda (x)
   (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
 (fixed-point (newton-transform g) guess))

; x3 -x2 + x - 1 = 0

(newtons-method (cubic (- 1) 1 (- 1)) 0.8)
;=> 1.0
