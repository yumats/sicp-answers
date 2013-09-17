;(add-load-path ".")
(load "stream")

;stream.scmのstream-mapは複数のストリームに対応していないので再定義する。
;二つのストリームに対応しているだけの簡易版。
(define (stream-map proc s1 s2)
  (if (stream-null? s1)
      the-empty-stream
      (cons-stream (proc (stream-car s1) (stream-car s2))
                   (stream-map proc (stream-cdr s1) (stream-cdr s2)))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define s (cons-stream 1 (add-streams s s)))

(stream-car s)				;1
(stream-ref s 1)			;2
(stream-ref s 2)			;4
(stream-ref s 3)			;8
