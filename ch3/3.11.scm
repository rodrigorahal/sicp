(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

; The evaluation of the _define_ above will bind the symbol make-account to the
; procedure object whose parameter is balance and whose body is shown above

(define acc (make-account 50))

; To evaluate the above expression, we first evaluate the subexpression,
; (make-account 50) which will create a new enviroment E1 with
; the formal parameter, balance, bound to the argument 50. In E1, we evaluate
; the body of make-account.
; Each of the three define calls will bound a symbol to a procedure object:
; withdraw, deposit and dispatch in the E1 enviroment. The value returned by
; make-account, the dispatch procedure, is then bound to the symbol acc in
;the global enviroment, where the original call was originated

((acc 'deposit) 40)

; We start by evaluating (acc 'deposit) which will create a new enviroment E2
; with the formal parameter of dispatch m bound to the argument 'deposit. Then
; we evaluate the body of the dispatch procedure bound in the E1 enviroment.
; The returned value of the dispatch is the procedure deposit. The result is
; call to (deposit 40) which in turn will create a new enviroment E3 will the
; formal parameter of deposit amount boud to the argument 40. Then we evaluate
; the body of deposit bound in E1 that sets the balance value to 90

((acc 'withdraw) 60)

; This call is analagous to ((acc 'deposit) 40), an enviroment binding m and
; pointing to E1 will be created then an enviroment binding amount and pointing
; to E1 will be created which will set the value of balance in E1 to 30

; The local state, balance, of acc is kept in the enviroment E1

(define acc2 (make-account 100))

; Is analagous to the (define acc (make-account 50)). A new enviroment,
; different from E1 will be created where the new local state balance will be
; bound to the value 100
