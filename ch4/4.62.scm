(rule (last-pair (?x) (?x)))

(rule (last-pair (?x . ?y) (?z))
      (last-pair ?y (?z)))

;;; Query input:
(last-pair (3) ?x)

;;; Query results:
(last-pair (3) (3))

;------------------

;;; Query input:
(last-pair (1 2 3) ?x)

;;; Query results:
(last-pair (1 2 3) (3))

;------------------

;;; Query input:
(last-pair (2 ?x) (3))

;;; Query results:
(last-pair (2 3) (3))

; (last-pair ?x (3)) has infinite solutions:

;;; Query input:
(last-pair ?x (3))

;;; Query results:

;Aborting!: maximum recursion depth exceeded
