;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Lazy_Evaluator_(Variant).scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 23rd, 2014
;;                       Fuzhou, China

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
(define (average a b) (/ (+ a b) 2))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (average-damp f)
  (lambda (x) (average x (f x))))

;;; L-Eval value:
ok

;;; L-Eval input:
(define (square x) (* x x))

;;; L-Eval value:
ok

;;; L-Eval input:
((average-damp square) 10)
;Unknown procedure type -- APPLY (thunk square (...))
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(debug)

There are 15 subproblems on the stack.

Subproblem level: 0 (this is the lowest subproblem level)
Expression (from stack):
    (force-it ###)
 subproblem being executed (marked by ###):
    (eval exp env)
Environment created by the procedure: ACTUAL-VALUE

 applied to: ((f x) (((x) (thunk 10 (((square average-damp average false true car 
The execution history for this subproblem contains 2 reductions.


Execution history for this subproblem:
----------------------------------------
Subproblem level: 0  Reduction number: 0
Expression (from execution history):
    (force-it (eval exp env))
Environment created by the procedure: ACTUAL-VALUE

 applied to: ((f x) (((x) (thunk 10 (((square average-damp average false true car 
----------------------------------------
Subproblem level: 0  Reduction number: 1
Expression (from execution history):
    (actual-value (thunk-exp obj) (thunk-env obj))
Environment created by the procedure: FORCE-IT

 applied to: ((thunk (f x) (((x) (thunk 10 (((square average-damp average false tr


Subproblem level: 1
Expression (from stack):
    (let ((result ###))
      (set-car! obj 'evaluated-thunk)
      (set-car! (cdr obj) result)
      (set-cdr! (cdr obj) '())
      ...)
 subproblem being executed (marked by ###):
    (actual-value (thunk-exp obj) (thunk-env obj))
Environment created by the procedure: FORCE-IT

 applied to: ((thunk (f x) (((x) (thunk 10 (((square average-damp average false tr
The execution history for this subproblem contains 4 reductions.


Execution history for this subproblem:
----------------------------------------
Subproblem level: 1  Reduction number: 0
Expression (from execution history):
    (let ((result (actual-value (thunk-exp obj) (thunk-env obj))))
      (set-car! obj 'evaluated-thunk)
      (set-car! (cdr obj) result)
      (set-cdr! (cdr obj) '())
      ...)
Environment created by the procedure: FORCE-IT

 applied to: ((thunk (f x) (((x) (thunk 10 (((square average-damp average false tr
----------------------------------------
Subproblem level: 1  Reduction number: 1
Expression (from execution history):
    (cond ((thunk? obj)
           (let ((result ...))
             (set-car! obj 'evaluated-thunk)
             (set-car! (cdr obj) result)
             (set-cdr! (cdr obj) '())
             ...))
          ((evaluated-thunk? obj) (thunk-value obj))
          (else obj))
Environment created by the procedure: FORCE-IT

 applied to: ((thunk (f x) (((x) (thunk 10 (((square average-damp average false tr
----------------------------------------
Subproblem level: 1  Reduction number: 2
Expression (from execution history):
    (force-it (eval exp env))
Environment created by the procedure: ACTUAL-VALUE

 applied to: (b (((a b) (thunk x (((x) (thunk 10 (((square average-damp average fa
----------------------------------------
Subproblem level: 1  Reduction number: 3
Expression (from execution history):
    (actual-value (first-operand exps) env)
Environment created by the procedure: LIST-OF-ARG-VALUES

 applied to: ((b) (((a b) (thunk x (((x) (thunk 10 (((square average-damp average 


Subproblem level: 2
Expression (from stack):
    (cons ### (list-of-arg-values (rest-operands exps) env))
 subproblem being executed (marked by ###):
    (actual-value (first-operand exps) env)
Environment created by the procedure: LIST-OF-ARG-VALUES

 applied to: ((b) (((a b) (thunk x (((x) (thunk 10 (((square average-damp average 
The execution history for this subproblem contains 3 reductions.


Execution history for this subproblem:
----------------------------------------
Subproblem level: 2  Reduction number: 0
Expression (from execution history):
    (cons (actual-value (first-operand exps) env)
          (list-of-arg-values (rest-operands exps) env))
Environment created by the procedure: LIST-OF-ARG-VALUES

 applied to: ((b) (((a b) (thunk x (((x) (thunk 10 (((square average-damp average 
----------------------------------------
Subproblem level: 2  Reduction number: 1
Expression (from execution history):
    (if (no-operands? exps)
        '()
        (cons (actual-value (first-operand exps) env)
              (list-of-arg-values (rest-operands exps) env)))
Environment created by the procedure: LIST-OF-ARG-VALUES

 applied to: ((b) (((a b) (thunk x (((x) (thunk 10 (((square average-damp average 
----------------------------------------
Subproblem level: 2  Reduction number: 2
Expression (from execution history):
    (list-of-arg-values (rest-operands exps) env)
Environment created by the procedure: LIST-OF-ARG-VALUES

 applied to: ((a b) (((a b) (thunk x (((x) (thunk 10 (((square average-damp averag

;Unspecified return value


