(define (get-record division name)
  ((get 'record division) name))

; get-record receives a division and an employee name and retrieves the
; the record file from the division latter applying the employee name to
; get the keyed record

(define (get-salary division employee-record)
  ((get 'salary division) employee-record))

; get-salary receives a division and an employee-record and retrieves the
; procedure that know how to get the salary from that division latter applying
; it to the employee-record to get the salary

(define (find-employee-record name divisions)
  (if (null? divisions)
      #f
      (let ((found-record (get-record (car divisions) name)))
        (if found-record
            found-record
            (find-employee-record name (cdr divisions))))

; When Insatiable takes over a new company, the new personnel information needs
; to be installed under the new division with procedures to get address and
; salary.
