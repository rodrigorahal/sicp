(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))


(lower-bound (sub-interval (make-interval 3.5 4.5)
                           (make-interval 2.5 3.5)))
;=> 0.0

(upper-bound (sub-interval (make-interval 3.5 4.5)
                           (make-interval 2.5 3.5)))
;=> 2.0
