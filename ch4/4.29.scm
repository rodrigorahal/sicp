(define (id x)
  (set! count (+ count 1))
  x)

(define (square x)
  (* x x))

;;; L-Eval input:
(square (id 10))
;;; L-Eval value:
100
;;; L-Eval input:
count
;;; L-Eval value:
1

; For the memoized version the count is 1 but for the non-memoized version the
; count is 2 because (id 10) gets evaluated two times inside square.
