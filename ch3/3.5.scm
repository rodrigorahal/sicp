(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (point-lies-in-circle? x y xc yc radius)
  (<= (+ (square (- xc x))
         (square (- yc y)))
      (square radius)))

(define (lies-in-unit-circle? x y)
  (point-lies-in-circle? x y 1 1 1))

(define (rect-area x1 x2 y1 y2)
  (* (- x2 x1) (- y2 y1)))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (test-rand-point)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (monte-carlo trials test-rand-point)
     (rect-area x1 x2 y1 y2)))

(estimate-integral lies-in-unit-circle? 0 2.0 0 2.0 100)
;=> ~3.4 (every run gives a different number, see random)

(estimate-integral lies-in-unit-circle? 0 2.0 0 2.0 1000)
;=> ~3.14
