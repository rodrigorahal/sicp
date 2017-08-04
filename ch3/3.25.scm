; the equal? procedure used in assoc can compare two list for equality

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup keys)
      (let ((record (assoc keys (cdr local-table))))
        (if record
            (cdr record)
            false)))
    (define (insert! keys value)
      (let ((record (assoc keys (cdr local-table))))
        (if record
            (set-cdr! record value)
            (set-cdr! local-table (cons (cons keys value) (cdr local-table))))))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define t (make-table))
((t 'insert-proc!) (list 'math '*) "mul")
((t 'insert-proc!) (list 'math '+) "plus")
((t 'lookup-proc) (list 'math '*))
;=> "mul"

((t 'insert-proc!) (list 'math '*) "multiply")
((t 'lookup-proc) (list 'math '*))
;=> "multiply"

(define t-multi (make-table))
((t-multi 'insert-proc!) (list 'a) "a")
((t-multi 'insert-proc!) (list 'b) "b")
((t-multi 'insert-proc!) (list 'a 'a) "aa")
((t-multi 'insert-proc!) (list 'a 'b) "ab")
((t-multi 'insert-proc!) (list 'a 'a 'a) "aaa")
((t-multi 'insert-proc!) (list 'a 'a 'b) "aab")
((t-multi 'insert-proc!) (list 'a 'a 'a 'a 'a) "aaaaa")

((t-multi 'lookup-proc) (list 'a 'a 'a))
;=> "aaa"
