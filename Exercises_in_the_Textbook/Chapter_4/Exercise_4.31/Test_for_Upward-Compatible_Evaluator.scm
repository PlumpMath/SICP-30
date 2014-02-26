;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Upward-Compatible_Evaluator.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 26th, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define apply-in-underlying-scheme apply)
;Value: apply-in-underlying-scheme

;Value: actual-value

;Value: eval

;Value: apply

;Value: list-of-arg-values

;Value: list-of-accord-args

;Value: accord-eval

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

;Value: lazy?

;Value: lazy-memo?

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

;Value: memo-delay-it

;Value: memo-thunk?

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


;;; UC-Eval input:
(define (try a b)
  (if (= a 0) 1 b))

;;; UC-Eval value:
ok

;;; UC-Eval input:
(try 0 (/ 1 0))
;Division by zero signalled by /.
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(driver-loop)


;;; UC-Eval input:
(define (try a (b lazy))
  (if (= a 0) 1 b))

;;; UC-Eval value:
ok

;;; UC-Eval input:
(try 0 (/ 1 0))

;;; UC-Eval value:
1

;;; UC-Eval input:
(define (try a (b lazy-memo))
  (if (= a 0) 1 b))

;;; UC-Eval value:
ok

;;; UC-Eval input:
(try 0 (/ 1 0))

;;; UC-Eval value:
1

;;; UC-Eval input:
;Quit!

