(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (percent i)
  (* (/ (width i) (center i)) 100))

; It's possible to show that the multiplication of two intervals x and y
; with all bounds positives is (make-interval (* (lower-bound x) (lower-bound y)
;                                                (upper-bound x) (upper-bound y))
; see exercise 2.11

; If x and y are constructed via make-center-percentage:
; (lower-bound x) equals (* cx (- 1 px))
; (upper-bound x) equals (* cx (+ 1 px))

; Then the multiplication between lower bounds becomes:

; (* (lower-bound x) (lower-bound y))
; (* (* cx (- 1 px)) (* cy (- 1 py)))
; reorganizing
; (* (* cx cy) (* (- 1 (+ px py) (- (* px py)))))
; if px and py are both small then pxpy << px and py
; (* (* cx cy) (* (- 1 (+ px py) )))

; (cx - px * cx) * (cy - py * cy)
; cx * (1 - px) * cy * (1 - py)
; cx * cy * (1 - px) * (1 - py)
; cx * cy * (1 - py - px + pxpy)

; analogous the upper bound becomes
; (* (* cx cy) (* (+ 1 (+ px py))))

; Finally:
; The center of the product of the two intervals is cxcy,
; and the percent tolerance is (px + py).
; The approximate percentage tolerance of the product of the two intervals
; is the sum of the tolerances of the two factors.
(define a (make-center-percent 5 2))

(define b (make-center-percent 10 3))

(define c (mul-interval a b))

(percent c)
;=> ~ 5.0
