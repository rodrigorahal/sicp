(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(controller
 test-b
   (test (op =) (reg b) (const 0))
   (branch (label gcd-done))
   (assign t (op rem) (reg a) (reg b))
   (assign a (reg b))
   (assign b (reg t))
   (goto (label test-b))
 gcd-done)

 (define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(controller
  (assign prod 1)
  (assign counter 1)

  test-counter
    (test (op >) (reg counter) (reg n))
    (branch (label fact-done))
    (assign t-prod (op *) (reg counter) (reg product))
    (assign t-counter (op +) (reg counter) (const 1))
    (assign prod (reg t-prod))
    (assign counter (reg t-counter))
    (goto (label test-counter))
  fact-done)
