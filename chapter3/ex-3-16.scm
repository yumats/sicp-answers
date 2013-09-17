(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))

; 3
(count-pairs '(0 1 2))

; 4
(define B '(0))
(define C '(1))
(define A (cons B C))
(set-cdr! B C)
(count-pairs A)
;; Cを2回数えるので4になる

; 7
(set-car! B C)
(set-cdr! A B)
(count-pairs A)

; 0
(define C (cons 2 '()))
(define B (cons 1 C))
(define A (cons 0 B))
(set-cdr! C A)
; inifinite loop
(count-pairs A)
