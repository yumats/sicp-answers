;; ex-3-73

(define (RC r c dt)
  (lambda (i v0)
    (cons-stream v0
                 (add-streams (scale-stream i r)
                              (integral (scale-stream i (/ c)) v0 dt)))))
