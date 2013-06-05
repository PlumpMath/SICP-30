;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.41.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jun 5th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: sum-s-triple

;Value: make-triple-sum

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else
	 (filter predicate (cdr sequence)))))
;Value: filter

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

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))
;Value: remove

(sum-s-triple 4 5)
;Value: ()

(sum-s-triple 5 6)
;Value 20: ((1 2 3 6) (1 3 2 6) (2 1 3 6) (2 3 1 6) (3 1 2 6) (3 2 1 6))

(sum-s-triple 6 7)
;Value 21: ((1 2 4 7) (1 4 2 7) (2 1 4 7) (2 4 1 7) (4 1 2 7) (4 2 1 7))

(sum-s-triple 6 8)
;Value 24: ((1 2 5 8) (1 3 4 8) (1 4 3 8) (1 5 2 8) (2 1 5 8) (2 5 1 8) (3 1 4 8) (3 4 1 8) (4 1 3 8) (4 3 1 8) (5 1 2 8) (5 2 1 8))

(sum-s-triple 7 8)
;Value 22: ((1 2 5 8) (1 3 4 8) (1 4 3 8) (1 5 2 8) (2 1 5 8) (2 5 1 8) (3 1 4 8) (3 4 1 8) (4 1 3 8) (4 3 1 8) (5 1 2 8) (5 2 1 8))

(sum-s-triple 8 9)
;Value 23: ((1 2 6 9) (1 3 5 9) (1 5 3 9) (1 6 2 9) (2 1 6 9) (2 3 4 9) (2 4 3 9) (2 6 1 9) (3 1 5 9) (3 2 4 9) (3 4 2 9) (3 5 1 9) (4 2 3 9) (4 3 2 9) (5 1 3 9) (5 3 1 9) (6 1 2 9) (6 2 1 9))

(sum-s-triple 8 10)
;Value 25: ((1 2 7 10) (1 3 6 10) (1 4 5 10) (1 5 4 10) (1 6 3 10) (1 7 2 10) (2 1 7 10) (2 3 5 10) (2 5 3 10) (2 7 1 10) (3 1 6 10) (3 2 5 10) (3 5 2 10) (3 6 1 10) (4 1 5 10) (4 5 1 10) (5 1 4 10) (5 2 3 10) (5 3 2 10) (5 4 1 10) (6 1 3 10) (6 3 1 10) (7 1 2 10) (7 2 1 10))

