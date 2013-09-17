;; ex-4-6

;; Addition to cond of eval
; ((let? exp) (eval (let->combination exp) env))

(define (let? exp) (tagged-list? exp 'let))

(define (let-vars exp) (cadr exp))

(define (let-body exp) (caddr exp))

(define (let->combination exp)
  (cons (make-lambda
         (map car (let-vars exp))
         (let-body exp))
        (map cadr (let-vars exp))))
