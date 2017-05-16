(load "2.46.scm")

(define (make-segment v w)
  (cons v w))

(define (start-segment sgmt)
  (car sgmt))

(define (end-segment sgmt)
  (cdr sgmt))

(make-segment v w)
;=> ((0 . 0) . (1 . 1))

(start-segment (make-segment v w))
;=> (0 . 0)

(end-segment (make-segment v w))
;=> (1 . 1)
