(load "ch4-leval.scm")

(define count 0)
(define (id x)
  (set! count (+ count 1))
  x)

(define w (id (id 10)))
;;; L-Eval input:
count
;;; L-Eval value:
;=> 1
;;; L-Eval input:
w
;;; L-Eval value:
;=> 10
;;; L-Eval input:
count
;;; L-Eval value:
;=> 2

; The first value of count is 1 is because when w is defined the value of w is
; an application of the procedure id.

; Evaluating the value of w causes the delayed operand (id 10) to be forced,
; mutating the value of count to become 2 and returning the value 10.
