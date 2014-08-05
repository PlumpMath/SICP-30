;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.70.scm
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

(define ones (cons-stream 1 ones))
;Value: ones

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
	((pred (stream-car stream))
	 (cons-stream (stream-car stream)
		      (stream-filter pred (stream-cdr stream))))
	(else (stream-filter pred (stream-cdr stream)))))
;Value: stream-filter

(define integers (cons-stream 1 (add-streams ones integers)))
;Value: integers

;Value: merge-weighted

;Value: weighted-pairs



;Value: sum-pairs

(display-stream sum-pairs)

(1 1)
(1 2)
(1 3)
(2 2)
(1 4)
(2 3)
(1 5)
(2 4)
(3 3)
(1 6)
(2 5)
(3 4)
(1 7)
(2 6)
(3 5)
(4 4)
(1 8)
(2 7)
(3 6)
(4 5)
(1 9)
(2 8)
(3 7)
(4 6)
(5 5)
(1 10)
(2 9)
(3 8)
(4 7)
(5 6)
(1 11)
(2 10)
(3 9)
(4 8)
(5 7)
(6 6)
(1 12)
(2 11)
(3 10)
(4 9)
(5 8)
(6 7)
(1 13)
(2 12)
(3 11)
(4 10)
(5 9)
(6 8)
(7 7)
(1 14)
... ; continue until the stack overflows



;Value: divide?

;Value: anti-hamming-int

;Value: anti-hamming-pairs

(display-stream anti-hamming-pairs)

(1 1)
(1 7)
(1 11)
(1 13)
(1 17)
(1 19)
(1 23)
(1 29)
(1 31)
(7 7)
(1 37)
(1 41)
(1 43)
(1 47)
(1 49)
(1 53)
(7 11)
(1 59)
(1 61)
(7 13)
(1 67)
(1 71)
(1 73)
(1 77)
(1 79)
(7 17)
(11 11)
(1 83)
(1 89)
(1 91)
(7 19)
(11 13)
(1 97)
(1 101)
(1 103)
(1 107)
(1 109)
(7 23)
(1 113)
(13 13)
(1 119)
(1 121)
(11 17)
(1 127)
(1 131)
(1 133)
(1 137)
(1 139)
(7 29)
(11 19)
... ; continue until the stack overflows

