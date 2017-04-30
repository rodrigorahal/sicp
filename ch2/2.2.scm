(define (make-point x y)
  (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (make-point 0 0))
;=> (0,0)

(print-point (make-point 1 0))
;=> (1,0)

(print-point (make-point 1 (- 1)))
;=> (1,-1)

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(print-point (start-segment (make-segment (make-point 0 0) (make-point 1 0))))
;=> (0,0)

(print-point (end-segment (make-segment (make-point 0 0) (make-point 1 0))))
;=> (1,0)

(define (midpoint-segment segment)
  (let ((sum (sum-point
                (start-segment segment)
                (end-segment segment))))
    (make-point (/ (x-point sum) 2)
                (/ (y-point sum) 2))))

(define (sum-point a b)
  (make-point (+ (x-point a) (x-point b))
              (+ (y-point a) (y-point b))))

(print-point (sum-point (make-point 1 0) (make-point 2 1)))
;=> (3,1)

(print-point (midpoint-segment (make-segment (make-point 1 0) (make-point 3 4))))
;=> (2,2)
