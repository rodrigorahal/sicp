(define (named-let? exp) (symbol? (cadr exp)))
(define (let? exp) (tagged-list? exp 'let))
(define (let-assignment-params exp) (map car (cadr exp)))
(define (let-assignment-exps exp) (map cadr (cadr exp)))
(define (let-body exp) (cddr exp))

(define (named-let->combination exp)
  (let ((procedure-name (car exp)))
    (make-begin
      (list
        (list 'define procedure-name
              (make-lambda
                (let-assignment-params exp)
                (let-body exp)))
        (cons procedure-name (let-assignment-exps exp))))))

(define (let->combination exp)
  (if (named-let? exp)
      (named-let->combination (cdr exp))
      (cons (make-lambda
              (let-assignment-params exp)
              (let-body exp))
            (let-assignment-exps exp))))
