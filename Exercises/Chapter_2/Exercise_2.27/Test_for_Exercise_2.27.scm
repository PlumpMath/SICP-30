;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.27.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 30th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: deep-reverse

;Value: last-sublist

;Value: former-sublists

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
;Value: length

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
;Value: list-ref

(define (reverse items)
  (cond ((null? items) '())
	((null? (cdr items)) items)
	(else
	 (cons (last-element items)
	       (reverse (former-elements items))))))
;Value: reverse

(define (last-element items)
  (let ((list-length (length items)))
    (list-ref items (- list-length 1))))
;Value: last-element

(define (former-elements items)
  (if (or (null? items)
	  (null? (cdr items)))
      '()
      (cons (car items)
	    (former-elements (cdr items)))))
;Value: former-elements

(define x (list (list 1 2) (list 3 4)))
;Value: x

x
;Value 13: ((1 2) (3 4))

(reverse x)
;Value 14: ((3 4) (1 2))

(deep-reverse x)
;Value 15: ((4 3) (2 1))

(define y (list 1))
;Value: y

(deep-reverse y)
;Value 16: (1)

(define z '())
;Value: z

(deep-reverse z)
;Value: ()

(define m (list (list (list 1 2 3)
		      (list 4 5 6)
		      (list 7 8 9))
		(list (list 10 11 12)
		      (list 13 14 15)
		      (list 16 17 18))
		(list (list 19 20 21)
		      (list 22 23 24)
		      (list 25 26 27))))
;Value: m

(deep-reverse m)
;Value 17: (((27 26 25) (24 23 22) (21 20 19)) ((18 17 16) (15 14 13) (12 11 10)) ((9 8 7) (6 5 4) (3 2 1)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Test for Another implementation of last-sublist
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (last-sublist items)
  (cond ((null? items) '())
	((null? (cdr items)) (car items))
	(else
	 (last-sublist (cdr items)))))
;Value: last-sublist

(deep-reverse x)
;Value 18: ((4 3) (2 1))

(deep-reverse y)
;Value 19: (1)

(deep-reverse z)
;Value: ()

(deep-reverse m)
;Value 20: (((27 26 25) (24 23 22) (21 20 19)) ((18 17 16) (15 14 13) (12 11 10)) ((9 8 7) (6 5 4) (3 2 1)))

