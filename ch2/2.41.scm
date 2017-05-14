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

(define (unique-pairs n)
  (flatmap
   (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (i)
              (flatmap (lambda (j)
                          (map (lambda (k) (list i j k))
                               (enumerate-interval 1 (- j 1))))
                       (enumerate-interval 1 (- i 1))))

           (enumerate-interval 1 n)))

(unique-triples 4)
;=>  ((3 2 1) (4 2 1) (4 3 1) (4 3 2))

(define (sum-equals-s? triple s)
  (= (sum-triple triple) s))

(define (sum-triple triple)
  (accumulate + 0 triple))

(define (sum-s-triples s n)
  (map make-triple-sum
       (filter (lambda (triple) (sum-equals-s? triple s))
               (unique-triples n))))

(define (make-triple-sum triple)
  (list (car triple) (cadr triple) (cadr (cdr triple)) (sum-triple triple)))

(sum-s-triples 10 5)
;=> ((5 3 2 10) (5 4 1 10))
