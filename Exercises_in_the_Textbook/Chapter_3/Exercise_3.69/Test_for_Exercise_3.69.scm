;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.69.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 4th, 2013
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

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter pred
				     (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))))
;Value: stream-filter

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

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))
;Value: pairs

;Value: triples

(display-stream (triples integers integers integers))

(1 1 1)
(1 1 2)
(2 2 2)
(1 2 2)
(2 2 3)
(1 1 3)
(3 3 3)
(1 2 3)
(2 3 3)
(1 1 4)
(3 3 4)
(1 3 3)
(2 2 4)
(1 1 5)
(4 4 4)
(1 2 4)
(2 3 4)
(1 1 6)
(3 4 4)
(1 3 4)
... ; continue until the stack overflows



(define (square x) (* x x))
;Value: square

;Value: pythagorean-pred?

;Value: pythagorean-triples

(display-stream pythagorean-triples)

(3 4 5)
(6 8 10)
(5 12 13)
(9 12 15)
(8 15 17)
(12 16 20)
...

