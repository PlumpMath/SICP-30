;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Set-Ordered_Lists.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       Jul 20th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of element-of-set?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: element-of-set?

(element-of-set? () '())
;Value: #f

(element-of-set? 0 (list 0 1 2 3))
;Value: #t

(element-of-set? 0 '(0 1 2 3))
;Value: #t

(element-of-set? '0 (list 0 1 2 3))
;Value: #t

(element-of-set? '0 '(0 1 2 3))
;Value: #t

(element-of-set? -1 (list 1 2 3 4 5))
;Value: #f

(element-of-set? 3 (list 1 2 4 5))
;Value: #f

(element-of-set? 3 (list 1 2 3 4 5))
;Value: #t


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of intersection-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: intersection-set

(define A (intersection-set '() '(-2 0 2 4)))
;Value: a

(display A)
()
;Unspecified return value

(define B (intersection-set '(-1 1 3 5 7) '()))
;Value: b

(display B)
()
;Unspecified return value

(define C (intersection-set '() '()))
;Value: c

(display C)
()
;Unspecified return value

(define D (intersection-set (list 1 2 3 4 5 6 7) (list 1 3 5 7 9)))
;Value: d

(display D)
(1 3 5 7)
;Unspecified return value

(define E (intersection-set (list 1 2 3 4 5 6 7) (list 3 5 7 9 11)))
;Value: e

(display E)
(3 5 7)
;Unspecified return value

(define F (intersection-set (list 3 4 5 6 7 8 9 10) (list -3 -1 1 3 5 7 9)))
;Value: f

(display F)
(3 5 7 9)
;Unspecified return value

