(define (coerce-to target-type remaining-args result)
  (if (null? remaining-args)
      result
      (let* ((arg (car remaining-args))
             (original-type (type-tag arg)))
        (if (eq? original-type target-type)
            (coerce-to target-type
                       (cdr remaining-args)
                       (append result (list arg)))
            (let ((original->target (get-coercion (type-tag arg) target-type)))
              (if original->target
                  (coerce-to target-type
                             (cdr remaining-args)
                             (append result (list (original->target arg))))
                  #f))))))
