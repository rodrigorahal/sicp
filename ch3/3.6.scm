;(define rand
;  (let ((x random-init))
;    (lambda ()
;      (newline) (display "x ") (display x)
;      (set! x (rand-update x))
;      x)))

(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))

(define (make-rand)
  (let ((x random-init))
    (define generate
      (lambda ()
        (newline) (display "x ") (display x)
        (set! x (rand-update x))
        x))
    (define (reset new-value)
      (set! x new-value)
      "Value reset")
    (define (dispatch m)
      (cond ((eq? m 'generate) (generate))
            ((eq? m 'reset) reset)
            (else (error "Unknown request -- MAKE-RAND"
                         m))))
    dispatch
  ))

(define random-init 7)
(define rand (make-rand))

(rand 'generate)
;=> x is 7
;=> random generated is 88

(rand 'generate)
;=> x is 88
;=> random generated is 116

(rand 'generate)
;=> x is 116
;=> random generated is 110

((rand 'reset) 0)
;=> Value reset

(rand 'generate)
;=> x is 0
;=> random generated is 26

(rand 'generate)
;=> x is 26
;=> random generated is 93
