; Initial balance:
(define balance 100)

; 1st possible sequence of events: Peter->Paul->Mary

; Peter:
(set! balance (+ balance 10))
balance
;=> 110

; Paul:
(set! balance (- balance 20))
balance
; => 90

; Mary:
(set! balance (- balance (/ balance 2)))
balance
; => 45

; 2nd possible sequence of events: Peter->Mary->Paul

(define balance 100)

; Peter:
(set! balance (+ balance 10))
balance
;=> 110

; Mary:
(set! balance (- balance (/ balance 2)))
balance
; => 55

; Paul:
(set! balance (- balance 20))
balance
; => 35

; 3rd possible sequence of events: Paul->Peter->Mary

(define balance 100)

; Paul:
(set! balance (- balance 20))
balance
; => 80

; Peter:
(set! balance (+ balance 10))
balance
;=> 90

; Mary:
(set! balance (- balance (/ balance 2)))
balance
; => 45

; 4th possible sequence of events: Paul->Mary->Peter

(define balance 100)

; Paul:
(set! balance (- balance 20))
balance
; => 80

; Mary:
(set! balance (- balance (/ balance 2)))
balance
; => 40

; Peter:
(set! balance (+ balance 10))
balance
;=> 50

; 5th possible sequence of events: Mary->Peter->Paul

(define balance 100)

; Mary:
(set! balance (- balance (/ balance 2)))
balance
; => 50

; Peter:
(set! balance (+ balance 10))
balance
;=> 60

; Paul:
(set! balance (- balance 20))
balance
; => 40

; 5th possible sequence of events: Mary->Paul->Peter

(define balance 100)

; Mary:
(set! balance (- balance (/ balance 2)))
balance
; => 50

; Paul:
(set! balance (- balance 20))
balance
; => 30

; Peter:
(set! balance (+ balance 10))
balance
;=> 40

; Possible values for balance: 45, 35, 50, 40

; If interleaved is possible the total money could not be conserved
