(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))

(stream-ref y 7)
(display-stream z)
sum
;=> 210

; We start by calling (stream-enumerate-interval 1 20) that constructs the
; delayed list by means of:
; (cons 1 (delay stream-enumerate-interval 2 20))
; Then we call stream-map with accum and the seq previously generated.
; The sum is set to 1 with the first value of the sequence.
; Then we define y to be the result of (stream-filter even? seq)
; stream-filter delays the evaluation of the cdr values with cons-stream
; (cons (stream-car stream) (delay (stream-filter pred (stream-cdr stream))))
; call to (stream-car stream) is made returning the value 2 in the interval
; that is mapped with accum to 3 (sum is now 3) which is odd and the else
; clause gets evaluated forcing (stream-cdr stream) to also evaluated.
; Another run in stream-filter is made with the number 3 in the interval, which
; gets maps with accum to 6 (sum is now 6) that now is even getting the if
; clause to be evaluated and delaying the stream with cons-stream
; The same process is repeated with z.

; With if haven't used the memoized version, the streams would get consumed
; and would not be available for latter evaluations.
