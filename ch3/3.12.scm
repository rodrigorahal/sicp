(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z
;=> (a b c d)

(cdr x)
;=> (b)

(define w (append! x y))

w
;=> (a b c d)


(cdr x)

;=> (b c d)

; x --> [.][.]-->[.][/]
;        |        |
;        a        b
;
;                 y --> [.][.]-->[.][/]
;                    |   |        |
;                    |   c        d
;                    |
; z --> [.][.]-->[.][.]
;        |        |
;        a        b
;

; after append! x is modified, x and w point to same place

; x, w --> [.][.]-->[.][.]
;           |        |  |
;           a        b  |
;                    |
;                 y --> [.][.]-->[.][/]
;                    |   |        |
;                    |   c        d
;                    |
; z --> [.][.]-->[.][.]
;        |        |
;        a        b
;
