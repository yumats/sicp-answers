; ex-3.7
(define (make-account balance pw)
  (define passwd pw)
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
  (define (dispatch pw m)
    (if (eq? pw passwd)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      (else (error "Unknown request -- MAKE-ACCOUNT"
			   m)))
	password-error))
  dispatch)

; 作成時にパスワードのチェックをしたい場合は、０をwithdrawするなどして
; 返り値をチェックする必要がある。
(define (make-joint origacc origpw newpw)
  (define (password-error arg)
    "Incorrect password")
  (define (dispatch pw m)
    (if (eq? pw newpw)
	(origacc origpw m)
	password-error))
  dispatch)

; test
(define acc (make-account 100 'secret-password))
; 60
(print ((acc 'secret-password 'withdraw) 40))
; "Incorrect password"
(print ((acc 'some-other-password 'deposit) 50))

(define peter-acc (make-account 100 'open-sesame))
; ここは"Incorrect password"と表示して欲しいが、パスワードの有効性チェッ
; クはdispatch内部で行われるので作成できてしまう。
(define paul-acc (make-joint peter-acc 'other-open-sesame 'rosebud))
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))
; "Incorrect password"
(print ((paul-acc 'open-sesame 'withdraw) 40))
; 60
(print ((paul-acc 'rosebud 'withdraw) 40))
; 10
(print ((peter-acc 'open-sesame 'withdraw) 50))
