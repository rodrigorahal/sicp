(define (scale-tree tree factor)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(define (map-scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (map-scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree))

(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))


(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;=> (1 (4 (9 16) 25) (36 49))

(define (map-square-tree tree)
  (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (map-square-tree sub-tree)
            (* sub-tree sub-tree)))
       tree))

(map-square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
;=> (1 (4 (9 16) 25) (36 49))
