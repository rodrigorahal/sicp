(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

((double inc) 2)
((lambda (x) (inc (inc x))) 2)
;=> 4

(((double (double double)) inc) 5)
;=> 21
