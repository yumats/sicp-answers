;; ex-3-69

(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (pairs (stream-cdr t) (stream-cdr u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define pythagoras-stream
  (let ((int-triples (triples integers integers integers)))
    (stream-filter (lambda (triple)
                     (let ((i (car triple)) (j (cadr triple)) (k (caddr triple)))
                       (= (+ (* i i) (* j j)) (* k k))))
                   int-triples)))
