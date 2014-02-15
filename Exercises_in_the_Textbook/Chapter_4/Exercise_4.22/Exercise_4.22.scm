;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_4.22.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 15th, 2014
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

;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Extending ANALYZE
;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(define (analyze exp)
  (cond ((self-evaluating? exp)
	 (analyze-self-evaluating exp))
	((quoted? exp) (analyze-quoted exp))
	((variable? exp) (analyze-variable exp))
	((assignment? exp) (analyze-assignment exp))
	((definition? exp) (analyze-definition exp))
	((if? exp) (analyze-if exp))
	((lambda? exp) (analyze-lambda exp))
	((begin? exp) (analyze-sequence (begin-actions exp)))
	((cond? exp) (analyze (cond->if exp)))
	((let? exp) (analyze (let->combination exp)))
	((application? exp) (analyze-application exp))
	(else
	 (error "Unknown expression type -- ANALYZE" exp))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Representing the LET Special Form
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (let? exp) (tagged-list? exp 'let))

(define (list-of-bindings exp) (cadr exp))

(define (let-body exp) (cddr exp))

(define (binding-variables bindings)
  (map car bindings))

(define (binding-expressions bindings)
  (map cadr bindings))

(define (let->combination exp)
  (let ((bindings (list-of-bindings exp))
	(body (let-body exp)))
    (let ((vars (binding-variables bindings))
	  (exps (binding-expressions bindings)))
      (let ((lambda-exp (make-lambda vars body)))
	(cons lambda-exp exps)))))
