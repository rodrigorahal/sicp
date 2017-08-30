; evaluating a map, like for example (map + (list 1 2 3)),
; will lead to an application:

; ((application? exp)
;  (apply (eval (operator exp) env)
;         (list-of-values (operands exp) env)))

; (eval (operator exp) env) will return the primitive-procedure setup for map
; (operands exp) will return the list (+ (list 1 2 3))
; but list-of-values returns a list made by calling eval with each operand
; the first operand is ‘+ which eval treats as a variable, since it is a symbol
; when it looks up the value in the environment the value returned is
; ‘(primitive +) which scheme’s built in map can’t use
