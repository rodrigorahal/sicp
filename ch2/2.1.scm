(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (define (maker n d)
    (let ((g (gcd (abs n) (abs d))))
      (cons (/ n g) (/ d g))))
  (if (< d 0)
      (maker (- n) (- d))
      (maker n d))

(print-rat (make-rat 1 3))
;=> 1/3

(print-rat (make-rat 1 (- 3)))
;=> -1/3

(print-rat (make-rat (- 1) 3))
;=> -1/3

(print-rat (make-rat (- 1) (- 3)))
;=> 1/3
