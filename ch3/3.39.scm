(define x 10)

(define s (make-serializer))

(parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
                  (s (lambda () (set! x (+ x 1)))))

; In this version, P1 has to wait until P2 is finished to access and modify
; the state, the uniterleaved results are still possible, and the result in
; which P2 access x durign P1 execution


; 101:	P1 sets x to 100 and then P2 increments x to 101.
; 121:	P2 increments x to 11 and then P1 sets x to x times x.
; 100:	P1 accesses x (twice), then P2 sets x to 11, then P1 sets x.
