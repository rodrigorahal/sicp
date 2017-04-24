(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (expmod-lisp-hacker base exp m)
 (remainder (fast-expt base exp) m))

 (define (fast-expt b n)
   (cond ((= n 0) 1)
         ((even? n) (square (fast-expt b (/ n 2))))
         (else (* b (fast-expt b (- n 1))))))

 (define (even? n)
   (= (remainder n 2) 0))

; expmod-lisp-hacker works but perfoms really poorly when compared to expmod
; see footnote #46
