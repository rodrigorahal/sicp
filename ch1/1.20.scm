(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Using normal-order evaluation to evaluate (gcd 206 40)

; (gcd 206 40)
; (if (= 40 0) ;=> #f
;     206
;     (gcd 40 (remainder 206 40)))

; (gcd 40 (remainder 206 40))
; (if (= (remainder 206 40) 0) ; 1 remainder evaluated => 6
;     40
;     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (if (= (remainder 40 (remainder 206 40)) 0) ; 2 remainder evaluated => 4
;     (remainder 206 40)
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40)
;                     (remainder 40 (remainder 206 40)))))

; (gcd (remainder 40 (remainder 206 40))
;      (remainder (remainder 206 40)
;                 (remainder 40 (remainder 206 40))))
; (if (= (remainder (remainder 206 40)
;            (remainder 40 (remainder 206 40))) 0) ; 4 remainder evaluated => 2
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40)
;                     (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40))
;                     (remainder (remainder 206 40)
;                                (remainder 40 (remainder 206 40))))))

; (gcd (remainder (remainder 206 40)
;                 (remainder 40 (remainder 206 40)))
;      (remainder (remainder 40 (remainder 206 40))
;                 (remainder (remainder 206 40)
;                            (remainder 40 (remainder 206 40)))))
; (if (= (remainder (remainder 40 (remainder 206 40))
;                   (remainder (remainder 206 40)
;                              (remainder 40 (remainder 206 40)))) 0)
    ; 7 remainder evaluated => 0
;     (remainder (remainder 206 40)
;                (remainder 40 (remainder 206 40)))
    ; 4 remainder evaluated => 2
    ; ...

; Total number of remainder evaluations for normal-order: 18

; ===========================================================

; Using applicative-order evaluation to evaluate (gcd 206 40)

; (gcd 206 40)
; (gcd 40 (remainder 206 40)) ; 1 remainder evaluated => 6
; (gcd 40 6)
; (gcd 6 (remainder 40 6)) ; 1 remainder evaluated => 4
; (gcd 6 4)
; (gcd 4 (remainder 6 4)) ; 1 remainder evaluated => 2
; (gcd 4 2)
; (gcd 2 (remainder 4 2)) ; 1 remainder evaluated => 0
; (gcd 2 0)
;=> 2

; Total number of remainder evaluations for applicative-order: 4

(gcd 206 40)
;=> 2
