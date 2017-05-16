(load "2.46.scm") ; vectors
(load "2.47.scm") ; frames
(load "2.48.scm") ; segments

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define outline-segments
  (list
    (make-segment (make-vector 0 0)
                  (make-vector 1 0))
    (make-segment (make-vector 0 0)
                  (make-vector 0 1))
    (make-segment (make-vector 1 0)
                  (make-vector 1 1))
    (make-segment (make-vector 0 1)
                  (make-vector 1 1))))

(define (outline-frame)
  (segments->painter outline-segments))

(define opposite-corners-segments
  (list
    (make-segment (make-vector 0 0)
                  (make-vector 1 1))
    (make-segment (make-vector 0 1)
                  (make-vector 1 0))))

(define (x-frame)
  (segments->painter opposite-corners-segments))

(define diamond-segments
  (list
    (make-segment (make-vector 0.5 0)
                  (make-vector 1 0.5))
    (make-segment (make-vector 1 0.5)
                  (make-vector 0.5 1))
    (make-segment (make-vector 0.5 1)
                  (make-vector 0 0.5))
    (make-segment (make-vector 0 0.5)
                  (make-vector 0.5 0))))

(define (diamond-frame)
  (segments->painter diamond-segments))
