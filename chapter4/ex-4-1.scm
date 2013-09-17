; list-of-values(original)
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (first-operand exps) env)
	    (list-of-values (rest-operands exps) env))))

; list-of-values from left
(define (list-of-values-from-left exps env)
  (if (no-operands? exps)
      '()
      (let ((left (eval (first-operand exps) env)))
	(cons left
	      (list-of-values-from-left (rest-operands exps) env)))))

; list-of-values from right
(define (list-of-values-from-rigfht exps env)
  (if (no-operands? exps)
      '()
      (let ((right (list-of-values-from-rigfht (rest-operands exps) env)))
	(cons (eval (first-operand exps) env)
	       right))))
