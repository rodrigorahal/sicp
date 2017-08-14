(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
                  (lambda () (set! x (* x x x))))

; 1.000.000: P1 sets x to 100 and then P2 sets x to 100*100*100
; 10.000:    P2 sets x to 10*10*10 and then P1 sets x to 100*100
; 100:       P1 computes 10*10 and then P2 sets x to 10*10*10 and then P2 sets x to 100
; 100.000:   P1 sets x to 100 between P2 first and second access of P2
; 10.000:    P1 sets x to 100 between P2 second and third access of P2
; 10.000:    P2 sets x to 10*10*10 between accesses of P1

; after serializing P2 has to wait for P2 to finish to start execution so only
; one value is possible 1.000.000
