; ex-3.2
(define (make-monitored f)
  (define n 0)
  (define (mf arg)
	(cond ((eq? arg 'how-many-calls?) n)
		  ((eq? arg 'reset-count) (set! n 0))
		  (else (set! n (+ n 1))
				(f arg))))
  mf
)

; test
(define s (make-monitored sqrt))
(print (s 'how-many-calls?))
(print (s 100))
(print (s 121))
(print (s 'how-many-calls?))
(s 'reset-count)
(print (s 'how-many-calls?))
(print (s 144))
(print (s 'how-many-calls?))
