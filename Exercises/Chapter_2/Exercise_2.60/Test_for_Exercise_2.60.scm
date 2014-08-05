;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.60.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 19th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of element-of-set?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: element-of-set?

(element-of-set? () '())
;Value: #f

(element-of-set? () '(0))
;Value: #f

(element-of-set? 0 '(0 1 1 2 3))
;Value: #t

(element-of-set? 'S '(S I C P))
;Value: #t

(element-of-set? 'S '(Structure and Interpretation of Computer Programs))
;Value: #f


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of adjoin-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: adjoin-set

(define A (adjoin-set '() '(Will it be joint?)))
;Value: a

(display A)
(() will it be joint?)
;Unspecified return value

(define B (adjoin-set 1 (list 8 6 6 2 1)))
;Value: b

(display B)
(1 8 6 6 2 1)
;Unspecified return value

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of intersection-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: intersection-set

(define X (intersection-set '() (list 1 2 3 4 5)))
;Value: x

(display X)
()
;Unspecified return value

(define Y (intersection-set (list 0 0 1 1 2 3 5 8 8) (list 1 1 5 8 8 13)))
;Value: y

(display Y)
(1 1 5 8 8)
;Unspecified return value

(define Z (intersection-set '(a b r a) '(c a d a b r a)))
;Value: z

(display Z)
(a b r a)
;Unspecified return value


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of union-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: union-set

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
	    (append (cdr list1) list2))))
;Value: append

(define M (union-set '() (list 0 0 1 1 2)))
;Value: m

(display M)
(0 0 1 1 2)
;Unspecified return value

(define N (union-set (list 0 0 1 1 2 3 3 5 5 8) (list 0 1 1 2 2 3 5 8 8)))
;Value: n

(display N)
(0 0 1 1 2 3 3 5 5 8 0 1 1 2 2 3 5 8 8)
;Unspecified return value

(define P (union-set '(a b r a c a) '(d a b r a)))
;Value: p

(display P)
(a b r a c a d a b r a)
;Unspecified return value

