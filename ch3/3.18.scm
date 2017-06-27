(define has-cycle?
  (let ((seen '()))
    (lambda (x)
      (cond ((not (pair? x)) #F)
            ((memq x seen) #t)
            (else (set! seen (cons x seen))
                  (has-cycle? (cdr x)))))))

(define l1 (list 'a 'b 'c))
(define l2 (list 'a 'b 'c))
(set-cdr! (cdr (cdr l2)) l2)
(define l3 (list 'a 'b 'c 'd 'e))
(set-cdr! (cdddr l3) (cdr l3))
(define l4 (list 'a 'b 'c 'd 'e))
(set-car! (cdddr l4) (cddr l4))

(has-cycle? l1)
;=> #f

(has-cycle? l2)
;=> #t

(has-cycle? l3)
;=> #t

(has-cycle? l4)
;=> #f
