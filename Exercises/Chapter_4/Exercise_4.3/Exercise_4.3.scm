;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.3.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 15th, 2013
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

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
	((quoted? exp) (text-of-quotation exp))
	((get 'eval (exp-type exp))
	 ((get 'eval (exp-type exp)) exp env))
	(else
	 (error "Unknown expression type -- EVAL" exp))))

(define (exp-type exp) (car exp))



(define (install-assignment-package)
  ;; internal procedures
  (define (assignment-variable exp) (cadr exp))
  (define (assignment-value exp) (caddr exp))
  (define (eval-assignment exp env)
    (set-variable-value! (assignment-variable exp)
			 (eval (assignment-value exp) env)
			 env)
    'ok)

  ;; interface to the rest of the system
  (put 'eval 'set! eval-assignment)
  'done)



(define (install-definition-package)
  ;; internal procedures
  (define (definition-variable exp)
    (if (symbol? (cadr exp))
	(cadr exp)
	(caadr exp)))
  (define (definition-value exp)
    (if (symbol? (cadr exp))
	(caddr exp)
	(make-lambda (cdadr exp)    ; formal parameters
		     (cddr exp))))  ; body
  (define (eval-definition exp env)
    (define-variable! (definition-variable exp)
                      (eval (definition-value exp) env)
		      env)
    'ok)

  ;; interface to the rest of the system
  (put 'eval 'define eval-definition)
  'done)



(define (install-if-package)
  ;; internal procedures
  (define (if-predicate exp) (cadr exp))
  (define (if-consequent exp) (caddr exp))
  (define (if-alternative exp)
    (if (not (null? (cdddr exp)))
	(cadddr exp)
	'false))
  (define (eval-if exp env)
    (if (true? (eval (if-predicate exp) env))
	(eval (if-consequent exp) env)
	(eval (if-alternative exp) env)))
  (define (make-if predicate consequent alternative)
    (list 'if predicate consequent alternative))

  ;; interface to the rest of the system
  (put 'eval 'if eval-if)
  (put 'make 'if make-if)
  'done)

(define (make-if predicate consequent alternative)
  ((get 'make 'if) predicate consequent alternative))



(define (install-lambda-package)
  ;; internal procedures
  (define (lambda-parameters exp) (cadr exp))
  (define (lambda-body exp) (cddr exp))
  (define (make-lambda parameters body)
    (cons 'lambda (cons parameters body)))
  (define (eval-lambda exp env)
    (make-procedure (lambda-parameters exp)
		    (lamda-body exp)
		    env))

  ;; interface to the rest of the system
  (put 'eval 'lambda eval-lambda)
  (put 'make 'lambda make-lambda)
  'done)

(define (make-lambda parameters body)
  ((get 'make 'lambda) parameter body))



(define (install-sequence-package)
  ;; internal procedures
  (define (begin-actions exp) (cdr exp))
  (define (last-exp? seq) (null? (cdr seq)))
  (define (first-exp seq) (car seq))
  (define (rest-exps seq) (cdr seq))
  (define (eval-sequence exps env)
    (cond ((last-exp? exps) (eval (first-exp exps) env))
	  (else (eval (first-exp exps) env)
		(eval-sequence (rest-exps exps) env))))
  (define (eval-begin exp env)
    (eval-sequence (begin-actions exp) env))
  (define (sequence->exp seq)
    (cond ((null? seq) seq)
	  ((last-exp? seq) (first-exp seq))
	  (else (make-begin seq))))
  (define (make-begin seq) (cons 'begin seq))

  ;; interface to the rest of the system
  (put 'eval 'begin eval-begin)
  (put 'transform 'seq->exp sequence->exp)
  (put 'make 'begin make-begin)
  'done)

(define (sequence->exp seq)
  ((get 'transform 'seq->exp) seq))

(define (make-begin seq)
  ((get 'make 'begin) seq))



(define (install-conditional-package)
  ;; internal procedures
  (define (cond-clauses exp)
    (cdr exp))
  (define (cond-else-clause? clause)
    (eq? (cond-predicate clause) 'else))
  (define (cond-predicate clause) (car clause))
  (define (cond-actions clause) (cdr clause))
  (define (cond->if exp)
    (expand-clauses (cond-clauses exp)))
  (define (expand-clauses clauses)
    (if (null? clauses)
	'false                          ; no else clause
	(let ((first (car clauses))
	      (rest (cdr clauses)))
	  (if (cond-else-clause? first)
	      (if (null? rest)
		  (sequence->exp (cond-actions first))
		  (error "ELSE clauses isn't last -- COND->IF"
			 clauses))
	      (make-if (cond-predicate first)
		       (sequence->exp (cond-actions first))
		       (expand-clauses rest))))))
  (define (eval-cond exp env)
    (eval (cond->if exp) env))

  ;; interface to the rest of the system
  (put 'eval 'cond eval-cond)
  'done)



(define (install-application-package)
  ;; internal procedures
  (define (operator exp) (car exp))
  (define (operands exp) (cdr exp))
  (define (no-operands? ops) (null? ops))
  (define (first-operand ops) (car ops))
  (define (rest-operands ops) (cdr ops))
  (define (list-of-values ops env)
    (if (no-operands? ops)
	'()
	(cons (eval (first-operand ops) env)
	      (list-of-values (rest-operands ops) env))))
  (define (apply-proc exp env)
    (apply (eval (operator exp) env)
	   (list-of-values (operands exp) env)))

  ;; interface to the rest of the system
  (put 'eval 'application apply-proc)
  'done)

