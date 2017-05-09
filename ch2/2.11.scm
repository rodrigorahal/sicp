(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Testing the signs of the endpoints of intervals to simplify mul-interval
; Let's define some variables to simplify the math

; let a = (lower-bound x)
; let b = (upper-bound x)
; by definition a < b

; let c = (lower-bound y)
; let d = (upper-bound y)
; by definition c < d

; let p1, p2, p3 and p4 be defined as in mul-interval:

; let p1 = a * c
; let p2 = a * d
; let p3 = b * c
; let p4 = b * d

; The nine possible cases are:

; 1) a > 0 and c > 0 (therefore b > 0 and d d > 0)
; 2) a < 0 and b < 0; c < 0 and d < 0

; 3) a > 0 and b > 0; c < 0 and d > 0
; 4) a > 0 and b > 0; c < 0 and d < 0
; 5) a < 0 and b > 0; c > 0 and d > 0
; 6) a < 0 and b < 0; c > 0 and d > 0

; 7) a < 0 and b > 0; c < 0 and d < 0
; 8) a < 0 and b < 0; c < 0 and d > 0

; 9) a < 0 and b > 0; c < 0 and d > 0

; case 1: a > 0 and b > 0; c > 0 and d > 0:
; p1, p2, p3 and p4 are all positive
; p1 < p2 because c < d by definition
; p1 < p3 because a < b by definition
; p3 < p4 because c < d by definition
; therefore p1 equals (min p1 p2 p3 p4)
; analogously p4 equals (max p1 p2 p3 p4)

; case 2: a < 0 and b < 0; c < 0 and d < 0:
; p1, p2, p3 and p4 are all positive
; p1 > p2 because c < d by definition
; p1 > p3 because a < b by definition
; p3 > p4 because c < d by definition
; therefore p1 equals (max p1 p2 p3 p4)
; analogously p4 equals (min p1 p2 p3 p4)

; case 3: a > 0 and b > 0; c < 0 and d > 0:
; p1 and p3 are negative; p2 and p4 are positive
; p3 < p1 because a < b by definition
; p4 > p2 because a < b by definition
; therefore p3 equals (min p1 p2 p3 p4)
; and p4 equals (max p1 p2 p3 p4)

; case 4: a > 0 and b > 0; c < 0 and d < 0:
; p1, p2, p3 and p4 are all negative
; p1 < p2
; p3 < p1
; p3 < p4
; therefore p3 equals (min p1 p2 p3 p4)
; analogously p2 equals (max p1 p2 p3 p4)

; case 5 a < 0 and b > 0; c > 0 and d > 0:
; p1 and p2 are negative
; p3 and p4 are positive
; p2 equals (min p1 p2 p3 p4)
; p4 equals (max p1 p2 p3 p4)

; case 6 a < 0 and b < 0;  c > 0 and d > 0:
; p1, p2, p3, p4 are all negative
; p2 < p1 because c < d
; p2 < p4 because a < b
; p4 < p3 because c < d
; p2 equals (min p1 p2 p3 p4)
; p3 equals (max p1 p2 p3 p4)

; case 7 a < 0 and b > 0; c < 0 and d < 0:
; is analogous to case 5:
; p1 and p2 are positive
; p3 and p4 are negative
; p3 equals (min p1 p2 p3 p4)
; p1 equals (max p1 p2 p3 p4)

; case 8 a < 0 and b < 0; c < 0 and d > 0:
; p1 and p3 are positive
; p2 and p4 are negative
; p1 > p3
; p2 < p4
; p2 equals (min p1 p2 p3 p4)
; p1 equals (max p1 p2 p3 p4)

; case 9 a < 0 and b > 0; c < 0 and d > 0:
; p1 > 0 and p3 > 0
; p2 < 0 and p4 < 0
; requires more than two multiplications

(define (alt-mult-interval x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (cond ((and (> a 0) (> b 0) (> c 0) (> d 0)) (make-interval (* a c) (* b d)))
          ((and (< a 0) (< b 0) (< c 0) (< d 0)) (make-interval (* b d) (* a c)))
          ((and (> a 0) (> b 0) (< c 0) (> d 0)) (make-interval (* b c) (* b d)))
          ((and (> a 0) (> b 0) (< c 0) (< d 0)) (make-interval (* b c) (* a d)))
          ((and (< a 0) (> b 0) (> c 0) (> d 0)) (make-interval (* a d) (* b d)))
          ((and (< a 0) (< b 0) (> c 0) (> d 0)) (make-interval (* a d) (* b c)))
          ((and (< a 0) (> b 0) (< c 0) (< d 0)) (make-interval (* b c) (* a c)))
          ((and (< a 0) (< b 0) (< c 0) (> d 0)) (make-interval (* a d) (* a c)))
          (else (make-interval (min (* a d) (* b c))
                               (max (* a c) (* b d)))))))

(define one (make-interval 2 4))
(define two (make-interval -2 4))
(define three (make-interval -4 -2))

(alt-mult-interval one one)
;=> (4 . 16)

(alt-mult-interval one two)
;=> (-8 . 16)

(alt-mult-interval one three)
;=> (-16 . -4)

(alt-mult-interval two one)
;=> (-8 . 16)

(alt-mult-interval two two)
;=> (-8 . 16)

(alt-mult-interval two three)
;=> (-16 . 8)

(alt-mult-interval three one)
;=> (-16 . -4)

(alt-mult-interval three two)
;=> (-16 . 8)

(alt-mult-interval three three)
;=> (4 . 16)
