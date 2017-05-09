(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percentage c p)
  (make-center-width c (* c (/ p 100.0))))

(define (percent i)
  (* (/ (width i) (center i)) 100))

(define interval-one (make-center-percentage 6.8 10))

interval-one
;=> (6.12 . 7.48)

(percent interval-one)
;=> 10

(center interval-one)
;=> 6.8
