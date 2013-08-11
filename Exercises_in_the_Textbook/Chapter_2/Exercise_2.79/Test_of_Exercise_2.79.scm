;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.79.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 10th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))
;Value: attach-tag

(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
	((pair? datum) (car datum))
	(else
	 (error "Bad tagged datum -- TYPE-TAG" datum))))
;Value: type-tag

(define (contents datum)
  (cond ((number? datum) datum)
	((pair? datum) (cdr datum))
	(else
	 (error "Bad tagged datum -- TYPE-TAG" datum))))
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

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (error "No method for these types"
		 (list op type-tags))))))
;Value: apply-generic

;Value: add

;Value: sub

;Value: mul

;Value: div

;Value: equ?

;Value: install-scheme-number-package

(install-scheme-number-package)
;Value: done

;Value: make-scheme-number

;Value: install-rational-number-package

(install-rational-number-package)
;Value: done

;Value: make-rational

;Value: install-complex-package

(install-complex-package)
;Value: done

;Value: make-complex-from-real-imag

;Value: make-complex-from-mag-ang

;Value: install-rectangular-package

(install-rectangular-package)
;Value: done

;Value: install-polar-package

(install-polar-package)
;Value: done

;Value: real-part

;Value: imag-part

;Value: magnitude

;Value: angle

;Value: equ?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     Test of EQU? in SCHEME-NUMBER package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(equ? 0 0)
;Value: #t

(equ? (add 1 1) 2)
;Value: #t

(equ? (add 1 1) 3)
;Value: #f

(equ? (sub 10 4) 6)
;Value: #t

(equ? (sub 10 4) 4)
;Value: #f

(equ? (mul -6 8) -48)
;Value: #t

(equ? (mul -6 8) 48)
;Value: #f

(equ? (div 36 -9) -4)
;Value: #t

(equ? (div 36 -9) 4)
;Value: #f



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Test of EQU? in RATIONAL package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(equ? (make-rational 0 2) (make-rational 0 3))
;Value: #t

(equ? (make-rational 1 2) (make-rational -1 3))
;Value: #f

(define a (make-rational 1 2))
;Value: a

(define b (make-rational -1 3))
;Value: b

(equ? (make-rational 1 6) (add a b))
;Value: #t

(equ? (make-rational -1 6) (add a b))
;Value: #f

(equ? (make-rational 5 6) (sub a b))
;Value: #t

(equ? (make-rational -5 6) (sub a b))
;Value: #f

(equ? (make-rational -1 6) (mul a b))
;Value: #t

(equ? (make-rational 2 3) (mul a b))
;Value: #f

(equ? (make-rational -3 2) (div a b))
;Value: #t

(equ? (make-rational 1 6) (div a b))
;Value: #f



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;      Test of EQU? in COMPLEX package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define z0 (make-complex-from-real-imag 0 0))
;Value: z0

(define z1 (make-complex-from-real-imag 1 2))
;Value: z1

(define z2 (make-complex-from-real-imag -3 4))
;Value: z2

(equ? z0 z2)
;Value: #f

(equ? z1 (make-complex-from-real-imag 1 2))
;Value: #t

(equ? (make-complex-from-real-imag -2 6) (add z1 z2))
;Value: #t

(equ? (make-complex-from-real-imag -4 6) (add z1 z2))
;Value: #f

(equ? (make-complex-from-real-imag 4 -2) (sub z1 z2))
;Value: #t

(equ? (make-complex-from-real-imag -4 -2) (sub z1 z2))
;Value: #f

(define z6 (make-complex-from-mag-ang 5 0.78))
;Value: z6

(define z7 (make-complex-from-mag-ang 10 -0.63))
;Value: z7

(define z8 (make-complex-from-mag-ang 15 0.36))
;Value: z8

(equ? (make-complex-from-mag-ang 50 .15000000000000002) (mul z6 z7))
;Value: #t

(equ? (make-complex-from-mag-ang 15 0.15) (mul z1 z2))
;Value: #f

(equ? (make-complex-from-mag-ang 3 -.42000000000000004) (div z8 z6))
;Value: #t

(equ? (make-complex-from-mag-ang 3 -.32000000000000004) (div z8 z6))
;Value: #f


