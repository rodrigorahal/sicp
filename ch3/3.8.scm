(define (make-f state)
  (lambda (num)
    (set! state (* num state))
    state))

(define f (make-f 1))

(+ (f 0) (f 1))
;=> 0

(define g (make-f 1))


; When zero (f 0) gets evaluated first:
(f 0)
;=> 0

(f 1)
;=> 0

; Hence:
; (+ (f 0) (f 1)) equals 0 when evaluated left-to-right

; When zero (f 1) gets evaluated first:
(g 1)
;=> 1

(g 0)
;=> 0

; Hence:
; (+ (f 0) (f 1)) equals 1 when evaluated right-to-left
