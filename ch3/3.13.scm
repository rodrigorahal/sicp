(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

; -->[.][.]-->[.][.]-->[.][.]
; |   |        |        |  |
; |   a        b        c  |
; --------------------------

; calling (last z) will never halt, z doesn't have a null value
