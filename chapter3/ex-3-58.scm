(load "stream")

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(define s1 (expand 1 7 10))
(define s2 (expand 3 8 10))
