(load "2.68.scm")
(load "2.69.scm")

(define rock-alphabet
  '((a 2) (na 16) (boom 1) (sha 3) (get 2) (yip 9) (job 2) (wah 1)))

rock-alphabet

(define rock-tree (generate-huffman-tree rock-alphabet))

rock-tree

(define rock-song
  '(Get a job

    Sha na na na na na na na na

    Get a job

    Sha na na na na na na na na

    Wah yip yip yip yip yip yip yip yip yip

    Sha boom))

(length rock-song)
;=> 36

(define encoded-rock-song (encode rock-song rock-tree))

(length encoded-rock-song)
;=> 84 bits used to encode the song

; In general, if we want to distinguish n different symbols, we will need to
; use log2 n bits per symbol.
; log2 8 = 3 bits/symbol.
; The message has 36 symbols so: 36 symbols x 3 bits/symbol = 108 bits.
