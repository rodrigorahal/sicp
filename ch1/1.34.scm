(define (f g)
  (g 2))

(f (lambda (z) (* z (+ z 1))))
;=> 6

; What happens if we (perversely) ask the interpreter
; to evaluate the combination (f f)?

; Let's apply the substitution model:
; (f f)
; (f 2)
; (2 2)
;=> Error: The object 2 is not applicable.
