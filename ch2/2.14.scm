(load "2.12.scm")

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (par1 r1 r2)
 (div-interval (mul-interval r1 r2)
               (add-interval r1 r2)))
(define (par2 r1 r2)
 (let ((one (make-interval 1 1)))
   (div-interval one
                 (add-interval (div-interval one r1)
                               (div-interval one r2)))))

(define A (make-center-percentage 100 5))
(define b (make-center-percentage 200 2))

(define a-divided-by-a (div-interval A A))

(center A-divided-by-A)
;=> 1.0050125313283207 (not 1.00 !!)

(percent A-divided-by-A)
;=> 9.97506234413964

(define A-divided-by-B (div-interval A B))

(center A-divided-by-B)
;=> .5007002801120448

(percent A-divided-by-B)
;=> 6.993006993006991

(define A-parallel-B-1 (par1 a b))
(define A-parallel-B-2 (par2 a b))

A-parallel-B-1
;=> (60.25889967637541 . 73.6082474226804)

A-parallel-B-2
;=> (63.986254295532646 . 69.32038834951456)

(define A-parallel-A-1 (par1 a a))
(define A-parallel-A-2 (par2 a a))

A-parallel-A-1
;=> (42.97619047619048 . 58.026315789473685)

A-parallel-A-2
;=> (47.5 . 52.49999999999999)
