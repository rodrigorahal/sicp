(load "load-eceval.scm")

(define the-global-environment (setup-environment))

(start eceval)

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

;;; EC-Eval input:
(fib 2)

(total-pushes = 72 maximum-depth = 13)
;;; EC-Eval value:
1

;;; EC-Eval input:
(fib 3)

(total-pushes = 128 maximum-depth = 18)
;;; EC-Eval value:
2

;;; EC-Eval input:
(fib 4)

(total-pushes = 240 maximum-depth = 23)
;;; EC-Eval value:
3

; maximum-depth: 5n + 3

; S(n) = S(n-1) + S(n-2) + k
; S(4) = S(3) + S(2) + k
; 240 = 128 + 72 + k
; 240 = 200 + k
; k = 40

; S(n) = a * Fib(n+1) + b

; S(2) = aFib(3) + b
; 72 = 2a + b

; S(3) = aFib(4) + b
; 128 = 3a + b

; Solving for a and b:


; a = 56
; b = -40

; S(n) = 56 * Fib(n+1) - 40

; S(4) = 56 * Fib(5) - 40
; S(4) = 56 * 5 - 40
; S(4) = 240 as shown by the eceval
