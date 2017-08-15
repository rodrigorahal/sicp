(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (stream-limit stream tolerance)
  (cond ((stream-null? stream) false)
        ((stream-null? (stream-cdr stream)) (stream-car stream))
        (else
          (let ((a (stream-car stream))
                (b (stream-car (stream-cdr stream))))
            (if (< (abs (- a b)) tolerance)
                b
                (stream-limit (stream-cdr stream) tolerance))))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 2 0.1)

(sqrt 2 0.0001)
