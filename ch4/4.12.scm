(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable -- SET!" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
             (add-binding-to-frame! var val frame))
            ((eq? var (car vars))
             (set-car! vals val))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-values frame))))

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))

(define (scan-frame var frame)
  (define (scan vars vals)
    (cond ((null? vars) false)
          ((eq? var (car vars)) vals)
          (else (scan (cdr vars) (cdr vals)))))
  (scan (frame-variables frame) (frame-values frame)))

(define (scan-env var env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "Unbound variable -- SET!" var)
        (let* ((frame (first-frame env))
               (found-vals (scan-frame var frame)))
          (if (false? found-vals)
              (env-loop (enclosing-environment env))
              found-vals))))
  (env-loop env))

(define (set-variable-value! var val env)
  (let ((found-vals (scan-env var env)))
    (set-car! found-vals val)))

(define (define-variable! var val env)
  (let* ((frame (first-frame env))
         (found-vals (scan-frame var frame)))
    (if (false? found-vals)
        (add-binding-to-frame! var val frame)
        (set-car! found-vals val))))

(define (lookup-variable-value var env)
  (let ((found-vals (scan-env var env)))
    (car found-vals)))