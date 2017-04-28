; golden_ratio = (1 + sqrt(5)) ~ 1.6180
; 1/golden_ratio = 0.6180

(define (cont-frac n d k)
  (define (frac i)
     (if (< i k)
         (/ (n i) (+ (d i) (frac (+ i 1))))
         (/ (n i) (d i))))
  (frac 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
;=> ~ 0.6180

(define (cont-frac-it n d k)
  (define (frac-iter i result)
    (if (= i 0)
        result
        (frac-iter (- i 1) (/ (n i) (+ (d i) result)))
        ))
  (frac-iter k (/ (n k) (d k)))
)

(cont-frac-it (lambda (i) 1.0)
              (lambda (i) 1.0)
              10)
;=> 0.6180
