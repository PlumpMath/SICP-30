;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Lazy_Evaluator_(Revised_for_Lazy_Quoted_List).scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       March 1st, 2014
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

;Value: list-of-delayed-args

;Value: eval-if

;Value: eval-sequence

;Value: eval-assignment

;Value: eval-definition

;Value: self-evaluating?

;Value: variable?

;Value: quoted?

;Value: tagged-list?

;Value: quoted-value

;Value: quoted-list->cons

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
(car '(a b c))

;;; L-Eval value:
a

;;; L-Eval input:
(car (cdr '(a b c)))

;;; L-Eval value:
b

;;; L-Eval input:
(car (cdr (cdr '(a b c))))

;;; L-Eval value:
c

;;; L-Eval input:
(cdr (cdr (cdr '(a b c))))

;;; L-Eval value:
()

;;; L-Eval input:
;Quit!

