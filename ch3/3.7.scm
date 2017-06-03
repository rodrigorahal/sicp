(define (make-account balance . passwords)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (add-joint-password token)
    (set! passwords (cons token passwords))
    "Joint account created")
  (define (dispatch token m)
    (if (not (memq token passwords))
        (lambda (amount) "Incorret password")
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              ((eq? m 'add-joint) add-joint-password)
              ((eq? m 'read-balance) (lambda () balance))
              (else (error "Unknown request -- MAKE-ACCOUNT"
                           m)))))
  dispatch)

(define (make-joint acc password joint-password)
  ((acc password 'add-joint) joint-password)
  acc)

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

((peter-acc 'open-sesame 'read-balance))
;=> 100

((paul-acc 'rosebud 'read-balance))
;=> 100

((paul-acc 'rosebud 'withdraw) 50)
;=> 50

((peter-acc 'open-sesame 'read-balance))
;=> 50

((peter-acc 'open-sesame 'withdraw) 50)
;=> 0

((paul-acc 'rosebud 'read-balance))
;=> 0
