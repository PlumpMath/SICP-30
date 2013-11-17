;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.40.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Jun 5th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Test for unique-pairs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: unique-pairs

;Value: unique?

(define (flatmap proc sequence)
  (accumulate append '() (map proc sequence)))
;Value: flatmap

(define (accumulate op initial sequence)
  (if (null? sequence)
      '()
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(unique-pairs 0)
;Value: ()

(unique-pairs 1)
;Value: ()

(unique-pairs 2)
;Value 23: ((2 1))

(unique-pairs 4)
;Value 24: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))

(unique-pairs 6)
;Value 22: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))

(unique-pairs 10)
;Value 21: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5) (7 1) (7 2) (7 3) (7 4) (7 5) (7 6) (8 1) (8 2) (8 3) (8 4) (8 5) (8 6) (8 7) (9 1) (9 2) (9 3) (9 4) (9 5) (9 6) (9 7) (9 8) (10 1) (10 2) (10 3) (10 4) (10 5) (10 6) (10 7) (10 8) (10 9))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Test for prime-sum-pairs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: prime-sum-pairs

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
;Value: make-pair-sum

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
;Value: prime-sum?

(define (prime? n)
  (= n (smallest-divisor n)))
;Value: prime?

(define (smallest-divisor n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
	  ((divides? test-divisor n) test-divisor)
	  (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))
;Value: smallest-divisor

(prime-sum-pairs 0)
;Value: ()

(prime-sum-pairs 1)
;Value: ()

(prime-sum-pairs 2)
;Value 29: ((2 1 3))

(prime-sum-pairs 4)
;Value 30: ((2 1 3) (3 2 5) (4 1 5) (4 3 7))

(prime-sum-pairs 6)
;Value 28: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))

(prime-sum-pairs 8)
;Value 31: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11) (7 4 11) (7 6 13) (8 3 11) (8 5 13))

(prime-sum-pairs 10)
;Value 32: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11) (7 4 11) (7 6 13) (8 3 11) (8 5 13) (9 2 11) (9 4 13) (9 8 17) (10 1 11) (10 3 13) (10 7 17) (10 9 19))
