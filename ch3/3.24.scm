(define (make-table same-key?)
  (define (flex-assoc key records)
    (cond ((null? records) false)
          ((same-key? key (caar records)) (car records))
          (else (flex-assoc key (cdr records)))))
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (flex-assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (flex-assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (flex-assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (flex-assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define equals-table (make-table equal?))
((equals-table 'insert-proc!) 'math '+ 43)
((equals-table 'insert-proc!) 'math '- 45)
((equals-table 'lookup-proc) 'math '+)
;=> 43
((equals-table 'lookup-proc) 'math '-)
;=> 45

(define (number-equal? number-1 number-2 tol)
  (<= (abs (- number-1 number-2))
      tol))

(number-equal? 1.555 1.554 0.001)
;=> #t

(number-equal? 1.556 1.554 0.001)
;=> #f

(define numbers-table (make-table (lambda (number-1 number-2) (number-equal? number-1 number-2 0.001))))
((numbers-table 'insert-proc!) 1.555 1.55 1.5)
((numbers-table 'lookup-proc) 1.554 1.55)
;=> 1.5
