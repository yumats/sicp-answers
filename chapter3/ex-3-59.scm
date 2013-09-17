;; ex-3-59
;; a)

(define (integrate-series stream)
  (define (iter s n)
    (cons-stream (/ (stream-car s) n)
                 (iter (stream-cdr s) (+ n 1))))
  (iter stream 1))

;; b)

; integral sin = - cos
(define cosine-series
  (cons-stream 1 (stream-map - (integrate-series sine-series))))

; integral cos = sin
(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))
