(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define s (cons-stream 1 (add-streams s s)))

; the same as double

(stream-car (stream-cdr s))
;=> 2

(stream-car (stream-cdr (stream-cdr s)))
;=> 4
