(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5))
        (cooper (amb 1 2 3 4 5))
        (fletcher (amb 1 2 3 4 5))
        (miller (amb 1 2 3 4 5))
        (smith (amb 1 2 3 4 5)))
    (require
     (distinct? (list baker cooper fletcher miller smith)))
    (require (not (= baker 5)))
    (require (not (= cooper 1)))
    (require (not (= fletcher 5)))
    (require (not (= fletcher 1)))
    (require (> miller cooper))
    (require (not (= (abs (- fletcher cooper)) 1)))
    (list (list 'baker baker)
          (list 'cooper cooper)
          (list 'fletcher fletcher)
          (list 'miller miller)
          (list 'smith smith))))

;;; Amb-Eval input:
(multiple-dwelling)

;;; Starting a new problem
;;; Amb-Eval value:
((baker 1) (cooper 2) (fletcher 4) (miller 3) (smith 5))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 1) (cooper 2) (fletcher 4) (miller 5) (smith 3))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 1) (cooper 4) (fletcher 2) (miller 5) (smith 3))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))

;;; Amb-Eval input:
try-again

;;; Amb-Eval value:
((baker 3) (cooper 4) (fletcher 2) (miller 5) (smith 1))

;;; Amb-Eval input:
try-again

;;; There are no more values of
(multiple-dwelling)

; 5 solutions
