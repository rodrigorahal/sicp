(define (smooth stream)
  (stream-map (lambda (x y)
                (/ (+ x y) 2))
              stream
              (cons-stream 0 stream)))

(define (make-zero-crossings input-stream)
  (let ((smoothed-values (smooth input-stream)))
    (stream-map sign-change-detector
                smoothed-values
                (cons-stream 0 smoothed-values))))
