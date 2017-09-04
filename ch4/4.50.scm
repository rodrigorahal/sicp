(define (analyze-amb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices) env
                           succeed
                           (lambda ()
                             (try-next (cdr choices))))))
      (try-next cprocs))))

(define (analyze-ramb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((any choices) env
                           succeed
                           (lambda ()
                             (try-next (remove-from choice choices))))))
      (try-next cprocs))))

(define (any lst) (list-ref lst (random (length lst))))
(define (remove-from x xs)
  (cond ((null? xs) '())
        ((equal? x (car xs)) (cdr xs))
        (else (cons (car xs) (remove-from x (cdr xs))))))
