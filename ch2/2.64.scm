(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; The helper procedure partial-tree takes as arguments an integer n and list of
; at least n elements and constructs a balanced tree containing the first n
; elements of the list.

; The procedure assembles the tree by constructing a left-tree, a center elt and
; a right-tree

(list->tree '(1 3 5 7 9 11))
(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;               5
;              / \
;            1    9
;             \   / \
;              3 7  11

; The procedure only needs to visit each element of the list once, and it only
; performs a cons for each element it visits, so the number of steps is
; proportional to the size of the list, or O(n).
