;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.55.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 24th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: partial-sums

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define ones (cons-stream 1 ones))
;Value: ones

(define integers (cons-stream 1 (add-streams ones integers)))
;Value: integers

(stream-ref (partial-sums integers) 0)
;Value: 1

(stream-ref (partial-sums integers) 1)
;Value: 3

(stream-ref (partial-sums integers) 2)
;Value: 6

(stream-ref (partial-sums integers) 3)
;Value: 10

(stream-ref (partial-sums integers) 4)
;Value: 15

(stream-ref (partial-sums integers) 5)
;Value: 21

