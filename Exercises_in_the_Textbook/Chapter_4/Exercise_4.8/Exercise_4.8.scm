;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.8.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Jan 17th, 2013
;;                       Fuzhou, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
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

(define (list-of-let-bindings exp) (cadr exp))

(define (let-body exp) (cddr exp))

(define (binding-vars bindings)
  (if (null? bindings)
      '()
      (cons (caar bindings)
	    (binding-vars (cdr bindings)))))

(define (binding-exps bindings)
  (if (null? bindings)
      '()
      (cons (cadar bindings)
	    (binding-exps (cdr bindings)))))

(define (named-let? exp)
  (and (let? exp)
       (variable? (cadr exp))))

(define (named-let-variable exp) (cadr exp))

(define (list-of-named-let-bindings exp) (caddr exp))

(define (named-let-body exp) (cdddr exp))

(define (let->combination exp)
  (if (named-let? exp)
      (let ((procedure-name (named-let-variable exp))
	    (bindings (list-of-named-let-bindings exp))
	    (body (named-let-body exp)))
	(let ((vars (binding-vars bindings))
	      (exps (binding-exps bindings)))
	  (let ((lambda-exp (make-lambda vars body)))
	    (let ((internal-definition
		   (list 'define procedure-name lambda-exp)))
	      (sequence->exp
	       (list internal-definition
		     (list procedure-name exps)))))))
      (let ((bindings (list-of-let-bindings exp))
	    (body (let-body exp)))
	(let ((vars (binding-vars bindings))
	      (exps (binding-exps bindings)))
	  (let ((lambda-exp (make-lambda vars body)))
	    (cons lambda-exp exps))))))