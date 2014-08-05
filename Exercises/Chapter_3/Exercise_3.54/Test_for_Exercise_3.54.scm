;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.54.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 23rd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: mul-streams

;Value: factorials

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
;Value: stream-ref

(define ones (cons-stream 1 ones))
;Value: ones

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define integers
  (cons-stream 1
	       (add-streams ones integers)))
;Value: integers

(stream-ref factorials 0)
;Value: 1

(stream-ref factorials 1)
;Value: 1

(stream-ref factorials 2)
;Value: 2

(stream-ref factorials 3)
;Value: 6

(stream-ref factorials 4)
;Value: 24

(stream-ref factorials 5)
;Value: 120

(stream-ref factorials 6)
;Value: 720

