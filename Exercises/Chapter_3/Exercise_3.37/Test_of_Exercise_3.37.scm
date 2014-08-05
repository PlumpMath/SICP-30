;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_3.37.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 28th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Implementing the constraint system
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (adder a1 a2 sum)
  (define (process-new-value)
    (cond ((and (has-value? a1) (has-value? a2))
	   (set-value! sum
		       (+ (get-value a1) (get-value a2))
		       me))
	  ((and (has-value? a1) (has-value? sum))
	   (set-value! a2
		       (- (get-value sum) (get-value a1))
		       me))
	  ((and (has-value? a2) (has-value? sum))
	   (set-value! a1
		       (- (get-value sum) (get-value a1))
		       me))))
  (define (process-forget-value)
    (forget-value! sum me)
    (forget-value! a1 me)
    (forget-value! a2 me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
	   (process-new-value))
	  ((eq? request 'I-lost-my-value)
	   (process-forget-value))
	  (else
	   (error "Unknown request -- ADDER" request))))
  (connect a1 me)
  (connect a2 me)
  (connect sum me)
  me)
;Value: adder

(define (inform-about-value constraint)
  (constraint 'I-have-a-value))
;Value: inform-about-value

(define (inform-about-no-value constraint)
  (constraint 'I-lost-my-value))
;Value: inform-about-no-value

(define (multiplier m1 m2 product)
  (define (process-new-value)
    (cond ((or (and (has-value? m1) (= (get-value m1) 0))
	       (and (has-value? m2) (= (get-value m2) 0)))
	   (set-value! product 0 me))
	  ((and (has-value? m1) (has-value? m2))
	   (set-value! product
		       (* (get-value m1) (get-value m2))
		       me))
	  ((and (has-value? product) (has-value? m1))
	   (set-value! m2
		       (/ (get-value product) (get-value m1))
		       me))
	  ((and (has-value? product) (has-value? m2))
	   (set-value! m1
		       (/ (get-value product) (get-value m2))
		       me))))
  (define (process-forget-value)
    (forget-value! product me)
    (forget-value! m1 me)
    (forget-value! m2 me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
	   (process-new-value))
	  ((eq? request 'I-lost-my-value)
	   (process-forget-value))
	  (else
	   (error "Unknown request -- MULTIPLIER" request))))
  (connect m1 me)
  (connect m2 me)
  (connect product me)
  me)
;Value: multiplier

(define (constant value connector)
  (define (me request)
    (error "Unknown request -- CONSTANT" request))
  (connect connector me)
  (set-value! connector value me)
  me)
;Value: constant

(define (probe name connector)
  (define (print-probe value)
    (newline)
    (display "Probe: ")
    (display name)
    (display " = ")
    (display value))
  (define (process-new-value)
    (print-probe (get-value connector)))
  (define (process-forget-value)
    (print-probe "?"))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
	   (process-new-value))
	  ((eq? request 'I-lost-my-value)
	   (process-forget-value))
	  (else
	   (error "Unknown request -- PROBE" request))))
  (connect connector me)
  me)
;Value: probe



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Representing connectors
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-connector)
  (let ((value false)
	(informant false)
	(constraints '()))
    (define (set-my-value newval setter)
      (cond ((not (has-value? me))
	     (set! value newval)
	     (set! informant setter)
	     (for-each-except setter
			      inform-about-value
			      constraints))
	    ((not (= value newval))
	     (error "Contradiction" (list value newval)))
	    (else 'ignored)))
    (define (forget-my-value retractor)
      (if (eq? retractor informant)
	  (begin (set! informant false)
		 (for-each-except retractor
				  inform-about-no-value
				  constraints))
	  'ignored))
    (define (connect new-constraint)
      (if (not (memq new-constraint constraints))
	  (set! constraints
		(cons new-constraint constraints)))
      (if (has-value? me)
	  (inform-about-value new-constraint))
      'done)
    (define (me request)
      (cond ((eq? request 'has-value?)
	     (if informant true false))
	    ((eq? request 'value) value)
	    ((eq? request 'set-value!) set-my-value)
	    ((eq? request 'forget) forget-my-value)
	    ((eq? request 'connect) connect)
	    (else
	     (error "Unknown operation -- CONNECTOR" request))))
    me))
;Value: make-connector

(define (for-each-except exception procedure list)
  (define (loop items)
    (cond ((null? items) 'done)
	  ((eq? (car items) exception) (loop (cdr items)))
	  (else
	   (procedure (car items))
	   (loop (cdr items)))))
  (loop list))
;Value: for-each-except

(define (has-value? connector)
  (connector 'has-value?))
;Value: has-value?

(define (get-value connector)
  (connector 'value))
;Value: get-value

(define (set-value! connector new-value informant)
  ((connector 'set-value!) new-value informant))
;Value: set-value!

(define (forget-value! connector retractor)
  ((connector 'forget) retractor))
;Value: forget-value!

(define (connect connector new-constraint)
  ((connector 'connect) new-constraint))
;Value: connect


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Testing the Celsius Fahrenheit System
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: c+

;Value: c-

;Value: c*

;Value: c/

;Value: cv

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
	  x)
      (cv 32)))
;Value: celsius-fahrenheit-converter

(define C (make-connector))
;Value: c

(define F (celsius-fahrenheit-converter C))
;Value: f

(probe "Celsius temp" C)
;Value 23: #[compound-procedure 23 me]

(probe "Fahrenheit temp" F)
;Value 24: #[compound-procedure 24 me]

(set-value! C 25 'user)

Probe: Celsius temp = 25
Probe: Fahrenheit temp = 77
;Value: done

(set-value! F 212 'user)
;Contradiction (77 212)
;To continue, call RESTART with an option number:
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(forget-value! C 'user)

Probe: Celsius temp = ?
Probe: Fahrenheit temp = ?
;Value: done

(set-value! F 212 'user)

Probe: Fahrenheit temp = 212
Probe: Celsius temp = 835/9
;Value: done

