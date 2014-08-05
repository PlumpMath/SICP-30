;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.56.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 18th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: deriv

;Value: exponentiation?

;Value: base

;Value: exponent

;Value: make-exponentiation

(define (variable? x) (symbol? x))
;Value: variable?

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;Value: same-variable?

;; constructor and selectors of sums

(define (make-sum? a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))
;Value: make-sum?

(define (=number? exp num)
  (and (number? exp) (= exp num)))
;Value: =number?

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
;Value: sum?

(define (addend s) (cadr s))
;Value: addend

(define (augend s) (caddr s))
;Value: augend

;; constructor and selectors of products

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))
;Value: make-product

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
;Value: product?

(define (multiplier p) (cadr p))
;Value: multiplier

(define (multiplicand p) (caddr p))
;Value: multiplicand

(deriv '(** x 0) 'x)
;Value: 0

(deriv '(** x 1) 'x)
;Value: 1

(deriv '(** x 100) 'x)
;Value 21: (* 100 (** x 99))

