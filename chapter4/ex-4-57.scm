;; ex-4-57

(rule (replace ?person1 ?person2)
      (and
       (or (and (job ?person1 ?role)
                (job ?person2 ?role))
           (and (job ?person1 ?role1)
                (job ?perosn2 ?role2)
                (can-do-job ?role1 ?role2)))
       (not (same ?person1 ?person2))))

;; a.

(replace ?person (Fect Cy D))

;; b.

(and (replace ?person1 ?person2)
     (salary ?person1 ?amount1)
     (salary ?person2 ?amount2)
     (lisp-value > ?amount1 ?amount2))
