; a.
(define balance 100)

(define (reset)
  (set! balance 100)
  ;(print "reset:" balance)
  )

(define (peter)
  (set! balance (+ balance 10))
  ;(print "peter:" balance)
  )
(define (paul)
  (set! balance (- balance 20))
  ;(print "paul:" balance)
  )
(define (mary)
  (set! balance (- balance (/ balance 2)))
  ;(print "mary:" balance)
  )

(define (check list)
  (cond
   [(null? list) (print "result:" balance)]
   [else
    ((car list))
    (check (cdr list))]))

; not smart
(define (test-a)
  (reset)
  (check (list peter paul mary))
  (reset)
  (check (list peter mary paul))
  (reset)
  (check (list paul peter mary))
  (reset)
  (check (list paul mary peter))
  (reset)
  (check (list mary peter paul))
  (reset)
  (check (list mary paul peter)))
; 35, 40, 45, 50

; b.?
