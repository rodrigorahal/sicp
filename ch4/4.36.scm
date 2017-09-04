(define (an-integer-starting-from n)
  (amb n (an-integer-starting-from (+ n 1))))

(define (an-integer-between low high)
  (require (<= low high))
  (amb low (an-integer-between (+ low 1) high)))

(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high)))
    (let ((j (an-integer-between i high)))
      (let ((k (an-integer-between j high)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

; if we simply replaced an-integer-between with an-integer-starting-from in the
; the above procedure, k would be unbounded and go on forever without ever
; changing the values of i and j.

(define (a-pythagorean-triple-greater-than low)
         (let ((k (an-integer-starting-from low)))
          (let ((i (an-integer-between low k)))
           (let ((j (an-integer-between i k)))
             (require (= (+ (* i i) (* j j)) (* k k)))
                 (list i j k))))) 
