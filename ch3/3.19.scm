(define (has-cycle? x)
  (define (inner pointer fast-pointer)
    (cond ((eq? pointer fast-pointer) #t)
          ((null? (cdr pointer)) #f)
          ((null? (cddr fast-pointer)) #f)
          (else (inner (cdr pointer))
                (inner (cddr fast-pointer)))))
  (inner x (cdr x)))

; Run through the list with two pointer, one look one element at a time
; and the other skipping one element at a time.
; If they ever point to the same place, the list has loop;
; If one of the pointer points to null, the list does not have a loop.

(define loop '(a b))
(set-cdr! loop loop)

(has-cycle? loop)
;=> #t

(has-cycle? '(a b c))
;=> #f
