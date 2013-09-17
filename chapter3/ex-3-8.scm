;; 2008/02/18 matsui

;; (define (f n) (...)) is inappropriate.

(define f
  (let ((flag 1))
    (lambda (n)
      (if (= n 0)
          (set! flag 0))
      flag)))
; フラグがリセットされないので、ファイルをロードしなおす必要がある。