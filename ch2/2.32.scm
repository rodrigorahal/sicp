(define (subsets s)
  (if (null? s)
      (list s)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (e)
                            (append (list (car s)) e)
                          )
                          rest)))))

(subsets (list 1 2 3))

; If rest is the subset of (cdr s), then the subset of s is (list (car s))
; append to every element of rest
