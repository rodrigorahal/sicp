(define (make-table)
  (define local-table '())
  (define key-record car)
  (define value-record cdr)

  (define (make-tree entry left right) (list entry left right))
  (define entry car)
  (define left-branch cadr)
  (define right-branch caddr)

  (define (element-of-set? record set)
    (cond ((null? set) false)
          ((= (key-record record) (key-record (entry set))) true)
          ((< (key-record record) (key-record (entry set)))
           (element-of-set? record (left-branch set)))
          ((> (key-record record) (key-record (entry set)))
           (element-of-set? record (right-branch set)))))

  (define (adjoin-set record set)
    (cond ((null? set) (make-tree record '() '()))
          ((= (key-record record) (key-record (entry set))) set)
          ((< (key-record record) (key-record (entry set)))
           (make-tree (entry set)
                      (adjoin-set record (left-branch set))
                      (right-branch set)))
          ((> (key-record record) (key-record (entry set)))
           (make-tree (entry set)
                      (left-branch set)
                      (adjoin-set record (right-branch set))))))

  (define (lookup key records)
    (if (null? records)
        false
        (let* ((record (entry records))
               (key-entry (key-record record)))
          (cond ((= key key-entry) (value-record record))
                ((< key key-entry) (lookup key (left-branch records)))
                (else (lookup key (right-branch records)))))))

  (define (insert! key value)
    (set! local-table
          (adjoin-set (cons key value)
                      local-table)))

  (define (dispatch m)
    (cond ((eq? m 'lookup)  (lambda (key)
                              (lookup key local-table)))
          ((eq? m 'insert!) insert!)
          ((eq? m 'print)   local-table)
          (else (error "Unknown operation -- TABLE" m))))
  dispatch)

(define number-table (make-table))
(define put-number! (number-table 'insert!))
(define get-number (number-table 'lookup))

(put-number! 100 "100")
(put-number! 300 "300")
(put-number! 900 "900")
(put-number! 700 "700")
(put-number! 200 '(200))
(put-number! 800 '(800))
(put-number! 400 '(400))
(put-number! 600 '(600))


(get-number 300)
;=> "300"

(get-number 800)
;=> '(800)

(get-number 700)
;=> "700"

(get-number 500)
;=> #f
