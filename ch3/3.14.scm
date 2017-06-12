(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))

(define w (mystery v))

w
;=> (d c b a)

v
;=> (a)

; mystery will modify the list x given and return a reverted list of the
; original x.

; before calling mystery:

; v -->[.][.]-->[.][.]-->[.][.]-->[.][/]
;       |        |        |        |
;       a        b        c        d

; after calling mystery:

; w -->[.][.]-->[.][.]-->[.][.]
;       |        |        |  |
;       d        c        b  |
;                            |
;                            -->[.][/]
;                          v --> |
;                                a
