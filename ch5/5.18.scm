(define (make-register name)
  (let ((contents '*unassigned*)
        (trace? #f))
    (define (set-register value)
      (if trace?
        (begin (newline)
               (display (list "register " name ": " contents " ->" value))))
      (set! contents value))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set) set-register)
            ((eq? message 'trace-on) (set! trace? #t))
            ((eq? message 'trace-off) (set! trace? #f))
            (else
             (error "Unknown request -- REGISTER" message))))
    dispatch))

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '()))
    (let ((the-ops
           (list (list 'initialize-stack
                       (lambda () (stack 'initialize)))
                 ;;**next for monitored stack (as in section 5.2.4)
                 ;;  -- comment out if not wanted
                 (list 'print-stack-statistics
                       (lambda () (stack 'print-statistics)))))
          (register-table
           (list (list 'pc pc) (list 'flag flag))))
      (define (allocate-register name)
        (if (assoc name register-table)
            (error "Multiply defined register: " name)
            (set! register-table
                  (cons (list name (make-register name))
                        register-table)))
        'register-allocated)
      (define (lookup-register name)
        (let ((val (assoc name register-table)))
          (if val
              (cadr val)
              (error "Unknown register:" name))))
      (define (execute)
        (let ((insts (get-contents pc)))
          (if (null? insts)
              'done
              (begin
                ((instruction-execution-proc (car insts)))
                (execute)))))
      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents! pc the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq) (set! the-instruction-sequence seq)))
              ((eq? message 'allocate-register) allocate-register)
              ((eq? message 'get-register) lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops) (set! the-ops (append the-ops ops))))
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ((eq? message 'set-register-trace)          ;; **
                (lambda (reg-name trace?)
                  (let (reg (lookup-register reg-name))
                    (if trace?
                      (reg 'trace-on)
                      (reg 'trace-off)))))
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))
