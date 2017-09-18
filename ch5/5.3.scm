(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

; good-enough? as a primitive
(controller
  (assign x (op read))
  (assign guess 1.0)

  test-good-enough
    (test (op good-enough?) (reg guess))
    (branch (label sqrt-done))
    (assign improve (op improve) (reg guess))
    (assign guess (reg improve))
    (goto (label test-good-enough))
  sqrt-done)


; good-enough? as a procedure
(controller
  (assign x (op read))
  (assign guess 1.0)

  test-good-enough
    ; good-enough? procedure
    (assign square-guess (op square) (reg guess))
    (assign diff (op -) (reg square) (reg x))
    (assign abs-diff (op abs) (reg dif))

    (test (op <) (reg abs-diff) (reg guess))
    (branch (label sqrt-done))
    (assign improve (op improve) (reg guess))
    (assign guess (reg improve))
    (goto (label test-good-enough))
  sqrt-done)

; good-enough? and improve as procedures
(controller
  (assign x (op read))
  (assign guess 1.0)

  test-good-enough
    ; good-enough? procedure
    (assign square-guess (op square) (reg guess))
    (assign diff (op -) (reg square) (reg x))
    (assign abs-diff (op abs) (reg dif))

    (test (op <) (reg abs-diff) (reg guess))
    (branch (label sqrt-done))

    ; improve procedure
    (assign division (op / (reg x) (reg guess)))
    (assign improve (op average) (reg guess) (reg division))
    (assign guess (reg improve))
    (goto (label test-good-enough))
  sqrt-done)
