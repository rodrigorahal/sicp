(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))

; Delay is  defined so that (delay <exp>) is equivalent to
; (memo-proc (lambda () <exp>))

; Cons-stream is a special form defined so that
; (cons-stream <a> <b>)
; is equivalent to
; (cons <a> (delay <b>))

(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)

(define (sqrt-stream x)
  (cons-stream 1.0
               (stream-map (lambda (guess)
                             (sqrt-improve guess x))
                           (sqrt-stream x))))

; In the first implementation sqrt-stream, the second argument to (cons-stream),
; is a procedure and gets called recursively.
; While in the second implementation guesses is a stream that gets memoized
; through memo-proc.

; If memoization didn't take place, the two implementations would yield the same
; result.
