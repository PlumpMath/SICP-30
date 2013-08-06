;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.73.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 5th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (attach-tag type-tag contents)
  (cons type-tag contents))
;Value: attach-tag

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))
;Value: type-tag

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum)))
;Value: contents

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (cdr record)
		  false))
	    false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
	(if subtable
	    (let ((record (assoc key-2 (cdr subtable))))
	      (if record
		  (set-cdr! record value)
		  (set-cdr! subtable
			    (cons (cons key-2 value)
				  (cdr subtable)))))
	    (set-cdr! local-table
		      (cons (list key-1
				  (cons key-2 value))
			    (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc!) insert!)
	    (else (error "Unknown operation -- TABLE" m))))
    dispatch))
;Value: make-table

(define operation-table (make-table))
;Value: operation-table

(define get (operation-table 'lookup-proc))
;Value: get

(define put (operation-table 'insert-proc!))
;Value: put

(define (variable? x) (symbol? x))
;Value: variable?

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;Value: same-variable?

(define (=number? exp num)
  (and (number? exp) (= exp num)))
;Value: =number?

;Value: deriv

;Value: operator

;Value: operands

;Value: install-sum-package

(install-sum-package)
;Value: done

;Value: make-sum

;Value: install-product-package

(install-product-package)
;Value: done

;Value: make-product

;Value: install-exponentiation-package

(install-exponentiation-package)
;Value: done

;Value: make-exponentiation

(deriv '(+ x 3) 'x)
;Value: 1

(deriv '(* x y) 'x)
;Value: y

(deriv '(* (* x y) (+ x 3)) 'x)
;Value 36: (+ (* x y) (* y (+ x 3)))

(deriv '(** x 5) 'x)
;Value 37: (* 5 (** x 4))

