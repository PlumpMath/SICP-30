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

(define (named-let? exp)
  (and (let? exp)
       (variable? (cadr exp))))

(define (list-of-bindings exp)
  (if (not (named-let? exp))
      (cadr exp)
      (caddr exp)))

(define (let-body exp)
  (if (not (named-let? exp))
      (cddr exp)
      (cdddr exp)))

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

(define (named-let-variable exp) (cadr exp))

(define (let->combination exp)
  (let ((bindings (list-of-bindings exp))
	(body (let-body exp)))
    (let ((vars (binding-vars bindings))
	  (exps (binding-exps bindings)))
      (let ((lambda-exp (make-lambda vars body)))
	(if (not (named-let? exp))
	    (sequence->exp (cons lambda-exp exps))
	    (let ((procedure-name (named-let-variable exp)))
	      (let ((definition (list 'define
				      procedure-name
				      lambda-exp))
		    (application (cons procedure-name exps)))
		(sequence->exp
		 (cons definition application)))))))))
