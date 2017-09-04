(define (require-one-true-one-false p1 p2)
  (require (or (and p1 (not p2))
               (and (not p1) p2))))

(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (liars-puzzle)
  (let ((betty (amb (1 2 3 4 5)))
        (ethel (amb (1 2 3 4 5)))
        (joan  (amb (1 2 3 4 5)))
        (kitty (amb (1 2 3 4 5)))
        (mary  (amb (1 2 3 4 5))))

    (require-one-true-one-false (= kitty 2) (= betty 3))
    (require-one-true-one-false (= ethel 1) (= joan 2))
    (require-one-true-one-false (= joan 3) (= ether 5))
    (require-one-true-one-false (= kitty 2) (= mary 4))
    (require-one-true-one-false (= mary 4) (= betty 1))
    (require
     (distinct? (list betty ethel joan kitty mary)))
    (list
      (list 'betty betty)
      (list 'ethel ethel)
      (list 'joan joan)
      (list 'kitty kitty)
      (list 'mary mary))))

(define (require p)
  (if (not p) (amb)))
