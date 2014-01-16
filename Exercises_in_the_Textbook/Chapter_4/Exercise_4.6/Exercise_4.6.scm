;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.6.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Jan 16th, 2014
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

(define (let? exp) (tagged-list? exp 'let))

(define (list-of-association exp) (cadr exp))

(define (let-body exp) (cddr exp))

(define (assoc-vars assocs)
  (if (null? assocs)
      '()
      (cons (caar assocs)
	    (assoc-vars (cdr assocs)))))

(define (assoc-exps assocs)
  (if (null? assocs)
      '()
      (cons (cadar assocs)
	    (assoc-exps (cdr assocs)))))

(define (let->combination exp)
  (let ((assocs (list-of-association exp))
	(body (let-body exp)))
    (let ((vars (assoc-vars assocs))
	  (exps (assoc-exps assocs)))
      (let ((lambda-exp (make-lambda vars body)))
	(cons lambda-exp exps)))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Extending EVAL
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp))
	((assignment? exp) (eval-assignment exp env))
	((definition? exp) (eval-definition exp env))
	((if? exp) (eval-if exp env))
	((lambda? exp)
	 (make-procedure (lambda-parameters exp)
			 (lambda-body exp)
			 env))
	((let? exp)
	 (eval (let->combination exp) env))
	((begin? exp)
	 (eval-sequence (begin-actions exp) env))
	((cond? exp) (eval (cond->if exp) env))
	((application? exp)
	 (apply (eval (operator exp) env)
		(list-of-values (operands exp) env)))
	(else
	 (error "Unknown expression type -- EVAL" exp))))