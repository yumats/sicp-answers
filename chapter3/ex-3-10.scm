;; original code
;
;(define (make-withdraw initial-amount)
;  (let ((balance initial-amount))
;    (lambda (amount)
;      (if (>= balance amount)
;	  (begin (set! balance (- balance amount))
;		 balance)
;	  "Insufficient funds"))))

; let->lambda
(define (make-withdraw initial-amount)
  ((labmda (balance) 
	   (lambda (amount)
	     (if (>= balance amount)
		 (begin (set! balance (- balance amount))
			balance)
		 "Insufficient funds")))
	   initial-amount))

