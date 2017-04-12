(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

; =========
; a.  How many times is the procedure p applied when (sine 12.15) is evaluated?
; Applying the substitution model to:
(sine 12.15)

; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine 0.05))))))
; (p (p (p (p (p 0.05)))))
; ...

; p is applied 5 times which equals to how many times the angle needs to be
; divided by 3 until it reachs a number less than or equal to 0.1

; =========
; b.  What is the order of growth in space and number of steps
;    (as a function of a) used by the process generated by the
;    sine procedure when (sine a) is evaluated?

;  If we set t(a) to be the number of times the procedure p gets evaluated then
;  evaluating 3 times a requires only one more p evaluation. This shows that the
; order of growth in time in logarithmic. More formally we can show that the
; number of times p gets evaluated is log3 10a, i.e. the number of times we
; need to divide 10a by 3 until it gets below 1 that's the same as the number of
; times we need to divive a by 3 until it gets below 0.1.
; The order of growth in space is also proportional to the number of calls to p
; which is also logarithmic.
; TL;DR: O(log a)
