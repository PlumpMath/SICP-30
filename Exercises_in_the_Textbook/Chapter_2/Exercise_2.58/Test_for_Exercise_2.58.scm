;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.58.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 18th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var))
	  (make-product (multiplicand exp)
			(deriv (multiplier exp) var))))
	(else
	 (error "unknown expression type -- DERIV" exp))))
;Value: deriv

(define (variable? x) (symbol? x))
;Value: variable?

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;Value: same-variable?

(define (=number? exp num)
  (and (number? exp) (= exp num)))
;Value: =number?


;;;;;;;;;;
;; a.
;;;;;;;;;;

;Value: sum?

;Value: addend

;Value: augend

;Value: make-sum

;Value: product?

;Value: multiplier

;Value: multiplicand

;Value: make-product

(deriv '(x + 3) 'x)
;Value: 1

(deriv '(x * y) 'x)
;Value: y

(deriv '((x * y) * (x + 3)) 'x)
;Value 20: ((x * y) + ((x + 3) * y))

(deriv '(x + (3 * (x + (y + 2)))) 'x)
;Value: 4


;;;;;;;;;;
;; b.
;;;;;;;;;;

;Value: sum?

;Value: addend

;Value: simplify

;Value: augend

;Value: make-sum

;Value: product?

;Value: multiplier

;Value: multiplicand

;Value: make-product

(deriv '(x + 3 * (x + y + 2)) 'x)
;Value: 4

