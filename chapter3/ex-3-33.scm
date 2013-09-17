; c = (a + b) / 2
; 2c = u = a + b
(define (averager a b c)
  (let
      ((u (make-connector))
       (v (make-connector)))
    (multiplier c v u)
    (adder a b u)
    (constant 2 v)
    'ok))
