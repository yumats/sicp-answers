(define (count-pairs x)
  (define checked-list (cons '() '()))
  (define (includes? list pair)
    ;(display (format "(includes? list:~a pair:~a)\n" list pair))
    (cond
     ((null? list)
      #f)
     ((eq? (car list) pair)
      #t)
     (else (includes? (cdr list) pair))))
  (define (add-checked-list pair)
    ;(display (format "(add-checked-list pair:~a)\n" pair))
    ;(display (format "\tchecked-list:~a\n" checked-list))
    (if (null? (car checked-list))
	(set-car! checked-list pair)
	(append! checked-list (cons pair '())))
    ;(display (format "\tchecked-list:~a\n" checked-list))
    )
  (define (count-pairs-internal x)
    ;(display (format "(count-pairs-internal x:~a)\n" x))
    ;(display (format "\tchecked-list:~a\n" checked-list))
    (cond
     ((not (pair? x))
      0)
     ((includes? checked-list x)
      0)
     (else
      (add-checked-list x)
      ;(display (format "\tx:~a\n" x))
      (+ (count-pairs-internal (car x))
	 (count-pairs-internal (cdr x))
	 1))))
  ;(display (format "(count-pairs x:~a)\n" x))
  (count-pairs-internal x))

(count-pairs '(1 2 3))

; 3
(count-pairs '(0 1 2))

; 4
(define B '(0))
(define C '(1))
(define A (cons B C))
(set-cdr! B C)
(count-pairs A)

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
