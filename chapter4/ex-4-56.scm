;; ex-4-56

;; a.
(and (supervisor ?person (Bitdiddle Ben))
     (address ?person ?addr))

;; b.
(and (salary (Bitdiddle Ben) ?bens)
     (salary ?person ?amount)
     (lisp-value < ?amount ?bens))

;; c.
(and (supervisor ?person ?boss)
     (job ?boss ?dept)
     (not (job ?boss (computer . ?role)))) ; 'not' should be written last?
