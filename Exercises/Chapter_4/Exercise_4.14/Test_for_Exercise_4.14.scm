;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_4.14.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Feb 1st, 2014
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

;Value: driver-loop

;Value: prompt-for-input

;Value: announce-output

;Value: user-print

;Value: the-global-environment

(driver-loop)


;;; M-Eval input:
(define (abs x)
  (cond ((< x 0) (- x))
	((= x 0) 0)
	(else x)))

;;; M-Eval value:
ok

;;; M-Eval input:
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

;;; M-Eval value:
ok

;;; M-Eval input:
(map abs '(-10 2.5 -11.6 17))

;;; M-Eval value:
(10 2.5 11.6 17)

;;; M-Eval input:
(map (lambda (x) (* x x))
     '(1 2 3 4))

;;; M-Eval value:
(1 4 9 16)

;;; M-Eval input:
;Quit!



;Value: setup-environment

;Value: primitive-procedure?

;Value: primitive-implementation

;Value: primitive-procedures

;Value: primitive-procedure-names

;Value: primitive-procedure-objects

;Value: apply-primitive-procedure

;Value: driver-loop

;Value: user-print

;Value: the-global-environment

(driver-loop)


;;; M-Eval input:
(define (abs x)
  (cond ((< x 0) (- x))
	((= x 0) 0)
	(else x)))

;;; M-Eval value:
ok

;;; M-Eval input:
(map abs '(-10 2.5 -11.6 17))
;The object (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure ... ... ...) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify a procedure to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(driver-loop)


;;; M-Eval input:
(map (lambda (x) (* x x))
     '(1 2 3 4))
;The object (procedure (x) ((* x x)) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure (x) ((if (> x 0) x (- x))) (((abs false true car cdr cons null? eq? number? symbol? string? + - * / = > < map) (procedure ... ... ...) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) #f #t (primitive #[compiled-procedure 13 ("list" #x1) #x1a #x1035b7052]) (primitive #[compiled-procedure 14 ("list" #x2) #x1a #x1035b70c2]) (primitive #[compiled-procedure 15 ("list" #x3) #x14 #x1035b712c]) (primitive #[compiled-procedure 16 ("list" #x5) #x14 #x1035b71cc]) (primitive #[compiled-procedure 17 ("global" #x14) #x14 #x1035588e4]) (primitive #[compiled-procedure 18 ("arith" #x9a) #x14 #x103401b2c]) (primitive #[compiled-procedure 19 ("symbol" #x1) #x14 #x1035b5434]) (primitive #[compiled-procedure 20 ("string" #x7) #x14 #x1035700e4]) (primitive #[arity-dispatched-procedure 21]) (primitive #[arity-dispatched-procedure 22]) (primitive #[arity-dispatched-procedure 23]) (primitive #[arity-dispatched-procedure 24]) (primitive #[arity-dispatched-procedure 25]) (primitive #[arity-dispatched-procedure 26]) (primitive #[arity-dispatched-procedure 27]) (primitive #[compiled-procedure 28 ("list" #x6f) #x1a #x1035c15ba])))) is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify a procedure to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(driver-loop)


;;; M-Eval input:
(define (abs x)
  (cond ((< x 0) (- x))
	((= x 0) 0)
	(else x)))

;;; M-Eval value:
ok

;;; M-Eval input:
abs

;;; M-Eval value:
(compound-procedure (x) ((cond ((< x 0) (- x)) ((= x 0) 0) (else x))) <procedure-env>)

;;; M-Eval input:
;Quit!



(define (abs x)
  (cond ((< x 0) (- x))
	((= x 0) 0)
	(else x)))
;Value: abs

abs
;Value 29: #[compound-procedure 29 abs]
