(load "2.2.scm")
; point and segment constructors and selectors

(load "2.3support.scm")
; support procedures: is-horizontal?, is-vertical?, is-equals-point?, sub-point

; reactangle constructor from horizontal/vertical segments
(define (make-rectangle a b)
  (cond ((not (is-horizontal? a))
         (error "First segment must be horizontal"))
        ((not (is-vertical? b))
         (error "Second segment must be vertical"))
        ((not (is-equals-point? (end-segment a)
                                (start-segment b)))
         (error "End of first segment must be equal to start of second segment"))
        (else (cons a b))))

(define rect-one (make-rectangle (make-segment (make-point 0 0 ) (make-point 2 0))
                                 (make-segment (make-point 2 0) (make-point 2 1))))

(define (length-segment segment)
  (let ((sub (sub-point (end-segment segment) (start-segment segment))))
    (if (= (x-point sub) 0)
        (abs (y-point sub))
        (abs (x-point sub)))))

(define (perimeter-rectangle rect)
  (+ (* 2 (length-segment (car rect)))
     (* 2 (length-segment (cdr rect)))))

(perimeter-rectangle rect-one)
;=> 6

(define (area-rectangle rect)
  (* (length-segment (car rect))
     (length-segment (cdr rect))))

(area-rectangle rect-one)
;=> 2

; reactangle constructor from opposite corner points
(define (make-rectangle-corners a b)
  (cond ((is-equals-point? a b) (error ("Corner points must be different")))
        (else (cons (make-segment a
                                  (make-point (x-point b) (y-point a)))
                    (make-segment b
                                  (make-point (x-point b) (y-point a)))))))

(define rect-two (make-rectangle-corners (make-point 0 0) (make-point 2 1)))

(perimeter-rectangle rect-two)

(area-rectangle rect-two)

; rectangle from base point, base-length, height-lenght
(define (make-rectangle-p-dx-dy a dx dy)
  (let ((base (make-segment a
                            (make-point (+ (x-point a) dx)
                                        (y-point a))))
        (height (make-segment a
                              (make-point (x-point a)
                                          (+ (y-point a) dy)))))
   (cons base height)))

(define rect-three (make-rectangle-p-dx-dy (make-point 0 0) 2 1))

(perimeter-rectangle rect-three)
;=> 6

(area-rectangle rect-three)
;=> 2
