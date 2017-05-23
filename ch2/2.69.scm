(load "2.67.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge nodes)
  (if (null? (cdr nodes))
      (car nodes)
      (let ((first-node (car nodes))
            (second-node (cadr nodes))
            (remaining-nodes (cddr nodes)))
        (successive-merge (adjoin-set (make-code-tree first-node second-node)
                                      remaining-nodes)))))

(generate-huffman-tree (list '(a 4) '(b 2) '(c 1) '(d 1)))
;=> ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)

sample-tree
;=> ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)
