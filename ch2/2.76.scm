;; Generic operations with explicit dispatch

; Adding new data types we have to modify every generic procedure

;; Data-directed programming

; Adding new data types we only have to install new packages with new types
; Adding new operations we have to add the operations to every package

;; Message passing programming

; Adding new data types we have create new constructor with the defined
; operations
; Adding new operations we have to modify every constructor to include the new
; operation

; For a system that adds new types must often a data-directed system would be
; very well suited.

; For a system that adds new operations must often a generic operations with
; explicit dispatch can be well suited.
