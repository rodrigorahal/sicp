(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)                    ; empty set?
      (list '())                   ; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (multiple-dwelling)
  (define (make-solution solution)
    (map list '(baker cooper fletcher miller smith) solution))
  (define (valid-solution? permutation)
    (let ((baker (first permutation))
          (cooper (second permutation))
          (fletcher (third permutation))
          (miller (fourth permutation))
          (smith (fifth permutation)))
      (and (not (= baker 5))
           (not (= cooper 1))
           (not (= fletcher 5))
           (not (= fletcher 1))
           (> miller cooper)
           (not (= (abs (- smith fletcher)) 1))
           (not (= (abs (- fletcher cooper)) 1)))))

  (map
    make-solution
    (filter valid-solution? (permutations (list 1 2 3 4 5)))))
