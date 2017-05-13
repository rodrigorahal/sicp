(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define a (make-branch 1 10))

(define b (make-branch 2 5))

(define m (make-mobile a b))

(define c (make-branch 2.5 m))

(define d (make-branch 2.5 15))

(define e (make-branch 1 15))

(define n (make-mobile c d))

(define o (make-mobile c e))

(branch-length a)
;=> 1
(branch-structure a)
;=> 10

(branch-length b)
;=> 2
(branch-structure b)
;=> 5

(left-branch m)

(branch-length (left-branch m))
;=> 1

(branch-structure (left-branch m))
;=> 10

(branch-structure c)
;=> ((1 10) (2 5))

(branch-length c)
;=> 2.5


(define (ismobile? branch)
  (pair? (branch-structure branch)))

(ismobile? (left-branch m))
;=> #f

(ismobile? m)
;=> #t

(define (branch-weight branch)
  (cond ((null? (branch-structure branch)) 0)
        ((not (ismobile? branch)) (branch-structure branch))
        (else (+ (branch-weight (left-branch (branch-structure branch)))
                 (branch-weight (right-branch (branch-structure branch)))))))

(branch-weight (left-branch n))
;=> 15

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(total-weight m)
;=> 15

(total-weight n)
;=> 30

(define (balanced? mobile)
  (cond ((and (not (ismobile? (left-branch mobile)))
              (not (ismobile? (right-branch mobile))))
         (equal-torques? mobile))
        ((and (ismobile? (left-branch mobile))
              (not (ismobile? (right-branch mobile))))
         (and (equal-torques? mobile)
              (balanced? (branch-structure (left-branch mobile)))))
        ((and (not (ismobile? (left-branch mobile)))
              (ismobile? (right-branch mobile)))
         (and (equal-torques? mobile)
              (balanced? (branch-structure (right-branch mobile)))))
        (else (and (equal-torques? mobile)
                   (balanced? (branch-structure (left-branch mobile)))
                   (balanced? (branch-structure (right-branch mobile)))))))

(define (equal-torques? mobile)
  (= (branch-torque (left-branch mobile))
     (branch-torque (right-branch mobile))))

(define (branch-torque branch)
  (* (branch-length branch) (branch-weight branch)))

(equal-torques? m)
;=> #t

(equal-torques? n)
;=> #t

(equal-torques? o)
;=> #f

(balanced? m)
;=> #t

(balanced? n)
;=> #t

(balanced? o)
;=> #f

; If we were to change our implementation of the constructors to use pairs
; instead of lists:

; (define (make-mobile left right)
;   (cons left right))
; (define (make-branch length structure)
;   (cons length structure))

; We would only need to change our implementations of the selectors to:

; (define (left-branch mobile)
;   (car mobile))

; (define (right-branch mobile)
;   (cdr mobile))

; (define (branch-length branch)
;   (car branch))

; (define (branch-structure branch)
;   (cdr branch))

; Because of our abstration barrier.
