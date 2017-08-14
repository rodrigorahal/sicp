(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))

(define (show x)
  (display-line x)
  x)
(define (display-line x)
  (newline)
  (display x))
(define (show-stream s n)
  (if (zero? n)
      (display-line "done")
      (begin
        (show (stream-car s))
        (show-stream (stream-cdr s) (- n 1) ))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

(define (integrate-series s)
  (stream-map / s integers))

(show-stream (integrate-series ones) 10)

(define cosine-series
  (cons-stream 1 (integrate-series ine-series)))
(define sine-series
  (cons-stream 0 (scale-stream (integrate-series cosine-series) -1)))
