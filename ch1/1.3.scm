(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (get-largest a b c)
  (cond ((and (>= a b) (>= a c)) a)
        ((and (>= b a) (>= b c)) b)
        ((and (>= c a) (>= c b)) c)
  )
)

(define (get-middle a b c)
  (cond ((or
          (and (>= a c) (<= a b))
          (and (>= a b) (<= a c)))
        a)
        ((or
          (and (>= b c) (<= b a))
          (and (>= b a) (<= b c)))
        b)
        ((or
          (and (>= c a) (<= c b))
          (and (>= c b) (<= c c)))
        c)
  )
)

(define (main a b c)
  (sum-of-squares (get-middle a b c) (get-largest a b c))
)

(main 3 2 1)
; Value: 13
