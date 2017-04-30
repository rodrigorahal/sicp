(define (is-horizontal? segment)
  (= (y-point (start-segment segment))
     (y-point (end-segment segment))))

(is-horizontal? (make-segment (make-point 0 0) (make-point 1 0)))
;=> #t

(is-horizontal? (make-segment (make-point 0 0) (make-point 1 1)))
;=> #f

(define (is-vertical? segment)
  (= (x-point (start-segment segment))
     (x-point (end-segment segment))))

(is-vertical? (make-segment (make-point 0 0) (make-point 0 1)))
;=> #t

(is-vertical? (make-segment (make-point 0 0) (make-point 1 1)))
;=> #f

(define (is-equals-point? a b)
  (and (= (x-point a) (x-point b))
       (= (y-point a) (y-point b))))

(is-equals-point? (make-point 0 0) (make-point 0 0))

(is-equals-point? (make-point 0 0) (make-point 1 0))

(define (sub-point a b)
 (make-point (- (x-point a) (x-point b))
             (- (y-point a) (y-point b))))
