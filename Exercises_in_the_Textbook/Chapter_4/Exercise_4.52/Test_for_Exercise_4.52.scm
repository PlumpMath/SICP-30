;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_4.52.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Mar 18th, 2014
;;                       Xi'an, China

;; Copyright (C) 2014 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define apply-in-underlying-scheme apply)
;Value: apply-in-underlying-scheme



;; Structure of the evaluator

(define (amb? exp) (tagged-list? exp 'amb))
;Value: amb?

(define (amb-choices exp) (cdr exp))
;Value: amb-choices

(define (analyze exp)
  (cond ((self-evaluating? exp)
	 (analyze-self-evaluating exp))
	((quoted? exp) (analyze-quoted exp))
	((variable? exp) (analyze-variable exp))
	((assignment? exp) (analyze-assignment exp))
	((permanent-assignment? exp) (analyze-permanent-assignment exp))
	((definition? exp) (analyze-definition exp))
	((if? exp) (analyze-if exp))
	((if-fail? exp) (analyze-if-fail exp))
	((lambda? exp) (analyze-lambda exp))
	((begin? exp) (analyze-sequence (begin-actions exp)))
	((cond? exp) (analyze (cond->if exp)))
	((let? exp) (analyze (let->combination exp)))
	((amb? exp) (analyze-amb exp))
	((application? exp) (analyze-application exp))
	(else
	 (error "Unknown expression type -- ANALYZE" exp))))
;Value: analyze

(define (ambeval exp env succeed fail)
  ((analyze exp) env succeed fail))
;Value: ambeval


;; Simple expressions

(define (analyze-self-evaluating exp)
  (lambda (env succeed fail)
    (succeed exp fail)))
;Value: analyze-self-evaluating

(define (analyze-quoted exp)
  (let ((qval (text-of-quotation exp)))
    (lambda (env succeed fail)
      (succeed qval fail))))
;Value: analyze-quoted

(define (analyze-variable exp)
  (lambda (env succeed fail)
    (succeed (lookup-variable-value exp env)
	     fail)))
;Value: analyze-variable

(define (analyze-lambda exp)
  (let ((vars (lambda-parameters exp))
	(bproc (analyze-sequence (lambda-body exp))))
    (lambda (env succeed fail)
      (succeed (make-procedure vars bproc env)
	       fail))))
;Value: analyze-lambda


;; Conditional and sequences

(define (analyze-if exp)
  (let ((pproc (analyze (if-predicate exp)))
	(cproc (analyze (if-consequent exp)))
	(aproc (analyze (if-alternative exp))))
    (lambda (env succeed fail)
      (pproc env
	     ;; success continuation for evaluating the predicate
	     ;; to obtain pred-value
	     (lambda (pred-value fail2)
	       (if (true? pred-value)
		   (cproc env succeed fail2)
		   (aproc env succeed fail2)))
	     ;; failure continuation for evaluating the predicate
	     fail))))
;Value: analyze-if

(define (analyze-if-fail exp)
  (let ((cproc (analyze (if-fail-consequent exp)))
	(aproc (analyze (if-fail-alternative exp))))
    (lambda (env succeed fail)
      (cproc env
	     succeed
	     (lambda ()
	       (aproc env succeed fail))))))
;Value: analyze-if-fail

(define (analyze-sequence exps)
  (define (sequentially a b)
    (lambda (env succeed fail)
      (a env
	 ;; succees continuation for calling a
	 (lambda (a-value fail2)
	   (b env succeed fail2))
	 ;; failure continuation for calling a
	 fail)))
  (define (loop first-proc rest-procs)
    (if (null? rest-procs)
	first-proc
	(loop (sequentially first-proc (car rest-procs))
	      (cdr rest-procs))))
  (let ((procs (map analyze exps)))
    (if (null? procs)
	(error "Empty sequence -- ANALYZE"))
    (loop (car procs) (cdr procs))))
;Value: analyze-sequence


;; Definitions and assignments

(define (analyze-definition exp)
  (let ((var (definition-variable exp))
	(vproc (analyze (definition-value exp))))
    (lambda (env succeed fail)
      (vproc env
	     (lambda (val fail2)
	       (define-variable! var val env)
	       (succeed 'ok fail2))
	     fail))))
;Value: analyze-definition

(define (analyze-assignment exp)
  (let ((var (assignment-variable exp))
	(vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
	     (lambda (val fail2)        ; *1*
	       (let ((old-value
		      (lookup-variable-value var env)))
		 (set-variable-value! var val env)
		 (succeed 'ok
			  (lambda ()    ; *2*
			    (set-variable-value! var
						 old-value
						 env)
			    (fail2)))))
	     fail))))
;Value: analyze-assignment

(define (analyze-permanent-assignment exp)
  (let ((var (assignment-variable exp))
	(vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
	     (lambda (val fail2)
	       (set-variable-value! var val env)
	       (succeed 'ok fail2))
	     fail))))
;Value: analyze-permanent-assignment


;; Procedure applications

(define (analyze-application exp)
  (let ((fproc (analyze (operator exp)))
	(aprocs (map analyze (operands exp))))
    (lambda (env succeed fail)
      (fproc env
	     (lambda (proc fail2)
	       (get-args aprocs
			 env
			 (lambda (args fail3)
			   (execute-application
			    proc args succeed fail3))
			 fail2))
	     fail))))
;Value: analyze-application

(define (get-args aprocs env succeed fail)
  (if (null? aprocs)
      (succeed '() fail)
      ((car aprocs) env
                    ;; success continuation for this aproc
                    (lambda (arg fail2)
		      (get-args (cdr aprocs)
				env
				;; success continuation for recursive
				;; call to get-args
				(lambda (args fail3)
				  (succeed (cons arg args)
					   fail3))
				fail2))
                    fail)))
;Value: get-args

(define (execute-application proc args succeed fail)
  (cond ((primitive-procedure? proc)
	 (succeed (apply-primitive-procedure proc args)
		  fail))
	((compound-procedure? proc)
	 ((procedure-body proc)
	  (extend-environment (procedure-parameters proc)
			      args
			      (procedure-environment proc))
	  succeed
	  fail))
	(else
	 (error
	  "Unknown procedure type -- EXECUTE-APPLICATION"
	  proc))))
;Value: execute-application

;; Evaluating amb expressions

(define (analyze-amb exp)
  (let ((cproc (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
	(if (null? choices)
	  (fail)
	  ((car choices) env
	                 succeed
			 (lambda ()
			   (try-next (cdr choices))))))
      (try-next cproc))))
;Value: analyze-amb



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   4.1.2 Representing Expression
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Self-evaluating items

(define (self-evaluating? exp)
  (cond ((number? exp) true)
	((string? exp) true)
	(else false)))
;Value: self-evaluating?

;; Variables

(define (variable? exp) (symbol? exp))
;Value: variable?

;; Quotations

(define (quoted? exp)
  (tagged-list? exp 'quote))
;Value: quoted?

(define (text-of-quotation exp) (cadr exp))
;Value: text-of-quotation

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))
;Value: tagged-list?

;; Assignments

(define (assignment? exp)
  (tagged-list? exp 'set!))
;Value: assignment?

(define (permanent-assignment? exp)
  (tagged-list? exp 'permanent-set!))
;Value: permanent-assignment?

(define (assignment-variable exp) (cadr exp))
;Value: assignment-variable

(define (assignment-value exp) (caddr exp))
;Value: assignment-value

;; Definitions

(define (definition? exp)
  (tagged-list? exp 'define))
;Value: definition?

(define (definition-variable exp)
  (if (symbol? (cadr exp))
      (cadr exp)
      (caadr exp)))
;Value: definition-variable

(define (definition-value exp)
  (if (symbol? (cadr exp))
      (caddr exp)
      (make-lambda (cdadr exp)    ; formal parameters
		   (cddr exp))))  ; body
;Value: definition-value

;; Lambda expressions

(define (lambda? exp)
  (tagged-list? exp 'lambda))
;Value: lambda?

(define (lambda-parameters exp) (cadr exp))
;Value: lambda-parameters

(define (lambda-body exp) (cddr exp))
;Value: lambda-body

(define (make-lambda parameters body)
  (cons 'lambda (cons parameters body)))
;Value: make-lambda

;; Conditionals

(define (if? exp) (tagged-list? exp 'if))
;Value: if?

(define (if-predicate exp) (cadr exp))
;Value: if-predicate

(define (if-consequent exp) (caddr exp))
;Value: if-consequent

(define (if-alternative exp)
  (if (not (null? (cdddr exp)))
      (cadddr exp)
      'false))
;Value: if-alternative

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))
;Value: make-if

(define (if-fail? exp) (tagged-list? exp 'if-fail))
;Value: if-fail?

(define (if-fail-consequent exp) (cadr exp))
;Value: if-fail-consequent

(define (if-fail-alternative exp) (caddr exp))
;Value: if-fail-alternative


;; Begin

(define (begin? exp) (tagged-list? exp 'begin))
;Value: begin?

(define (begin-actions exp) (cdr exp))
;Value: begin-actions

(define (last-exp? seq) (null? (cdr seq)))
;Value: last-exp?

(define (first-exp seq) (car seq))
;Value: first-exp

(define (rest-exps seq) (cdr seq))
;Value: rest-exps

(define (sequence->exp seq)
  (cond ((null? seq) seq)
	((last-exp? seq) (first-exp seq))
	(else (make-begin seq))))
;Value: sequence->exp

(define (make-begin seq) (cons 'begin seq))
;Value: make-begin

;; Procedure Applications

(define (application? exp) (pair? exp))
;Value: application?

(define (operator exp) (car exp))
;Value: operator

(define (operands exp) (cdr exp))
;Value: operands

(define (no-operands? ops) (null? ops))
;Value: no-operands?

(define (first-operand ops) (car ops))
;Value: first-operand

(define (rest-operands ops) (cdr ops))
;Value: rest-operands

;; Derived expressions

(define (cond? exp) (tagged-list? exp 'cond))
;Value: cond?

(define (cond-clauses exp) (cdr exp))
;Value: cond-clauses

(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
;Value: cond-else-clause?

(define (cond-predicate clause) (car clause))
;Value: cond-predicate

(define (cond-actions clause) (cdr clause))
;Value: cond-actions

(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))
;Value: cond->if

(define (expand-clauses clauses)
  (if (null? clauses)
      'false
      (let ((first (car clauses))
	    (rest (cdr clauses)))
	(if (cond-else-clause? first)
	    (if (null? rest)
		(sequence->exp (cond-actions first))
		(error "ELSE clause isn't last -- COND->IF"
		       clauses))
	    (make-if (cond-predicate first)
		     (sequence->exp (cond-actions first))
		     (expand-clauses rest))))))
;Value: expand-clauses

(define (let? exp) (tagged-list? exp 'let))
;Value: let?

(define (let-bindings exp) (cadr exp))
;Value: let-bindings

(define (let-body exp) (cddr exp))
;Value: let-body

(define (let-var binding) (car binding))
;Value: let-var

(define (let-val binding) (cadr binding))
;Value: let-val

(define (make-combination operator operands)
  (cons operator operands))
;Value: make-combination

(define (let->combination exp)
  (let ((bindings (let-bindings exp)))
    (make-combination (make-lambda (map let-var bindings)
				   (let-body exp))
		      (map let-val bindings))))
;Value: let->combination



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   4.1.3 Evaluator Data Structures
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Testing of predicates

(define (true? x)
  (not (eq? x false)))
;Value: true?

(define (false? x)
  (eq? x false))
;Value: false?

;; Representing procedures

(define (make-procedure parameters body env)
  (list 'procedure parameters body env))
;Value: make-procedure

(define (compound-procedure? p)
  (tagged-list? p 'procedure))
;Value: compound-procedure?

(define (procedure-parameters p) (cadr p))
;Value: procedure-parameters

(define (procedure-body p) (caddr p))
;Value: procedure-body

(define (procedure-environment p) (cadddr p))
;Value: procedure-environment

;; Operations on Environments

(define (enclosing-environment env) (cdr env))
;Value: enclosing-environment

(define (first-frame env) (car env))
;Value: first-frame

(define the-empty-environment '())
;Value: the-empty-environment

(define (make-frame variables values)
  (cons variables values))
;Value: make-frame

(define (frame-variables frame) (car frame))
;Value: frame-variables

(define (frame-values frame) (cdr frame))
;Value: frame-values

(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons var (car frame)))
  (set-cdr! frame (cons val (cdr frame))))
;Value: add-binding-to-frame!

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
	  (error "Too many arguments supplied" vars vals)
	  (error "Too few arguments supplied" vars vals))))
;Value: extend-environment

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
	     (env-loop (enclosing-environment env)))
	    ((eq? var (car vars))
	     (car vals))
	    (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
	(error "Unbound variable" var)
	(let ((frame (first-frame env)))
	  (scan (frame-variables frame)
		(frame-values frame)))))
  (env-loop env))
;Value: lookup-variable-value

(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
	     (env-loop (enclosing-environment env)))
	    ((eq? var (car vars))
	     (set-car! vals val))
	    (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
	(error "Unbound variable -- SET!" var)
	(let ((frame (first-frame env)))
	  (scan (frame-variables frame)
		(frame-values frame)))))
  (env-loop env))
;Value: set-variable-value!

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
	     (add-binding-to-frame! var val frame))
	    ((eq? var (car vars))
	     (set-car! vals val))
	    (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
	  (frame-values frame))))
;Value: define-variable!



(define (setup-environment)
  (let ((initial-env
	 (extend-environment (primitive-procedure-names)
			     (primitive-procedure-objects)
			     the-empty-environment)))
    (define-variable! 'true true initial-env)
    (define-variable! 'false false initial-env)
    initial-env))
;Value: setup-environment

(define (primitive-procedure? proc)
  (tagged-list? proc 'primitive))
;Value: primitive-procedure?

(define (primitive-implementation proc) (cadr proc))
;Value: primitive-implementation

(define primitive-procedures
  (list (list 'car car)
        (list 'cdr cdr)
        (list 'cons cons)
        (list 'null? null?)
        (list 'list list)
        (list 'memq memq)
        (list 'member member)
        (list 'not not)
        (list '+ +)
        (list '- -)
        (list '* *)
        (list '= =)
        (list '> >)
        (list '>= >=)
        (list 'abs abs)
        (list 'remainder remainder)
        (list 'integer? integer?)
        (list 'sqrt sqrt)
        (list 'eq? eq?)
	(list 'random random)
	;; < more primitives >
        ))
;Value: primitive-procedures

(define (primitive-procedure-names)
  (map car
       primitive-procedures))
;Value: primitive-procedure-names

(define (primitive-procedure-objects)
  (map (lambda (proc) (list 'primitive (cadr proc)))
       primitive-procedures))
;Value: primitive-procedure-objects

(define (apply-primitive-procedure proc args)
  (apply-in-underlying-scheme
   (primitive-implementation proc) args))
;Value: apply-primitive-procedure

(define input-prompt ";;; Amb-Eval input:")
;Value: input-prompt

(define output-prompt ";;; Amb-Eval value")
;Value: output-prompt

(define (driver-loop)
  (define (internal-loop try-again)
    (prompt-for-input input-prompt)
    (let ((input (read)))
      (if (eq? input 'try-again)
	  (try-again)
	  (begin
	    (newline)
	    (display ";;; Starting a new problem ")
	    (ambeval input
		     the-global-environment
		     ;; ambeval success
		     (lambda (val next-alternative)
		       (announce-output output-prompt)
		       (user-print val)
		       (internal-loop next-alternative))
		     ;; ambeval failure
		     (lambda ()
		       (announce-output
			";;; There are no more values of")
		       (user-print input)
		       (driver-loop)))))))
  (internal-loop
   (lambda ()
     (newline)
     (display ";;; There is no current problem")
     (driver-loop))))
;Value: driver-loop

(define (prompt-for-input string)
  (newline) (newline) (display string) (newline))
;Value: prompt-for-input

(define (announce-output string)
  (newline) (display string) (newline))
;Value: announce-output

(define (user-print object)
  (if (compound-procedure? object)
      (display (list 'compound-procedure
		     (procedure-parameters object)
		     (procedure-body object)
		     '<procedure-env>))
      (display object)))
;Value: user-print

(define the-global-environment (setup-environment))
;Value: the-global-environment

(driver-loop)


;;; Amb-Eval input:
(define (require p)
  (if (not p) (amb)))

;;; Starting a new problem 
;;; Amb-Eval value
ok

;;; Amb-Eval input:
(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

;;; Starting a new problem 
;;; Amb-Eval value
ok

;;; Amb-Eval input:
(define (even? x)
  (= (remainder x 2) 0))

;;; Starting a new problem 
;;; Amb-Eval value
ok

;;; Amb-Eval input:
(if-fail (let ((x (an-element-of '(1 3 5))))
	   (require (even? x))
	   x)
	 'all-odd)

;;; Starting a new problem 
;;; Amb-Eval value
all-odd

;;; Amb-Eval input:
(if-fail (let ((x (an-element-of '(1 3 5 8))))
	   (require (even? x))
	   x)
	 'all-odd)

;;; Starting a new problem 
;;; Amb-Eval value
8

;;; Amb-Eval input:
