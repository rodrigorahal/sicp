(define (make-vector xcor ycor)
  (cons xcor ycor))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect v w)
  (make-vector (+ (xcor-vect v) (xcor-vect w))
               (+ (ycor-vect v) (ycor-vect w))))

(define (sub-vect v w)
  (make-vector (- (xcor-vect v) (xcor-vect w))
               (- (ycor-vect v) (ycor-vect w))))

(define (scale-vect v s)
  (make-vector (* s (xcor-vect v))
               (* s (ycor-vect v))))

(define v (make-vector 0 0))

(define w (make-vector 1 1))

(define u (make-vector 2 3))

w
;=> (1 . 1)

(xcor-vect w)
;=> 1

(ycor-vect u)
;=> 3

(add-vect v w)
;=> (1 . 1)

(add-vect w u)
;=> (3 . 4)

(sub-vect u w)
;=> (1 . 2)

(scale-vect w 2)
;=> (2 . 2)

(scale-vect u 5)
;=>(10 . 15)
