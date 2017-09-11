(define ones (cons-stream 1 ones))

; cons-stream only evaluates the first item, leaving the second item to be
; evaluated only when needed (forced)

(define THE-ASSERTIONS the-empty-stream)

; original add-assertion!
(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (let ((old-assertions THE-ASSERTIONS))
    (set! THE-ASSERTIONS
          (cons-stream assertion old-assertions))
    'ok))

; modified add-assertion!
(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion THE-ASSERTIONS))
  'ok)

; if we use the modified version of add-assertion!, THE-ASSERTIONS stream will
; be and infinite self-referential loop just like ones
; the let bindings forces the stream to evaluate the assertions and avoids the
; infinite stream
