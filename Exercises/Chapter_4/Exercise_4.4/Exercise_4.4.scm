;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Dec 16th, 2013
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 16th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜世敏, aka 颜序)
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
;;      The new definition of eval
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp))
	((assignment? exp) (eval-assignment exp env))
	((definition? exp) (eval-definition exp env))
	((if? exp) (eval-if exp env))
	((and? exp) (eval-and exp env))
	((or? exp) (eval-or exp env))
	((lambda? exp)
	 (make-procedure (lambda-paramenters exp)
			 (lambda-body exp)
			 env))
	((begin? exp)
	 (eval-sequence (begin-actions exp) env))
	((cond? exp) (eval (cond->if exp) env))
	((application? exp)
	 (apply (eval (operator exp) env)
		(list-of-values (operands) env)))
	(else
	 (error "Unknown expression type -- EVAL" exp))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     'And' special form  
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (and? exp) (tagged-list? exp 'and))

(define (and-predicates exp) (cdr exp))

(define (and-last-predicate? predicates)
  (null? (cdr predicates)))

(define (eval-and exp env)
  (eval-and-predicates (and-predicates exp) env))

(define (eval-and-predicates predicates env)
  (if (null? predicates)
      true
      (let ((first (car predicates))
	    (rest (cdr predicates)))
	(if (and-last-predicate? predicates)
	    (if (true? (eval first env))
		(eval first env)
		false)
	    (if (true? (eval first env))
		(eval-and-predicates rest env)
		false)))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      'Or' special form
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (or? exp) (tagged-list? exp 'or))

(define (or-predicates exp) (cdr exp))

(define (or-last-predicate? predicates)
  (null? (cdr predicates)))

(define (eval-or exp env)
  (eval-or-predicates (or-predicates exp) env))

(define (eval-or-predicates predicates env)
  (if (null? predicates)
      false
      (let ((first (car predicates))
	    (rest (cdr predicates)))
	(if (or-last-predicate? predicates)
	    (if (true? (eval first env))
		(eval first env)
		false)
	    (if (true? (eval first env))
		(eval first env)
		(eval-or-predicates rest env))))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Another definition of eval using
;;   derived 'and' and 'or' expression
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp))
	((assignment? exp) (eval-assignment exp env))
	((definition? exp) (eval-definition exp env))
	((if? exp) (eval-if exp env))
	((and? exp) (eval (and->if exp) env))
	((or? exp) (eval (or->if exp) env))
	((lambda? exp)
	 (make-procedure (lambda-paramenters exp)
			 (lambda-body exp)
			 env))
	((begin? exp)
	 (eval-sequence (begin-actions exp) env))
	((cond? exp) (eval (cond->if exp) env))
	((application? exp)
	 (apply (eval (operator exp) env)
		(list-of-values (operands) env)))
	(else
	 (error "Unknown expression type -- EVAL" exp))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Derived 'and' expression
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (and? exp) (tagged-list? exp 'and))

(define (and-predicates exp) (cdr exp))

(define (and-last-predicate? predicates)
  (null? (cdr predicates)))

(define (and->if exp)
  (expand-and-predicates (and-predicates exp)))

(define (expand-and-predicates predicates)
  (if (null? predicates)
      (make-if 'true 'true 'false)
      (let ((first (car predicates))
	    (rest (cdr predicates)))
	(if (and-last-predicate? predicates)
	    (make-if first first 'false)
	    (make-if first
		     (expand-and-predicates rest)
		     'false)))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Derived 'or' expression
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (or? exp) (tagged-list? exp 'or))

(define (or-predicates exp) (cdr exp))

(define (or-last-predicate? predicates)
  (null? (cdr predicates)))

(define (or->if exp)
  (expand-or-predicates (or-predicates exp)))

(define (expand-or-predicates predicates)
  (if (null? predicates)
      (make-if 'false 'false 'true)
      (let ((first (car predicates))
	    (rest (cdr predicates)))
	(if (or-last-predicate? predicates)
	    (make-if first first 'false)
	    (make-if first
		     first
		     (expand-or-predicates rest))))))

