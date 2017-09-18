; a. Recursive exponentiation:

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(controller
    (assign continue (label expt-done))
  expt-loop
    (test (op =) (reg n) (const 0))
    (branch (label base-case))

    (save continue)
    (assign n (op -) (reg n) (const 1))
    (assign continue (label after-expt))
    (goto (label expt-loop))
  after-expt
    (restore continue)
    (assign val (op *) (reg b) (reg val))
    (goto (reg continue))
  base-case
    (assign val 1)
    (goto (reg continue))
  expt-done)


; b. Iterative exponentiation:

(define (expt b n)
  (define (expt-iter counter product)
    (if (= counter 0)
        product
        (expt-iter (- counter 1) (* b product))))
  (expt-iter n 1))

(controller
    (assign counter (reg n))
    (assign product 1)
  test-counter
    (test (op =) (reg counter) (const 0))
    (branch (label expt-done))
    (assign counter (op -) (reg counter) (const 1))
    (assign product (op *) (reg b) (reg product))
    (goto (label test-counter))
  expt-done)
