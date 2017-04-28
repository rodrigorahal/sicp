(define (cont-frac n d k)
  (define (frac i)
     (if (< i k)
         (/ (n i) (+ (d i) (frac (+ i 1))))
         (/ (n i) (d i))))
  (frac 1))

(define (tan-cf x k)
  (cont-frac (lambda (i)
              (if (= i 1)
                  x
                  (- (* x  x))))
             (lambda (i) (- (* 2 i) 1))

              k))

(define pi 3.14159265359)

(tan-cf (/ pi 4) 10)
;=> ~1.0

(tan (/ pi 4))

(tan-cf (/ pi 6) 10)
;=> ~0.5773

(tan (/ pi 6))
;=> 0.5773502691896718
