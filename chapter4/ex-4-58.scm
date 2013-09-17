;; ex-4-58

(rule (big-shot ?person)
      (and (job ?person (?dept1 . ?role1))
           (supervisor ?person ?boss)
           (job ?boss (?dept2 . ?role2))
           (not (same ?dept1 ?dept2))))
