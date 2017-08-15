(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1)
                  (stream-car s2))
               (add-streams (scale-stream (stream-cdr s1) (stream-car s2))
                            (mul-series (stream-cdr s1) s2))))

(define (invert-unit-series s)
  (cons-stream 1 (scale-stream (mul-series (stream-cdr s)
                                           (invert-unit-series s))
                               -1)))


(define (invert-series s)
  (let ((first-term (stream-car s)))
    (if (zero? first-term)
        (error ("First term can't be zero -- INVERT-SERIES"))
        (stream-scale (invert-unit-series (stream-scale s (/ 1 first-term)))
                      first-term))))
(define (div-series s1 s2)
  (mul-series s1 (invert-series s2)))

(define cosine-series
  (cons-stream 1 (integrate-series ine-series)))
(define sine-series
  (cons-stream 0 (scale-stream (integrate-series cosine-series) -1)))
(define tan-series
  (div-series sine-series cosine-series))
