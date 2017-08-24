(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))
(define (make-begin seq) (cons 'begin seq))


(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false                          ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses))
            (make-if (cond-predicate first)
                     (sequence->exp (cond-actions first))
                     (expand-clauses rest))))))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

; to add support for (<test> => <recipient>) we ne to add new clauses to
; expand-clauses to test whether to call make-if or to evaluate the <recipient>
; with the result of the test as argument:

(define (cond-recipient-clause? clause) (eq? (cadr clause) '=>))
(define (cond-recipient clause) (caddr clause))

(define (make-cond-recipient clause predicate)
  (list (cond-recipient clause) predicate))

(define (cond-consequent clause predicate)
  (if (cond-recipient-clause? clause)
      (make-cond-recipient clause predicate)
      (sequence->exp (cond-actions clause))))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false                          ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses))
            (let ((predicate (cond-predicate first)))
              (make-if predicate
                       (cond-consequent first predicate)
                       (expand-clauses rest)))))))
