(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (divisble-by-3? n)
  (= (remainder n 3) 0))

(define (car z)
  (define (iter z a)
    (if (odd? z)
        a
        (iter (/ z 2) (+ a 1))))
  (iter z 0)
)

(define (cdr z)
  (define (iter z b)
    (if (not (divisble-by-3? z))
        b
        (iter (/ z 3) (+ b 1))))
  (iter z 0))

(car (cons 1 1))
;=> 1

(car (cons 2 1))
;=> 2

(car (cons 10 1))
;=> 10

(cdr (cons 1 1))
;=> 1

(cdr (cons 2 2))
;=> 2

(cdr (cons 3 10))
;=> 10
