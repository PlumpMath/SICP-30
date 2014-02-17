;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Metacirsular_Evaluator_2e.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 17th, 2014
;;                       Fuzhou, China

;; Copyright (C) 1984-2014 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define apply-in-underlying-scheme apply)
;Value: apply-in-underlying-scheme

;Value: eval

;Value: analyze

;Value: analyze-self-evaluating

;Value: analyze-quoted

;Value: analyze-variable

;Value: analyze-assignment

;Value: analyze-definition

;Value: analyze-if

;Value: analyze-lambda

;Value: analyze-sequence

;Value: analyze-application

;Value: execute-application

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


;;; M-Eval input:
486

;;; M-Eval value:
486

;;; M-Eval input:
(+ 137 349)

;;; M-Eval value:
486

;;; M-Eval input:
(+ (* 3 5) (- 10 6))

;;; M-Eval value:
19

;;; M-Eval input:
(define size 2)

;;; M-Eval value:
ok

;;; M-Eval input:
size

;;; M-Eval value:
2

;;; M-Eval input:
(* 5 size)

;;; M-Eval value:
10

;;; M-Eval input:
(define pi 3.14159)

;;; M-Eval value:
ok

;;; M-Eval input:
(define radius 10)

;;; M-Eval value:
ok

;;; M-Eval input:
(* pi (* radius radius))

;;; M-Eval value:
314.159

;;; M-Eval input:
(define circumference (* 2 pi radius))

;;; M-Eval value:
ok

;;; M-Eval input:
circumference

;;; M-Eval value:
62.8318

;;; M-Eval input:
(define one-through-four
  (cons 1
	(cons 2
	      (cons 3
		    (cons 4 '())))))

;;; M-Eval value:
ok

;;; M-Eval input:
one-through-four

;;; M-Eval value:
(1 2 3 4)

;;; M-Eval input:
(define (append x y)
  (if (null? x)
      y
      (cons (car x)
	    (append (cdr x) y))))

;;; M-Eval value:
ok

;;; M-Eval input:
(append '(a b c) '(d e f))

;;; M-Eval value:
(a b c d e f)

;;; M-Eval input:
;Quit!

