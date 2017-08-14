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
; expand gives the digits of num/den in base radix (assuming num > den)
(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(expand 1 7 10) ; are the digits of 1/7 i.e. 1 4 2 8 5 7 1 4 ...
(expand 3 8 10) ; are the digits of 3/8 i.e. 3 7 5 0 0 0 0 ...
