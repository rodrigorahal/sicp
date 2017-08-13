(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x)
      (cv 32)))
(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

; x + y = z
(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

; x - y = z => y + z = x
(define (c- x y)
  (let ((z (make-connector)))
    (adder y z x)
    z))

; x * y = z
(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

; x/y = z => y * z = x
(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier y z x)
    z))
; x = z
(define (cv x)
  (let ((z (make-connector)))
    (constant x z)
    z))
