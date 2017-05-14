(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;(accumulate append
;            '()
;            (map (lambda (i)
;                   (map (lambda (j) (list i j))
;                        (enumerate-interval 1 (- i 1))))
;                 (enumerate-interval 1 6)))


(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(unique-pairs 2)
;=> (2 1)

(unique-pairs 3)
;=> ((2 1) (3 1) (3 2))

(unique-pairs 4)
;=> ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 6)
;=> ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))
