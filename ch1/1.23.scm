(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (next input)
  (if (= input 2)
      3
      (+ input 2)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (* 1000 (runtime))))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (* 1000 (runtime)) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (timed-prime-test start)
  (if (>= start end)
      0
      (if (odd? start)
          (search-for-primes (+ start 2) end)
          (search-for-primes (+ start 1) end))))

(search-for-primes 1000 1019)
;=> 1009 is prime
;=> 1013 is prime
;=> 1019 is prime

(search-for-primes 1000 1019)
;=> 1009 *** 0.
;=> 1013 *** 0.
;=> 1019 *** 0.

(search-for-primes 10000 10037)
;=> 10007 *** 0.
;=> 10009 *** 0.
;=> 10037 *** 0.

(search-for-primes 100000 100043)
;=> 100003 *** 0.
;=> 100019 *** 0.
;=> 100043 *** 0.

(search-for-primes 1000000 1000037)
;=> 1000003 *** 0.
;=> 1000033 *** 0.
;=> 1000037 *** 0.
