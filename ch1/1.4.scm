(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; Substitution model case b > 0 = #t:
; (define (a-plus-abs-b a b)
;   (+ a b))

; Substitution model case b > 0 = #f:
; (define (a-plus-abs-b a b)
;   (- a b))

;but b < 0 so it equals:
; (define (a-plus-abs-b a b)
;   (+ a |b|))
;

;Just as the name: a-plus-abs-b suggests.
