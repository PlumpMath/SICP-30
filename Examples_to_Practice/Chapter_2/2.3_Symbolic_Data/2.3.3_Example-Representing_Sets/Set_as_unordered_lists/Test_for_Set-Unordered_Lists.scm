;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Set-Unordered_Lists.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       Jul 19th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of procedure element-of-set?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: element-of-set?

(element-of-set? '() (list '()))
;Value: #t

(element-of-set?  (list '()) '())
;Value: #f

(element-of-set? '() '(0 ()))
;Value: #t

(element-of-set?  0 '())
;Value: #f

(element-of-set? 1 (list 1 2 3))
;Value: #t

(element-of-set? 2 (list 1 2 3))
;Value: #t

(element-of-set? 3 (list 1 2 3))
;Value: #t

(element-of-set? 'a '(a b r c d))
;Value: #t

(element-of-set? 'b '(a b r c d))
;Value: #t

(element-of-set? 'r '(a b r c d))
;Value: #t

(element-of-set? 'c '(a b r c d))
;Value: #t

(element-of-set? 'd '(a b r c d))
;Value: #t


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of procedure adjoin-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: adjoin-set

(define A (adjoin-set '() (list 1 2 3 4 5)))
;Value: a

(display A)
(() 1 2 3 4 5)
;Unspecified return value

(define B (adjoin-set 0 (list 1 2 3 4 5)))
;Value: b

(display B)
(0 1 2 3 4 5)
;Unspecified return value


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Test of procedure intersection-set
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: intersection-set

(define X (intersection-set '() (list 1 2 3 4 5)))
;Value: x

(display X)
()
;Unspecified return value

(define Y (intersection-set (list 2 4 6 8) (list 1 2 3 4 5)))
;Value: y

(display Y)
(2 4)
;Unspecified return value


