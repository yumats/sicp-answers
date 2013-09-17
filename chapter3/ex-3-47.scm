;; ex-3-47

;; a) Implements semaphore with mutex

(define (make-semaphore n)
  (let ((mutex (make-mutex)) (used 0))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (begin
               (mutex 'acquire)
               (if (< used n)
                   (set! used (+ used 1))
                   (begin
                     (mutex 'release)
                     (the-semaphore 'acquire))) ; Retry
               (mutex 'release)))
            ((eq? m 'release)
             (begin
               (mutex 'acquire)
               (if (> used 0)
                   (set! used (- used 1)))
               (mutex 'release)))))
    the-semaphore))
