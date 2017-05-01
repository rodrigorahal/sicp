(define (cons x y)
  (lambda (m) (m x y)))
; returns an one arg procedure

(define (car z)
  (z (lambda (p q) p)))


; Applying the substitution model for (car (cons x y))

; (car (cons x y))
; (car (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) p))
; ((lambda (p q) q) x y)
;=> x

(define (cdr z)
  (z (lambda (p q) q)))

; (cdr (cons x y))
; (cdr (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) q))
; ((lambda (p q) q) x y)
;=> y

(car (cons 2 3))
;=> 2

(cdr (cons 2 3))
;=> 3
