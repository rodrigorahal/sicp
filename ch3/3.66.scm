; pairs starts with (stream-car s) and (stream-car t): (1 1)
; then interleaves elements of the first row: (1 2) (1 3) (1 4) (1 5) ...
; with recursive lements  of (stream-cdr s) (stream-cdr t)
; Generating:

;(1 1)
;(1 2)
;(2 2)
;(1 3)
;(2 3)
;(1 4)
;(3 3)

; and so on...

; to produce (1 100) in the first row, pairs will have to produce the same
; amount of pairs in the recursive elements minus one, so:
; 99 elements in the first row + 98 elements in the recursive elements
; there are 197 elements before (1 100)
