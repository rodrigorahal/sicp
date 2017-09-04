(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (if (eq? (car vals) '*unassigned)
                      (error "Variable not yet assigned" var)
                      (car vals))
             (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (scan-out-defines body)
  (let ((defines (filter definition? body))
        (rest (filter (lambda (exp) (not (definition? exp))) body)))
    (list 'let
          (map (lambda (def) (cons (definition-variable def) '*unassigned)) defines)
          (map (lambda (def) (list 'set! (definition-variable def) (definition-value def))) defines)
          rest)))