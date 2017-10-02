; In evaluating a procedure application, the explicit-control evaluator always
; saves and restores the env register around the evaluation of the operator,
; saves and restores env around the evaluation of each operand
; (except the final one), saves and restores argl around the evaluation of each
; operand, and saves and restores proc around the evaluation of the operand
; sequence.

; (f 'x 'y)
; This sequence will be an operator evaluation and two lookup-operands
; instructions. None of these modify any of the registers so all save-restore
; can be eliminated

; ((f) 'x 'y)
; This sequence will be a procedure application, a operator evaluation and
; two lookup-operands instructions; None of these modify any of the registers
; so all save-restore can be eliminated

; (f (g 'x) y)
; This sequence will be an operator evaluation, a procedure application and a
; lookup-variable instruction. _proc_ and _argl_ needs to be saved in the
; first operator evaluation. env does not need to be saved because operands
; are construted in reversed order

; (f (g 'x) 'y)
; Same as previous case
