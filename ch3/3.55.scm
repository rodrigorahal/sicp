(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

(define (partial-sums stream)
  (cons-stream (stream-car stream) (add-streams (partial-sums stream) (stream-cdr stream))))

(define s (partial-sums integers))

(stream-car s)
;=> 1
(stream-car (stream-cdr s))
;=> 3
(stream-car (stream-cdr (stream-cdr s)))
;=> 6
(stream-car (stream-cdr (stream-cdr (stream-cdr s))))
;=> 10
