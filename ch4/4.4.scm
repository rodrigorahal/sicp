; we can't use (list-of-values) because we need to stop at the first false
; evaluation but we can follow its ideas

(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (first-operand exps) env)
            (list-of-values (rest-operands exps) env))))

(define (eval-and exps env)
  (let ((operand-value (eval (first-operand exps) env)))
    (if (no-operands? (rest-operands exps))
        (if (true? operand-value) operand-value #f))
        (if (true? operand-value) (eval-and (rest-operands exps) env) #f)))

(define (and? exp) (tagged-list? exp 'and))
(define (and-predicates exp) (cdr exp))

(define (eval-or exps env)
  (let ((operand-value (eval (first-operand exps) env)))
    (if (no-operands? (rest-operands exps))
        (if (true? operand-value) operand-value #f))
        (if (true? operand-value) operand-value (eval-or (rest-operands exps) env))))
