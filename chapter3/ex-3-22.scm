;; ex-3-22

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (dispatch m)
      (cond ((eq? m 'empty?) (null? front-ptr))
            ((eq? m 'front) (car front-ptr))
            ((eq? m 'rear) (car rear-ptr))
            ((eq? m 'insert!)
             (lambda (item)
               (define new-pair (cons item '()))
               (cond ((null? front-ptr)
                      (set! front-ptr new-pair)
                      (set! rear-ptr new-pair))
                     (else
                      (set-cdr! rear-ptr new-pair)
                      (set! rear-ptr new-pair)))))
            ((eq? m 'delete!)
             (cond ((null? front-ptr)
                    (error "Empty queue"))
                   (else
                    (set! front-ptr (cdr front-ptr)))))
            ((eq? m 'print)
             (display front-ptr)
             (newline))
            (else
             (error "Wrong argument"))))
    dispatch))

;; Test

(define testq (make-queue))
(display (testq 'empty?)) ; #t
(newline)

((testq 'insert!) 'a)
(testq 'print) ; (a)

((testq 'insert!) 'b)
(testq 'print) ; (a b)

(testq 'delete!)
(testq 'print) ; (b)

(testq 'delete!)
(testq 'print) ; ()

(testq 'delete!) ; ERROR
