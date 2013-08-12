;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.80.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 12th, 2013
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

;Value: =zero?

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

(=zero? 0)
;Value: #t

(=zero? 1)
;Value: #f

(=zero? (make-rational 0 99))
;Value: #t

(=zero? (make-rational 1 100))
;Value: #f

(=zero? (make-complex-from-real-imag 0 0))
;Value: #t

(=zero? (make-complex-from-real-imag 0 3))
;Value: #f

(=zero? (make-complex-from-mag-ang 0 0))
;Value: #t

(=zero? (make-complex-from-mag-ang 0 0.78))
;Value: #f

