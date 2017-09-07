(assert! (son Adam Cain))
(assert! (son Cain Enoch))
(assert! (son Enoch Irad))
(assert! (son Irad Mehujael))
(assert! (son Mehujael Methushael))
(assert! (son Methushael Lamech))
(assert! (wife Lamech Ada))
(assert! (son Ada Jabal))
(assert! (son Ada Jubal))

(rule (grandson ?x ?y)
  (and (son ?x ?z)
       (son ?z ?y)))

(rule (son ?x ?y)
 (and (wife ?z ?y)
      (son ?x ?z)))

;;; Query input:
(grandson cain ?y)

;;; Query results:
(grandson cain irad)

;-----------------
