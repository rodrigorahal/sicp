(define (make-monitored f)
  (define counter (make-counter 0))
  (define (mf m)
    (cond ((eq? m 'how-many-calls?) (counter 'read))
          ((eq? m 'reset-count) (counter 'reset))
          (else (counter 'inc)
                       (f m))))
  mf)

(define (make-counter count)
  (define (inc)
    (set! count (+ count 1))
    count)
  (define (read) count)
  (define (reset)
    (set! count 0)
    count)
  (define (dispatch m)
    (cond ((eq? m 'inc) (inc))
          ((eq? m 'read) (read))
          ((eq? m 'reset) (reset))
          (else (error "Unknown request -- MAKE-COUNTER"
                       m))))
  dispatch)


(define counter (make-counter 0))

(counter 'read)

(counter 'inc)

(counter 'read)

(define s (make-monitored sqrt))

(s 100)
;=> 10

(s 4)
;=> 2

(s 'how-many-calls?)
;=> 2

(s 'reset-count)

(s 'how-many-calls?)
;=> 0
