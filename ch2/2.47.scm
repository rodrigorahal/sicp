(load "2.46.scm")

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cadr (cdr frame)))

(origin-frame (make-frame v w u))
;=> (0 . 0)

(edge1-frame (make-frame v w u))
;=> (1 . 1)

(edge2-frame (make-frame v w u))
;=> (2 . 3)

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (cdr (cdr frame)))

(origin-frame (make-frame v w u))
;=> (0 . 0)

(edge1-frame (make-frame v w u))
;=> (1 . 1)

(edge2-frame (make-frame v w u))
;=> (2 . 3)
