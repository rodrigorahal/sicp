(define (fringe items)
  (cond ((null? items) items)
        ((not (pair? (car items))) (cons (car items) (fringe (cdr items))))
        (else (append (fringe (car items))
                      (fringe (cdr items))))
  )
)

(define x (list (list 1 2) (list 3 4)))
;=> ((1 2) (3 4))

(fringe x)
;=> (1 2 3 4)

(fringe (list x x))
