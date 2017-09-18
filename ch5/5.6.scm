afterfib-n-1
   (restore n)
   (restore continue)                             ; ** restoring continue
   ;; set up to compute Fib(n - 2)
   (assign n (op -) (reg n) (const 2))
   (save continue)                                ; ** saving it back
   (assign continue (label afterfib-n-2))
   (save val)
   (goto (label fib-loop))

; the lines with ** can be removed
; the continue value is restored from the stack, not used and then saved back
; in the stack. Removing those instructions will make the machine faster.
