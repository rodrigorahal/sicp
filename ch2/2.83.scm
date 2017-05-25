(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (raise-int int)
  (make-rat int 1))

(define (raise-rat rat)
  (/ (numer rat) (denom rat)))

(define (raise-real real)
  (make-from-real-imag real 0))


(define (raise number) (apply-generic 'raise number))

; Let's say each object is tagged with type-tags: int, rat, real and complex
; We can put the above procedures with the following in each package:

; add to install-int-package
(put 'raise '(int) raise-int)

; add to install-rat-package
(put 'raise '(rational) raise-rat)

; add to install-real-package
(put 'raise '(real) raise-real)
