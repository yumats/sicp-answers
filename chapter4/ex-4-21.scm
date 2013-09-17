;; ex-4-21
;; a)

(display
 ((lambda (n)
    ((lambda (fact)
       (fact fact n))
     (lambda (ft k)
       (if (= k 1)
           1
           (* k (ft ft (- k 1)))))))
  10))
(newline)

;; Fibonacci

(display
 ((lambda (n)
    ((lambda (fib)
       (fib fib n))
     (lambda (f k)
       (cond ((= k 1) 1)
             ((= k 2) 1)
             (else (+ (f f (- k 1)) (f f (- k 2))))))))
  5))
(newline)

;; b)

(define (f x)
  ((lambda (even? odd?)
     (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) #t (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) #f (ev? ev? od? (- n 1))))))

;; Test

(define test-num1 100)
(define test-num2 101)

(display (list test-num1 "is even number?" (f test-num1)))
(newline)
(display (list test-num2 "is even number?" (f test-num2)))
(newline)
