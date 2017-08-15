(define (pairs s t)
  (cons-stream
   ; first item (s0 t0)
   (list (stream-car s) (stream-car t))
   (interleave
    ; first row (s0 t_)
    (stream-map (lambda (x)
                  (list (stream-car s) x))
                (stream-cdr t))
    (interleave
     ; columns (s_ t0) (s_ t1) (s_ t2) ...
     (stream-map (lambda (x)
                  (list x (stream-car t)))
                 (stream-cdr s))
     (pairs (stream-cdr s) (stream-cdr t))))))
