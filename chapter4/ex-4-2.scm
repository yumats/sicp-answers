(add-load-path ".")
(load "interpreter")

(my-eval '(define x 3) #f)			;ok

;; Louis version
(define (my-eval exp env)
  (cond
   [(self-evaluating? exp) exp]
   [(variable? exp) (lookup-variable-value exp env)]
   [(quoted? exp) (text-of-quotation exp)]
   [(application? exp)
    (my-apply (my-eval (operator exp) env) (list-of-values (operands exp) env))]
   [(assignment? exp) (eval-assignment exp env)]
   [(definition? exp) (eval-definition exp env)]
   [(if? exp) (eval-if exp env)]
   [(lambda? exp)
    (make-procedure
     (lambda-parameters exp)
     (lambda-body exp)
     env)]
   [(begin? exp) (eval-sequence (begin-actions exp) env)]
   [(cond? exp) (my-eval (cond->if exp) env)]
   [else (error "Unknown expression type -- EVAL" exp)]))

;; a.
(my-eval '(define x 3) #f)			;ERROR

;; b.
(define (application? exp)
  ;(format #t "application? ~a\n" exp)
  (eq? (car exp) 'call))
  (pair? exp))

(define (my-eval exp env)
  (cond
   [(self-evaluating? exp) exp]
   [(variable? exp) (lookup-variable-value exp env)]
   [(quoted? exp) (text-of-quotation exp)]
   [(application? exp)
    (my-apply (my-eval (operator (cdr exp)) env) (list-of-values (operands (cdr exp)) env))]
   [(assignment? exp) (eval-assignment exp env)]
   [(definition? exp) (eval-definition exp env)]
   [(if? exp) (eval-if exp env)]
   [(lambda? exp)
    (make-procedure
     (lambda-parameters exp)
     (lambda-body exp)
     env)]
   [(begin? exp) (eval-sequence (begin-actions exp) env)]
   [(cond? exp) (my-eval (cond->if exp) env)]
   [else (error "Unknown expression type -- EVAL" exp)]))

(my-eval '(call + 1 2) #f)
