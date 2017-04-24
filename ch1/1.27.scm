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

; Numbers that fool the Fermat test are called Carmichael numbers,
; and little is known about them other than that they are extremely rare.
; There are 255 Carmichael numbers below 100,000,000.
; The smallest few are 561, 1105, 1729, 2465, 2821, and 6601.

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


(define (fermat-test n a)
    (= (expmod a n n) a))

(define (carmichael-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n times) (carmichael-prime? n (- times 1)))
        (else false)))

(prime? 561)
;=> #f

(carmichael-prime? 561 560)
;=> #t

(prime? 1105)
;=> #f

(carmichael-prime? 1105 1104)
;=> #t

(prime? 1729)
;=> #f

(carmichael-prime? 1729 1728)
;=> #t

(prime? 2465)
;=> #f

(carmichael-prime? 2465 2464)
;=> #t

(prime? 2821)
;=> #f

(carmichael-prime? 2821 2820)
;=> #t

(prime? 6601)
;=> #f

(carmichael-prime? 6601 6600)
;=> #t
