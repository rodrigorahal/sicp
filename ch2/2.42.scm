(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (queens board-size)
   (define (queen-cols k)
     (if (= k 0)
         (list empty-board)
         (filter
          (lambda (positions) (safe? k positions))
          (flatmap
           (lambda (rest-of-queens)
             (map (lambda (new-row)
                    (adjoin-position new-row k rest-of-queens))
                  (enumerate-interval 1 board-size)))
           (queen-cols (- k 1))))))
   (queen-cols board-size))

(define (make-position row col)
  (list row col))

(define (row-position position)
  (car position))

(define (col-position position)
  (cadr position))

(define empty-board '())

empty-board

(define (adjoin-position row k positions)
  (cons (make-position row k) positions))

(define (safe? k positions)
  (let ((new-queen (car (filter (lambda (p) (= k (col-position p)))
                                positions)))
        (other-queens (filter (lambda (p) (not (= k (col-position p))))
                              positions))
       )
    (and (not (row-has-queen? (row-position new-queen) other-queens))
         (not (diagonal-has-queen? (row-position new-queen)
                                   (col-position new-queen)
                                   other-queens)))))

(define (row-has-queen? row positions)
  (let ((target (filter (lambda (p) (= row (row-position p)))
                        positions)))
    (if (null? target)
        #f
        #t)))

(define (row-col-diff-position position)
  (abs (- (row-position position)
          (col-position position))))

(define (diagonal-has-queen? row col positions)
  (let ((target (filter (lambda (p) (= (abs (- row (row-position p)))
                                       (abs (- col (col-position p)))))
                        positions)))
    (if (null? target)
        #f
        #t)))

(row-has-queen? 1 (list (make-position 1 2)))
;=> #t

(row-has-queen? 1 (list (make-position 4 5)))
;=> #f

(diagonal-has-queen? 0 0 (list (make-position 1 1)))
;=> #t

(diagonal-has-queen? 1 2 (list (make-position 4 5)))
;=> #t

(queens 1)
;=> (((1 1)))

(queens 2)
;=> ()

(queens 3)
;=> ()

(car (queens 4))
;=> ((3 4) (1 3) (4 2) (2 1))

(cadr (queens 4))
;=> ((2 4) (4 3) (1 2) (3 1))

(length (queens 5))
;=> 10

(length (queens 8))
;=> 92
