;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Metacircular_Evaluator.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 17th, 2014
;;                       Fuzhou, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define apply-in-underlying-scheme apply)
;Value: apply-in-underlying-scheme

;Value: eval

;Value: apply

;Value: list-of-values

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

;Value: setup-environment

;Value: primitive-procedure?

;Value: primitive-implementation

;Value: primitive-procedures

;Value: primitive-procedure-names

;Value: primitive-procedure-objects

;Value: apply-primitive-procedure

;Value: input-prompt

;Value: output-prompt

;Value: time-prompt

;Value: driver-loop

;Value: prompt-for-input

;Value: announce-output

;Value: user-print

;Value: the-global-environment

(driver-loop)


;;; M-Eval input:
(define (fib n)
  (cond ((= n 0) 1)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

;;; M-Eval value:
ok
;;; Elapsed time:
0.

;;; M-Eval input:
(fib 10)

;;; M-Eval value:
89
;;; Elapsed time:
.04000000000000001

;;; M-Eval input:
(fib 16)

;;; M-Eval value:
1597
;;; Elapsed time:
.65

;;; M-Eval input:
(fib 20)

;;; M-Eval value:
10946
;;; Elapsed time:
4.23

;;; M-Eval input:
(fib 24)

;;; M-Eval value:
75025
;;; Elapsed time:
28.529999999999998

;;; M-Eval input:
;Quit!

