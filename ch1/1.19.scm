; Applying _Tpq_ on the pair (a ,b) gives us:
; a = bq + aq + ap
; b = bp + aq

; Applying _Tpq_ twice:

; First
; a1 = b0q + a0q +a0p
; b1 = b0p + a0q

; Second:
; a2 = b1q + a1q + a1p
; b2 = b1p + a1q

; a2 and b2 in terms of a0, b0:

; a2 = (b0p + a0q)q + (b0q + a0q + a0p)(q + p)
; a2 = b0pq + a0q^2 + b0q^2 + b0qp +a0q^2 + a0qp + a0qp + a0p^2
; a2 = 2b0pq + b0q^2 + 2a0q^2 + 2a0qp + a0p^2
; a2 = b0(2pq + q^2) + a0(2q^2 + 2qp + p^2)

; b2 = (b0p + a0q)p + (b0q + a0q + a0p)q
; b2 = b0p^2 + a0pq + b0q^2 + a0q^2 + a0pq
; b2 = b0(p^2 + q^2) + a0(2pq + q^2)

; Rearranging and making a0=a and b0=b:
; a = b(2pq + q^2) + a(2pq + q^2) + a(q^2 + p^2)
; b = b(q^2 + p^2) + a(2pq + qˆ2)

; If applying _Tpq_ twice is the same as applying _Tp'q'_ once, where:
; applying _Tp'q'_ on the pair (a, b) gives us:
; a = bq' + aq' + ap'
; b = bp' + aq'

; We have then from the previous calculations:

; q' = (2pq + q^2)
; p'= (q^2 + p^2)

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p))      ; compute p'
                   (+ (* 2 p q) (* q q))    ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 8)
;=> 21

(fib 20)
;=> 6765
