(define (display-line x)
  (newline)
  (display x))

(define (show x)
  (display-line x)
  x)

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define x (stream-map show (stream-enumerate-interval 0 10)))
(stream-ref x 5)
(stream-ref x 7)

; first we start by constructing a stream interval from 0 to 10 via cons-stream
; (cons 0 (delay stream-enumerate-interval 1 10))
; then we apply stream-map with the procedure show and the previously
; constructed stream, which leads to:
; (cons (show (stream-car s)) (delay (stream-map show (stream-cdr s))))
; that makes a call to (show (stream-car s)) while delaying the rest of the
; stream-map.
; So the first printed value before the calls to (stream-ref) is 0.
; Then (stream-ref x 5) gets called
; leading to a call to (stream-cdr s) in the recursive (stream-ref) call
;which forces (delay (stream-map show (stream-cdr s))) to be evaluated
; printing the values 1, 2, 3, 4 in sequence to the screen until n evaluates to
; 0 printing 5 to the screen before calling (stream-ref x 7)
; the process continues after the new (stream-ref) call printing 6 and 7
