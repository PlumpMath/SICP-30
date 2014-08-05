;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.73.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 27th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   The Basic Derivative Procedure
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp)
					   var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;           The Sum Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-sum-package)
  ;; internal procedures
  (define (sum-deriv operands var)
    (make-sum (deriv (addend operands) var)
	      (deriv (augend operands) var)))
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
	  ((=number? a2 0) a1)
	  ((and (number? a1) (number? a2)) (+ a1 a2))
	  (else (list '+ a1 a2))))
  
  ;; interface to the rest of the system
  (put 'deriv '+ sum-deriv)
  (put 'make '+
       (lambda (a1 a2) (make-sum a1 a2)))
  'done)

(define (make-sum a1 a2)
  ((get 'make '+) a1 a2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;         The Product Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-product-package)
  ;; internal procedures
  (define (product-deriv exp var)
    (make-sum
     (make-product (multiplier exp)
		   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
		   (multiplicand exp))))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	  ((=number? m1 1) m2)
	  ((=number? m2 1) m1)
	  ((and (number? m1) (number? m2)) (* m1 m2))
	  (else (list '* m1 m2))))

  ;; interface to the rest of the system
  (put 'deriv '* product-deriv)
  (put 'make '*
       (lambda (m1 m2) (make-product m1 m2)))
  'done)

(define (make-product m1 m2)
  ((get 'make '*) m1 m2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      The Exponentiation Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-exponentiation-package)
  ;; internal procedures
  (define (exponentiation-deriv exp var)
    (let ((u (base exp))
	  (n (exponent exp)))
      (make-product (make-product n
				  (make-exponentiation u (- n 1)))
		    (deriv u var))))
  (define (base e) (car e))
  (define (exponent e) (cadr e))
  (define (make-exponentiation u n)
    (cond ((=number? n 0) 1)
	  ((=number? n 1) u)
	  ((and (number? u) (number? n))
	   (expt u n))
	  (else (list '** u n))))

  ;; interface to the rest of the system
  (put 'deriv '** exponentiation-deriv)
  (put 'make '**
       (lambda (u n) (make-exponentiation u n)))
  'done)

(define (make-exponentiation u n)
  ((get 'make '**) u n))




