; Mary Ann Moore's father has a yacht and so has each of his four friends:
; Colonel Downing, Mr. Hall, Sir Barnacle Hood, and Dr. Parker. Each of the five
; also has one daughter and each has named his yacht after a daughter of one of
; the others. Sir Barnacle's yacht is the Gabrielle, Mr. Moore owns the Lorna
; Mr. Hall the Rosalind. The Melissa, owned by Colonel Downing, is named after
; Sir Barnacle's daughter. Gabrielle's father owns the yacht that is named after
; Dr. Parker's daughter. Who is Lorna's father?

; (list 'mary-ann 'gabrielle 'lorna 'rosalind 'melissa))
; (list 'downing 'hall 'barnacle 'parker 'moore)

(list 'father   'daughter 'boat)
;-------------------------------
(list 'moore    'mary-ann 'lorna)
(list 'barnacle 'melissa  'gabrielle)
(list 'hall               'rosalind)
(list 'downing            'melissa)
(list 'parker             'mary-ann)

(define (yachts)
  (define (father sailor) (car sailor))
  (define (daughter sailor) (car (cdr sailor)))
  (define (boat sailor) (car (cdr (cdr sailor))))

  (let ((moore    (list 'moore    'mary-ann                        'lorna))
        (barnacle (list 'barnacle 'melissa                         'gabrielle))
        (hall     (list 'hall     (amb 'gabrielle 'lorna)          'rosalind))
        (downing  (list 'downing  (amb 'gabrielle 'lorna 'rosalind) 'melissa))
        (parker   (list 'parker   (amb 'gabrielle 'lorna 'rosalind) 'mary-ann)))
    (let ((gabrielle-father (amb hall downing parker))
          (lorna-father (amb hall downing parker)))
      (require (eq? (daughter gabrielle-father) 'gabrielle))
      (require (eq? (daughter lorna-father) 'lorna))
      (require (not (eq? (daughter gabrielle-father) (boat gabrielle-father))))
      (require (not (eq? (daughter lorna-father) (boat lorna-father))))
      (require (eq? (daughter parker) (boat gabrielle-father)))
      (list
        moore
        barnacle
        hall
        downing
        parker))))

; ((moore mary-ann lorna)
;  (barnacle melissa gabrielle)
;  (hall gabrielle rosalind)
;  (downing lorna melissa)
;  (parker rosalind mary-ann))

; Downing is Lorna's father.
