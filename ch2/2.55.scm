(car ''abracadabra)
;=> quote

; From the number 34 footnote:

; Strictly, our use of the quotation mark violates the general rule that all
; compound expressions in our language should be delimited by parentheses and
; look like lists. We can recover this consistency by introducing a special form
; quote, which serves the same purpose as the quotation mark. Thus, we would type
; (quote a) instead of 'a, and we would type (quote (a b c)) instead
; of '(a b c). This is precisely how the interpreter works. The quotation mark
; is just a single-character abbreviation for wrapping the next complete
; expression with quote to form (quote <expression>). This is important because
; it maintains the principle that any expression seen by the interpreter can be
; manipulated as a data object. For instance, we could construct the expression
; (car '(a b c)), which is the same as (car (quote (a b c))), by evaluating
; (list 'car (list 'quote '(a b c))).

(car (quote (quote abracadabra)))
;=> quote
