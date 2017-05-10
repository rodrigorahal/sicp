(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

(square-list (list 1 2 3 4))
;=> (16 9 4 1)

; The answer is in reversed order because items is traversed in normal order
; with answer beggining with nill, after each step (square (car things))
; is linked to car of the new answer pushing the earlier items
; to the cdr of the new answer

(define (alt-square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(alt-square-list (list 1 2 3 4))
;=> ((((() . 1) . 4) . 9) . 16)

; With this new implementation items is still traversed in normal order
; with answer still beggining with nil, but after each step _answer_ is linked
; to the car of the new answer and (square (car things)) is linked to the cdr
; of the new answer thus creating a pair
