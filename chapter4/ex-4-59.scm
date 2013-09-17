;; ex-4-59

;; a.

(meeting ?dept (Friday ?time))

;; b.

(rule (meeting-time ?person ?day-and-time)
      (or (and (job ?person (?dept . ?role))
               (meeting ?dept ?day-and-time))
          (meeting whole-company ?day-and-time)))

;; c.

(meeting-time (Hacker Alyssa P) (Wednesday ?time))
