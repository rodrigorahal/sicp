;; Pascal's triangle.

;;
;;         1
;;       1   1
;;     1   2   1
;;   1   3   3   1
;; 1   4   6   4   1
;;        ...
;;

(define (pascal row col)
  (cond ((= row 0) 1)
        ((= col 0) 1)
        ((= row col) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)
        ))
  )
)

;; (pascal 2 1)
;; (+ (pascal 1 0) (pascal 1 1))
;; (+ 1 1)
;; Value: 2

;; (pascal 3 1)
;; (+ (pascal 2 0) (pascal 2 1))
;; (+ 1 (+ (pascal 1 0) (pascal 1 1)))
;; (+ 1 (+ 1 1))
;; (+ 1 2)
;; Value: 3

;; (pascal 3 2)
;; (+ (pascal 2 1) (pascal 2 2))
;; (+ (+ (pascal 1 0) (pascal 1 1)) 1)
;; (+ (+ 1 1) 1)
;; (+ 2 1)
;; Value: 3

;; Verifying the row = 4

(pascal 4 0)
;; Valeu: 1

(pascal 4 1)
;; Valeu: 4

(pascal 4 2)
;; Valeu: 6

(pascal 4 3)
;; Valeu: 4

(pascal 4 4)
;; Valeu: 1
