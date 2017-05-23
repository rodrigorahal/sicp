(load "2.67.scm") ; huffman

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (find-symbol tree)
    (if (leaf? tree)
        '()
        (cond ((leaf-in-branch? symbol (symbols (left-branch tree)))
               (append '(0) (find-symbol (left-branch tree))))
              ((leaf-in-branch? symbol (symbols (right-branch tree)))
               (append '(1) (find-symbol (right-branch tree)))))))
  (if (not (leaf-in-branch? symbol (symbols tree)))
      (error "symbol not in tree -- ENCODE-SYMBOL" symbol)
      (find-symbol tree)))

(define (leaf-in-branch? symbol branch-symbols)
  (cond ((null? branch-symbols) false)
        ((equal? symbol (car branch-symbols)) true)
        (else (leaf-in-branch? symbol (cdr branch-symbols)))))

(leaf-in-branch? 'a '(a b c))
;=> #t

(leaf-in-branch? 'a '(a))
;=> #t

(leaf-in-branch? 'a '(b c))
;=> #f

(encode-symbol 'd sample-tree)
;=> (1 1 0)

(encode-symbol 'a sample-tree)
;=> (0)

(encode-symbol 'b sample-tree)
;=> (1 0)

(encode-symbol 'c sample-tree)
;=> (1 1 1)
