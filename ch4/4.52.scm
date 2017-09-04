(define (if-fail? exp) (tagged-list? exp 'if-fail))
(define (if-fail-success exp) (cadr exp))
(define (if-fail-failure exp) (caddr exp))

(define (analyze-if-fail exp)
  (let ((sproc (analyze (if-fail-success exp)))
        (fproc (analyze (if-fail-failure exp))))
    (lambda (env succeed fail)
      (sproc env
             succeed
             (lambda ()
               (fproc env succeed fail))))))
