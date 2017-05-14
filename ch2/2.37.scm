(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (seq) (car seq)) seqs))
            (accumulate-n op init (map (lambda (seq) (cdr seq)) seqs)))))

(define a (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product (list 1 2 3) (list 4 5 6))
;=> 32

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))

(matrix-*-vector a (list 2 2 2 2))
;=> (20 42 60)

(define (transpose mat)
  (accumulate-n cons '() mat))

(transpose a)
;=> ((1 4 6) (2 5 7) (3 6 8) (4 6 9))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(define b (list (list 1 1 1) (list 1 1 1) (list 1 1 1) (list 1 1 1)))

(matrix-*-matrix a b)
;=> ((10 10 10) (21 21 21) (30 30 30))
