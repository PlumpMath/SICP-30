;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.33.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Oct 26th, 2013
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Testing the averager system
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: averager

(define a (make-connector))
;Value: a

(define b (make-connector))
;Value: b

(define c (make-connector))
;Value: c

(averager a b c)
;Value: ok

(probe "a" a)
;Value 23: #[compound-procedure 23 me]

(probe "b" b)
;Value 24: #[compound-procedure 24 me]

(probe "c" c)
;Value 25: #[compound-procedure 25 me]

(set-value! a 8 'user)

Probe: a = 8
;Value: done

(set-value! b 24 'user)

Probe: b = 24
Probe: c = 16
;Value: done

(set-value! c 50 'user)
;Contradiction (16 50)
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(forget-value! a 'user)

Probe: a = ?
Probe: c = ?
;Value: done

(forget-value! b 'user)

Probe: b = ?
;Value: done

(set-value! c 50 'user)

Probe: c = 50
;Value: done

(set-value! a 32 'user)

Probe: a = 32
Probe: b = 68
;Value: done

