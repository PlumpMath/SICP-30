;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.67.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 3rd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
	     (stream-for-each proc (stream-cdr s)))))
;Value: stream-for-each

(define (display-stream s)
  (stream-for-each display-line s))
;Value: display-stream

(define (display-line x)
  (newline)
  (display x))
;Value: display-line

(define ones (cons-stream 1 ones))
;Value: ones

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define integers (cons-stream 1 (add-streams ones integers)))
;Value: integers

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))
;Value: interleave

;Value: pairs

(display-stream (pairs integers integers))

(1 1)
(2 1)
(1 2)
(3 1)
(2 2)
(4 1)
(1 3)
(5 1)
(3 2)
(6 1)
(1 4)
(7 1)
(2 3)
(8 1)
(1 5)
(9 1)
(4 2)
(10 1)
(1 6)
(11 1)
(3 3)
(12 1)
(1 7)
(13 1)
(5 2)
(14 1)
(1 8)
(15 1)
(2 4)
(16 1)
(1 9)
(17 1)
(6 2)
(18 1)
(1 10)
(19 1)
(4 3)
(20 1)
(1 11)
(21 1)
(7 2)
(22 1)
(1 12)
(23 1)
(2 5)
(24 1)
(1 13)
(25 1)
(8 2)
(26 1)
... ; continue until the stack overflows

