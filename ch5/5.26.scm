(load "load-eceval.scm")

(define the-global-environment (setup-environment))

(start eceval)

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

;;; EC-Eval input:
(factorial 1)

(total-pushes = 64 maximum-depth = 10)
;;; EC-Eval value:
1

;;; EC-Eval input:
(factorial 2)

(total-pushes = 99 maximum-depth = 10)
;;; EC-Eval value:
2

;;; EC-Eval input:
(factorial 3)

(total-pushes = 134 maximum-depth = 10)
;;; EC-Eval value:
6

;;; EC-Eval input:
(factorial 5)

(total-pushes = 204 maximum-depth = 10)
;;; EC-Eval value:
120


;; total-pushes = 35*n + 29 
