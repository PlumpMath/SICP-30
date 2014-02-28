;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       4.2.3_Streams_as_Lazy_Lists.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 28th, 2014
;;                       Xi'an, China

;; Copyright (C) 1984-2014 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

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

(define apply-in-underlying-scheme apply)
;Value: apply-in-underlying-scheme

;Value: actual-value

;Value: eval

;Value: apply

;Value: list-of-arg-values

;Value: list-of-delayed-args

;Value: eval-if

;Value: eval-sequence

;Value: eval-assignment

;Value: eval-definition

;Value: self-evaluating?

;Value: variable?

;Value: quoted?

;Value: text-of-quotation

;Value: tagged-list?

;Value: assignment?

;Value: assignment-variable

;Value: assignment-value

;Value: definition?

;Value: definition-variable

;Value: definition-value

;Value: lambda?

;Value: lambda-parameters

;Value: lambda-body

;Value: make-lambda

;Value: if?

;Value: if-predicate

;Value: if-consequent

;Value: if-alternative

;Value: make-if

;Value: begin?

;Value: begin-actions

;Value: last-exp?

;Value: first-exp

;Value: rest-exps

;Value: sequence->exp

;Value: make-begin

;Value: application?

;Value: operator

;Value: operands

;Value: no-operands?

;Value: first-operand

;Value: rest-operands

;Value: cond?

;Value: cond-clauses

;Value: cond-else-clause?

;Value: cond-predicate

;Value: cond-actions

;Value: cond->if

;Value: expand-clauses

;Value: true?

;Value: false?

;Value: make-procedure

;Value: compound-procedure?

;Value: procedure-parameters

;Value: procedure-body

;Value: procedure-environment

;Value: enclosing-environment

;Value: first-frame

;Value: the-empty-environment

;Value: make-frame

;Value: frame-variables

;Value: frame-values

;Value: add-binding-to-frame!

;Value: extend-environment

;Value: lookup-variable-value

;Value: set-variable-value!

;Value: define-variable!

;Value: delay-it

;Value: thunk?

;Value: thunk-exp

;Value: thunk-env

;Value: evaluated-thunk?

;Value: thunk-value

;Value: force-it

;Value: setup-environment

;Value: primitive-procedure?

;Value: primitive-implementation

;Value: primitive-procedures

;Value: primitive-procedure-names

;Value: primitive-procedure-objects

;Value: apply-primitive-procedure

;Value: input-prompt

;Value: output-prompt

;Value: driver-loop

;Value: prompt-for-input

;Value: announce-output

;Value: user-print

;Value: the-global-environment

(driver-loop)


;;; L-Eval input:
(define (cons x y)
  (lambda (m) (m x y)))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (car z)
  (z (lambda (p q) p)))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (cdr z)
  (z (lambda (p q) q)))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (add-lists list1 list2)
  (cond ((null? list1) list2)
	((null? list2) list1)
	(else (cons (+ (car list1) (car list2))
		    (add-lists (cdr list1) (cdr list2))))))

;;; L-Eval value:
ok

;;; L-Eval input:
(define ones (cons 1 ones))

;;; L-Eval value:
ok

;;; L-Eval input:
(define integers (cons 1 (add-lists ones integers)))

;;; L-Eval value:
ok

;;; L-Eval input:
(list-ref integers 17)

;;; L-Eval value:
18

;;; L-Eval input:
(define (integral integrand initial-value dt)
  (define int
    (cons initial-value
	  (add-lists (scale-list integrand dt)
		     int)))
  int)

;;; L-Eval value:
ok

;;; L-Eval input:
(define (solve f y0 dt)
  (define y (integral dy y0 dt))
  (define dy (map f y))
  y)

;;; L-Eval value:
ok

;;; L-Eval input:
(list-ref (solve (lambda (x) x) 1 0.001) 1000)

;;; L-Eval value:
2.716923932235896

;;; L-Eval input:
;Quit!

