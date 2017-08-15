(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))

; interleave makes a recursive call to pairs. Without the first element
; previously computed the recursive call will never return.
