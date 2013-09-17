; ex-3.4
(define (make-account-3-4 balance pw)
  (define passwd pw)
  (define errors 0)
  (define (withdraw amount)
	(if (>= balance amount)
		(begin (set! balance (- balance amount))
			   balance)
		"Insufficient funds"))
  (define (deposit amount)
	(set! balance (+ balance amount))
	balance)
  (define (password-error arg)
	"Incorrect password")
  (define (call-the-cops arg)
	"Called call-the-cops")
  (define (dispatch pw m)
	(cond ((eq? pw passwd)
		   (set! errors 0)
			(cond ((eq? m 'withdraw) withdraw)
				  ((eq? m 'deposit) deposit)
				  (else (error "Unknown request -- MAKE-ACCOUNT"
								m))))
		  (else (set! errors (+ errors 1))
				(if (>= errors 7) call-the-cops
					password-error))))
  dispatch)

; test
(define (ex-3-4-test)
  (define acc (make-account-3-4 100 'secret-password))
  (print ((acc 'secret-password 'withdraw) 10))
  (print ((acc 'some-other-password 'deposit) 10))  ; Wrong password 1
  (print ((acc 'some-other-password 'withdraw) 10)) ; Wrong password 2
  (print ((acc 'secret-password 'withdraw) 10))     ; Reset
  (print ((acc 'some-other-password 'deposit) 10))  ; Wrong password 1
  (print ((acc 'some-other-password 'withdraw) 10)) ; Wrong password 2
  (print ((acc 'some-other-password 'deposit) 10))  ; Wrong password 3
  (print ((acc 'some-other-password 'withdraw) 10)) ; Wrong password 4
  (print ((acc 'some-other-password 'deposit) 10))  ; Wrong password 5
  (print ((acc 'some-other-password 'withdraw) 10)) ; Wrong password 6
  (print ((acc 'some-other-password 'deposit) 10))  ; Wrong password 7
  (print ((acc 'some-other-password 'withdraw) 10)) ; Wrong password 8
)
