;(define (deriv exp var)
;  (cond ((number? exp) 0)
;        ((variable? exp) (if (same-variable? exp var) 1 0))
;        ((sum? exp)
;         (make-sum (deriv (addend exp) var)
;                   (deriv (augend exp) var)))
;        ((product? exp)
;         (make-sum
;           (make-product (multiplier exp)
;                         (deriv (multiplicand exp) var))
;           (make-product (deriv (multiplier exp) var)
;                         (multiplicand exp))))
;        <more rules can be added here>
;        (else (error "unknown expression type -- DERIV" exp))))

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; deriv receives an expression and dispatchs a deriv-procedure based on the
; operator. We can't assimilate the predicates number? and same-variable? into
; the data-directed dispatch because they are not based on operators.

(define (deriv-sum operands var)
  (make-sum (deriv (addend operands) var)
            (deriv (augend operands) var)))

(define (addend operands) (car operands))
(define (augend operands) (cadr operands))

(define (deriv-product operands var)
  (make-sum
    (make-product (multiplier operands)
                  (deriv (multiplicand operands) var))
    (make-product (deriv (multiplier operands) var)
                  (multiplicand operands))))

(define (multiplier operands) (car operands))
(define (multiplicand operands) (cadr operands))

(define (install-deriv-sum)
  ;; internal procedures
  (define (addend operands) (car operands))
  (define (augend operands) (cadr operands))
  (define (deriv-sum operands var)
    (make-sum (deriv (addend operands) var)
              (deriv (augend operands) var)))
  ;; interface to the rest of the system
  (put 'deriv '+ deriv-sum)
  'done)

(define (install-deriv-product)
  ;; internal procedures
  (define (multiplier operands) (car operands))
  (define (multiplicand operands) (cadr operands))
  (define (deriv-product operands var)
    (make-sum
      (make-product (multiplier operands)
                    (deriv (multiplicand operands) var))
      (make-product (deriv (multiplier operands) var)
                    (multiplicand operands))))
  ;; interface to the rest of the system
  (put 'deriv '* deriv-product)
  'done)

(define (deriv-exponentiation operands var)
  (make-product
    (make-product (exponent operands)
                  (make-exponentiation (base operands) (make-sum (exponent operands) -1)))
    (deriv (base operands) var)))

(define (base operands) (car operands))
(define (exponent operands) (cadr operands))


(define (install-deriv-exponentiation)
  ;; internal procedures
  (define (base operands) (car operands))
  (define (exponent operands) (cadr operands))
  (define (deriv-exponentiation operands var)
    (make-product
      (make-product (exponent operands)
                    (make-exponentiation (base operands) (make-sum (exponent operands) -1)))
      (deriv (base operands) var)))
  ;; interface to the rest of the system
  (put 'deriv '** deriv-exponentiation)
  'done)

; If we change
; ((get 'deriv (operator exp)) (operands exp) var)
; to:
; ((get (operator exp) 'deriv) (operands exp) var)
; we would have to change the put statements from:
; (put 'deriv <operator> <proc>)
; to:
; (put <operator> 'deriv <proc>)
