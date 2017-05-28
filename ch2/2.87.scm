(define (=zero? x) (apply-generic '=zero? x))

; polynomials package
(put '=zero? '(polynomial) (lambda (p) (empty-termlist? p)))
