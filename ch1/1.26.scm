(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (expmod-louis base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod-louis base (/ exp 2) m)
                       (expmod-louis base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod-louis base (- exp 1) m))
                    m))))

; expmod-louis is a tree recursion: for every call to expmod-louis inside
; the explicit multiplication the procedure will open two new branch.
