;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.39.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jun 4th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Test of reverse implemented by fold-right

;Value: reverse

(define (fold-right op initial sequence)
  (if (null? sequence)
      '()
      (op (car sequence )
	  (fold-right op initial (cdr sequence)))))
;Value: fold-right

(reverse (list 1 4 9 16 25))
;Value 22: (25 16 9 4 1)


;; Test of reverse implemented by fold-left

;Value: reverse

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))
;Value: fold-left

(reverse (list 1 4 9 16 25))
;Value 23: (25 16 9 4 1)

