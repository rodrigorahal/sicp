(define (smooth f)
  (lambda (x)
    (/ (+ (f x)
          (f (+ x dx))
          (f (- x dx)))
    3)))

(define dx 0.1)

(define (n-smooth f n)
  (repeated (smooth f) n))

(define (square x) (* x x))

((smooth square) 2)
;=> 4.006666666666667
