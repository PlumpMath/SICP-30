;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.56.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 24th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (merge s1 s2)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else
	 (let ((s1car (stream-car s1))
	       (s2car (stream-car s2)))
	   (cond ((< s1car s2car)
		  (cons-stream s1car (merge (stream-cdr s1) s2)))
		 ((> s1car s2car)
		  (cons-stream s2car (merge (stream-cdr s2) s1)))
		 (else
		  (cons-stream s1car
			       (merge (stream-cdr s1)
				      (stream-cdr s2)))))))))
;Value: merge

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
;Value: scale-stream

;Value: s

(stream-ref S 0)
;Value: 1

(stream-ref S 1)
;Value: 2

(stream-ref S 2)
;Value: 3

(stream-ref S 3)
;Value: 4

(stream-ref S 4)
;Value: 5

(stream-ref S 5)
;Value: 6

(stream-ref S 6)
;Value: 8

(stream-ref S 7)
;Value: 9

(stream-ref S 8)
;Value: 10

(stream-ref S 9)
;Value: 12

(stream-ref S 10)
;Value: 15

