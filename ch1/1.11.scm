;; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3

;; Procedure that computes f(n) by means of a recursive process

(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
                 (* 2 (f-recursive (- n 2)))
                 (* 3 (f-recursive (- n 3)))))))

(f-recursive 2)
;; Value: 2

(f-recursive 3)
;; f(3) = f(2) + 2f(1) + 3f(0) = 2 + 2 + 0 = 4
;; Value: 4

(f-recursive 4)
;; f(4) = f(3) + 2f(2) + 3f(1)  = 4 + 4 + 3 = 11
;; Value: 11


;; Procedure that computes f(n) by means of a iterative process

;; Following the idea for the iterative process for computing Fibonacci numbers
;; Let's define a, b and c and initialize them to f(2)=2, f(1)=1 and f(0)=0
;; Them we apply the simultaneous transformations
;; a <-- a + 2b + c
;; b <-- a
;; c <-- b

(define (f-iterative n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

;; (f-iterative 0)
;; (f-iter 2 1 0 0) => 0

;; (f-iterative 1)
;; (f-iter 2 1 0 1)
;; (f-ter 4 2 1 0) => 1

;; (f-iterative 2)
;; (f-iter 2 1 0 2)
;; (f-iter 4 2 1 1)
;; (f-iter 11 4 2 0) => 2

;; (f-iterative 3)
;; (f-iter 2 1 0 3)
;; (f-iter 4 2 1 2)
;; (f-iter 11 4 2 1)
;; (f-iter 22 11 4 1) => 4

(f-iterative 4)
;; Value: 11

(= (f-recursive 5) (f-iterative 5))
;; #t
