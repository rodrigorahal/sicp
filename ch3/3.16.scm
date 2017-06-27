(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))


(define a '(a))
(define b '(b))
(define c '(c))

(define x (append a b c))
;=> (a b c)
(count-pairs x)
;=> 3

(define y (append a b c))
(set-car! y c)
;=> ((c) b c)
(count-pairs y)
;=> 4

(define z c)
(set-car! b a)
(set-cdr! b a)
(set-car! c b)
(set-cdr! c b)
(count-pairs z)
;=> 7

; A cycle will never return
(define inf '(a b c))
(set-cdr! (cddr inf) inf)
(count-pairs inf)
;=> ;Aborting!: maximum recursion depth exceeded
