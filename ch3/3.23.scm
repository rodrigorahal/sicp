; To perform the operations of a deque in O(1) steps we can use a double-link
; list in which every item has a pointer to the next item and
; a point to the previous item:

;  ---------------------
;  |                   |
;  --> [.][/][.]-->[.][.][/]
;  |                |
; front-ptr         rear-ptr
;
; representation of a double-link list (a b)

(define (make-deque) (cons '() '()))

(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))
(define (set-front-ptr! deque item) (set-car! deque item))
(define (set-rear-ptr! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (null? (front-ptr deque)))


(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT called with an empty deque" deque)
      (car (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR called with an empty deque" deque)
      (car (rear-ptr deque))))

(define (rear-insert-deque! deque item)
  (let ((new-item (list item '() '())))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-item)
           (set-rear-ptr! deque new-item)
           deque)
          (else
           (set-car! (cdr new-item) (rear-ptr deque))
           (set-car! (cddr (rear-ptr deque)) new-item)
           (set-rear-ptr! deque new-item)))))

;(define (rear-insert-deque! deque item)
;  (cond ((empty-deque? deque)
;         (let ((new-item (list item '() '())))
;          (set-front-ptr! deque new-item)
;          (set-rear-ptr!  deque new-item)))
;        (else
;          (let ((new-item (list item (rear-ptr deque) '())))
;            (set-car! (cddr (rear-ptr deque)) new-item)
;            (set-rear-ptr! deque new-item)))))

;(define (front-insert-deque! deque item)
;  (cond ((empty-deque? deque)
;          (let ((new-node (make-node item '() '())))
;            (set-front-ptr! deque new-node)
;            (set-rear-ptr! deque new-node)))
;        (else
;          (let ((new-node (make-node item '() (front-ptr deque))))
;            (set-prev! (front-ptr deque) new-node)
;            (set-front-ptr! deque new-node)))))

(define (front-insert-deque! deque item)
  (cond ((empty-deque? deque)
         (let ((new-item (list item '() '())))
           (set-front-ptr! deque new-item)
           (set-rear-ptr! deque new-item)))
         (else
           (let ((new-item (list item '() (front-ptr deque))))
           (set-car! (cdr (front-ptr deque)) new-item)
           (set-front-ptr! deque new-item)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        (else
         (set-car! (cdr (front-ptr deque) '()))
         (set-front-ptr! deque (cdr (front-ptr deque)))
         deque)))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty-deque" deque))
        (else
          (set-car! (cddr (cadr (rear-ptr deque))) '())
          (set-rear-ptr! (cadr (rear-ptr deque))))))

(define d1 (make-deque))

(empty-deque? d1)

(front-insert-deque! d1 'a)

(empty-deque? d1)

(front-deque d1)

(rear-deque d1)

(rear-insert-deque! d1 'b)

(front-deque d1)

(rear-deque d1)

(rear-insert-deque! d1 'c)

(front-deque d1)

(rear-deque d1)
