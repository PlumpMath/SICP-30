;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.35.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jun 1st, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (enumerate-tree t)
  (cond ((null? t) '())
	((not (pair? t)) (list t))
	(else
	 (append (enumerate-tree (car t))
		 (enumerate-tree (cdr t))))))

;Value: accumulate

;Value: enumerate-tree

(define e '())
;Value: e

(define a (list (list 1 2) 3 4))
;Value: a

(define b (list a a))
;Value: b

(define c (list (list 7)))
;Value: c

(define d (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
;Value: d


;; Test of the first implementation of count-leaves

;Value: count-leaves

(count-leaves e)
;Value: 0

(count-leaves a)
;Value: 4

(count-leaves b)
;Value: 8

(count-leaves c)
;Value: 1

(count-leaves d)
;Value: 7


;; Test of the second implementation of count-leaves

;Value: count-leaves

(count-leaves e)
;Value: 0

(count-leaves a)
;Value: 4

(count-leaves b)
;Value: 8

(count-leaves c)
;Value: 1

(count-leaves d)
;Value: 7


;; Test of the third implementation of count-leaves

;Value: count-leaves

(count-leaves e)
;Value: 0

(count-leaves a)
;Value: 4

(count-leaves b)
;Value: 8

(count-leaves c)
;Value: 1

(count-leaves d)
;Value: 7



















