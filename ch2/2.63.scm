(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

; Trees from figure 2.16

(define a '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))

(define b '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))

(define c '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))

(tree->list-1 a)
;=> (1 3 5 7 9 11)

(tree->list-1 b)
;=> (1 3 5 7 9 11)

(tree->list-1 c)
;=> (1 3 5 7 9 11)

(tree->list-2 a)
;=> (1 3 5 7 9 11)

(tree->list-2 b)
;=> (1 3 5 7 9 11)

(tree->list-2 c)
;=> (1 3 5 7 9 11)

; These two procedures will produce the same results for every tree.
; tree->list-1 has order of growth proportional to O(nlogn) because of the call
; to append.
; tree->list-2 has order of growth proportional to O(n), one call to cons per
; recursive call.
