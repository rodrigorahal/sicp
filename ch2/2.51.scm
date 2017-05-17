(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.0)
                              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-below
            (transform-painter painter1
                               (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               split-point))
        (paint-up
            (transform-painter painter2
                               split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0))))
     (lambda (frame)
       (paint-below frame)
       (paint-up frame)))))

(define (rotate90-count painter)
 (transform-painter painter
                    (make-vect 1.0 0.0)
                    (make-vect 1.0 1.0)
                    (make-vect 0.0 0.0)))

(define (rotate90-clock painter)
 (transform-painter painter
                    (make-vect 0.0 1.0)
                    (make-vect 0.0 0.0)
                    (make-vect 1.0 1.0)))

(define (below painter1 painter2)
  (rotate90-count
    (beside (rotate90-clock painter1)
            (rotate90-clock painter2))))
