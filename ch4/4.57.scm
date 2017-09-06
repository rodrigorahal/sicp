(rule (same ?x ?x))

(assert! (rule (can-replace ?person-1 ?person-2)
                (and (job ?person-1 ?job-1)
                     (job ?person-2 ?job-2)
                     (or (same ?job-1 ?job-2)
                         (can-do-job ?job-1 ?job-2))
                     (not (same ?person-1 ?person-2)))))

;;; Query input:
(can-replace ?replacer (Fect Cy D))

;;; Query results:
(can-replace (bitdiddle ben) (fect cy d))
(can-replace (hacker alyssa p) (fect cy d))

;;; Query input:
(and (salary ?person-1 ?amount-1)
     (salary ?person-2 ?amount-2)
     (can-replace ?person-1 ?person-2)
     (lisp-value > ?amount-2 ?amount-1))

;;; Query results:
(and (salary (aull dewitt) 25000) (salary (warbucks oliver) 150000) (can-replace (aull dewitt) (warbucks oliver)) (lisp-value > 150000 25000))
(and (salary (fect cy d) 35000) (salary (hacker alyssa p) 40000) (can-replace (fect cy d) (hacker alyssa p)) (lisp-value > 40000 35000))
