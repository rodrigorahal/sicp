(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      items
      (cons (square (car items)) (square-list (cdr items)))))

(define (map-square-list items)
  (map square items))

(square-list (list 1 2 3 4))
;=> (1 4 9 16)

(map-square-list (list 1 2 3 4))
;=> (1 4 9 16)
