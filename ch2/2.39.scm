(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (fold-right op initial sequence)
  (accumulate op initial sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (left-reverse sequence)
  (fold-left (lambda (x y) (append (list y) x)) '() sequence))

(reverse (list 1 2 3))
;=> (3 2 1)

(left-reverse (list 1 2 3))
;=> (3 2 1)
