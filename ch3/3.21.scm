(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))

(define q1 (make-queue))
(insert-queue! q1 'a)
;=> ((a) a)
(insert-queue! q1 'b)
;=> ((a b) b)
(delete-queue! q1)
;=> ((b) b)
(delete-queue! q1)
;=> (() b)

; The queue is a represented as a list whose car is the list of items and
; whose cdr is a pair containing the last item in the queue.
; That's exactly what gets printed in the sequence of statements above:
; When a gets inserted, the list of items is ((a)) and the last item is a
; When b gets inserted, the list of items is ((a b)) and the last item is b
; When a gets deleted, the list of items becomes ((b)) and the last item is b
; When b gets deleted, the list ofi items becomes empty (()) and the last item
; is still b, but by the definition of the empty-queue?, the queue is empty

(define (print-queue queue)
  (newline)
  (display (front-ptr queue))
  (newline))

(define q2 (make-queue))
(print-queue (insert-queue! q2 'a))
;=> (a)
(print-queue (insert-queue! q2 'b))
;=> (a b)
(print-queue (delete-queue! q2))
;=> (b)
(print-queue (delete-queue! q2))
;=> ()
