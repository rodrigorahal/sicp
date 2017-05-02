(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (width-interval x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; Let's apply the substitution model to (width-interval (add-interval x y))

; (width-interval (add-interval x y))
; (width-interval (make-interval (+ (lower-bound x) (lower-bound y))
;                                (+ (upper-bound x) (upper-bound y))))

; the call to make-interval will return an interval with
; lower-bound = (+ (lower-bound x) (lower-bound y))
; upper-bound = (+ (upper-bound x) (upper-bound y))
; let's call this interval z

; (width-interval z)
; (/ (- (upper-bound z)
;       (lower-bound z))
;  2)
; (/ (- (+ (upper-bound x) (upper-bound y))
;       (+ (lower-bound x) (lower-bound y)))
;  2)

; reorganizing the subtraction
; (/ (+ (- (upper-bound x) (lower-bound x)
;       (- (upper-bound y) (lower-bound y))))
;  2)

; that equals
; (+ (width-interval x) (width-interval y))

; Q.E.D

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define a (make-interval 2 4))
(define b (make-interval 5 10))
(define c (make-interval 10 15))

(width-interval (mul-interval a b))
;=> 15.

(width-interval (mul-interval a c))
;=> 20.

; Altough b and c have the same width (2.5)
; The intervals resulted in the multiplication with a have different widths
; This means that the width of the product of two intervals
; cannot be a function of only the widths of the operands.
