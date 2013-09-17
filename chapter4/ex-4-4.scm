;; ex-4-4

;; Syntax

(define (and? exp)
  (tagged-list? exp 'and))

(define (or? exp)
  (tagged-list? exp 'or))

;; Eval

(define (eval-and exps env)
  (if (last-exp? exps) (true? (eval (first-exp exps) env))
      (if (true? (eval (first-exp exps) env))
          (eval-and (rest-exps exps) env)
          #f)))

(define (eval-or exps env)
  (if (last-exp? exps) (true? (eval (first-exp exps) env))
      (if (true? (eval (first-exp exps) env))
          #t
          (eval-or (rest-exps exps) env))))

;; [TODO] Derived expressions
