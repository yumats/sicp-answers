;; ex-3-55

(define (partial-sums s)
  ; define is necessary
  (define my-s (cons-stream (stream-car s)
                          (add-streams (stream-cdr s) my-s)))
  my-s)
