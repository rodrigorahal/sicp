(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
 (define (add-dx x) (+ x dx))
 (* (sum f (+ a (/ dx 2.0)) add-dx b)
    dx))

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define (h) (/ (- b a) n))
  (define (simp-term k)
    (cond ((or (= k 0) (= k n)) (f (+ a (* k (h)))))
          ((odd? k) (* 4 (f (+ a (* k (h))))))
          ((even? k) (* 2 (f (+ a (* k (h))))))))
  (* (/ (h) 3.0) (sum simp-term 0 inc n))
)

(simpson cube 0 1 100)
;=> .25

(integral cube 0 1 0.01)
;=> .24998750000000042

(simpson cube 0 1 1000)
;=> .25

(integral cube 0 1 0.001)
;=> .249999875000001

; dx = h = (b - a) / n
; n = (b - a) / dx
; if dx = 0.01, n = 100
; if dx = 0.01, n = 1000
