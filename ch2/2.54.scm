(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) #t)
        ((not (= (length list1) (length list2))) #f)
        (else
          (and (eq? (car list1) (car list2))
               (equal? (cdr list1) (cdr list2))))))

(equal? '(a b c) '(a b c))
;=> #t

(equal? '(a b c) '(a b))
;=> #f

(equal? '(a) (list '()))
;=> #f

(equal? '(c b a) '(a b c))
;=> #f

(equal? '(this is a list) '(this is a list))
;=> #t

(equal? '(this is a list) '(this (is a) list))
;=> #f
