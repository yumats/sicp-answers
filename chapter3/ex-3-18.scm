(define (cyclic-list? list)
  (define first (car list))
  (define (iter l)
    (cond ((null? (cdr l)) #f)
          ((eq? (cadr l) first) #t)
          (else (iter (cdr l)))))
  (iter list))

;; これだと途中で循環しているようなリストを判定できない

;; From ex-3-13

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;; Test

(cyclic-list? '(1 2 3)) ; Expected to be #f
(cyclic-list? z) ; Expected to be #t
