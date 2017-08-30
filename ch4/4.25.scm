(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(define (factorial n)
  (unless (= n 1)
          (* n (factorial (- n 1)))
          1))

; (factorial 1)
; (unless (= n 1) (* 1 (factorial 0)) 1)

; in applicative-order (factorial 0) will be evaluated before unless can be
; evaluated, so it will never return

; in normal-order (factorial 0) will be defered and will never be needed
; so it's fine
