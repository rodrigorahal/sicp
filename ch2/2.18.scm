(define odds (list 1 3 5 7))
(define squares (list 1 4 9 16 25))

(define (last-item items)
  (list-ref items
            (- (length items) 1)))

(define (minus-last-item items)
  (if (= (length items) 1)
      (list)
      (cons (car items) (minus-last-item (cdr items)))))

(define (reverse items)
  (if (null? items)
      (list)
      (cons (last-item items) (reverse (minus-last-item items)))))

(minus-last-item odds)
;=> (1 3 5)

(minus-last-item squares)
;=> (1 4 9 16)

(reverse odds)
;=> (7 5 3 1)

(reverse squares)
;=> (25 16 9 4 1)

(define (alt-reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(alt-reverse odds)
;=> (1 4 9 16)

(alt-reverse squares)
;=> (25 16 9 4 1)
