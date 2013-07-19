;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.59.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 19th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: union-set

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))
;Value: element-of-set?

(define A (union-set '() '()))
;Value: a

(display A)
()
;Unspecified return value


(define B (union-set '() '(S I C P)))
;Value: b

(display B)
(s i c p)
;Unspecified return value

(define C (union-set (list 0 1 2 5) (list 0 2 3 5 7)))
;Value: c

(display C)
(1 0 2 3 5 7)
;Unspecified return value

(define D (union-set '(MIT 6.001 (SICP)) '(Structure and Interpretation of Computer Programs (SICP))))
;Value: d

(display D)
(mit 6.001 structure and interpretation of computer programs (sicp))
;Unspecified return value

