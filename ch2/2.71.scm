; Suppose we have a Huffman tree for an alphabet of n symbols, and that the
; relative frequencies of the symbols are 1, 2, 4, ..., 2n-1.

; For n = 5:
; Initial leaves {(A 1) (B 2) (C 4) (D 8) (E 16)}
; Merge          {(AB 3) (C 4) (D 8) (E 16)}
; Merge          {(ABC 7) (D 8) (E 16)}
; Merge          {(ABCD 15) (E 16)}
; Final merge    {(ABCDE 31)}

;              (ABCDE 31)
;                  /\
;                 /  \
;            (E 16)   (ABCD 15)
;                         /\
;                        /  \
;                   (D 8)    (ABC 7)
;                              /\
;                             /  \
;                          (C 4)  (AB 3)
;                                   /\
;                                  /  \
;                              (B 2)  (A 1)

; The most frequent symbol is encoded with one bit and
; the least frequent symbol is encoded with 4 bits
; which is equal to the number of merges performed.

; We can prove that the merges are always done in increase order of frequencies
; that means that we always merge the lone symbol we the least frequency to
; the merged symbols

; So for any _n_ the most frequent symbol is encoded with one bit and the least
; frequent symbol is encoded with (n-1) symbols
