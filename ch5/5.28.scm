; tail-recursive
ev-sequence
  (assign exp (op first-exp) (reg unev))
  (test (op last-exp?) (reg unev))
  (branch (label ev-sequence-last-exp))
  (save unev)
  (save env)
  (assign continue (label ev-sequence-continue))
  (goto (label eval-dispatch))
ev-sequence-continue
  (restore env)
  (restore unev)
  (assign unev (op rest-exps) (reg unev))
  (goto (label ev-sequence))
ev-sequence-last-exp
  (restore continue)
  (goto (label eval-dispatch))

; to remove tail-recursion we only need to
; remove the special handling of last-exp

ev-sequence
  (test (op no-more-exps?) (reg unev))
  (branch (label ev-sequence-end))
  (assign exp (op first-exp) (reg unev))
  (save unev)
  (save env)
  (assign continue (label ev-sequence-continue))
  (goto (label eval-dispatch))
ev-sequence-continue
  (restore env)
  (restore unev)
  (assign unev (op rest-exps) (reg unev))
  (goto (label ev-sequence))
ev-sequence-end
  (restore continue)
  (goto (reg continue))

; The only difference is that we go through the
; save-restore cycle for the last expression in
; a sequence as well as for the others.


; tail-recursive
type	     maximum-depth   total-pushes
recursive	        5n + 3       32n – 16
iterative	            13       35n + 29

; not tail-recursive
type	     maximum-depth   total-pushes
recursive	        8n + 3       34n – 16
iterative	        3n + 14      37n + 33
