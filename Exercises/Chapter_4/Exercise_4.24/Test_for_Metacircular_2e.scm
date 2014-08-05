;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Metacircular_Evaluator_2e.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 18th, 2014
;;                       Fuzhou, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

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

;Value: time-prompt

;Value: driver-loop

;Value: prompt-for-input

;Value: announce-output

;Value: user-print

;Value: the-global-environment

(driver-loop)


;;; M_Eval_2e input:
(define (fib n)
  (cond ((= n 0) 1)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

;;; M_Eval_2e value:
ok
;;; Elapsed time:
0.

;;; M_Eval_2e input:
(fib 10)

;;; M_Eval_2e value:
89
;;; Elapsed time:
.01999999999999602

;;; M_Eval_2e input:
(fib 16)

;;; M_Eval_2e value:
1597
;;; Elapsed time:
.37000000000000455

;;; M_Eval_2e input:
(fib 20)

;;; M_Eval_2e value:
10946
;;; Elapsed time:
2.460000000000001

;;; M_Eval_2e input:
(fib 24)

;;; M_Eval_2e value:
75025
;;; Elapsed time:
16.79

;;; M_Eval_2e input:
;Quit!

