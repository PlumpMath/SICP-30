;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Code_in_2.4.3.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       Aug 4th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

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

;Value: install-rectangular-package

(install-rectangular-package)
;Value: done

;Value: install-polar-package

(install-polar-package)
;Value: done

;Value: apply-generic

;Value: real-part

;Value: imag-part

;Value: magnitude

;Value: angle

;Value: make-from-real-imag

;Value: make-from-mag-ang

;Value: rectangular?

;Value: polar?



(define z0 (make-from-real-imag 0 0))
;Value: z0

(rectangular? z0)
;Value: #t

(polar? z0)
;Value: #f

(real-part z0)
;Value: 0

(imag-part z0)
;Value: 0

(magnitude z0)
;Value: 0

(angle z0)
;Value: 0

(display z0)
(rectangular 0 . 0)
;Unspecified return value


(define z1 (make-from-real-imag 1 1))
;Value: z1

(rectangular? z1)
;Value: #t

(polar? z1)
;Value: #f

(real-part z1)
;Value: 1

(imag-part z1)
;Value: 1

(magnitude z1)
;Value: 1.4142135623730951

(angle z1)
;Value: .7853981633974483

(display z1)
(rectangular 1 . 1)
;Unspecified return value



(define z2 (make-from-real-imag 4 -3))
;Value: z2

(rectangular? z2)
;Value: #t

(polar? z2)
;Value: #f

(real-part z2)
;Value: 4

(imag-part z2)
;Value: -3

(magnitude z2)
;Value: 5

(angle z2)
;Value: -.6435011087932844

(display z2)
(rectangular 4 . -3)
;Unspecified return value



(define z100 (make-from-mag-ang 0 0))
;Value: z100

(rectangular? z100)
;Value: #f

(polar? z100)
;Value: #t

(real-part z100)
;Value: 0

(imag-part z100)
;Value: 0

(magnitude z100)
;Value: 0

(angle z100)
;Value: 0

(display z100)
(polar 0 . 0)
;Unspecified return value



(define z101 (make-from-mag-ang 1.414 0.78))
;Value: z101

(rectangular? z101)
;Value: #f

(polar? z101)
;Value: #t

(real-part z101)
;Value: 1.00523174274936

(imag-part z101)
;Value: .9944370987493799

(magnitude z101)
;Value: 1.414

(angle z101)
;Value: .78

(display z101)
(polar 1.414 . .78)
;Unspecified return value



(define z102 (make-from-mag-ang 5 0.63))
;Value: z102

(rectangular? z102)
;Value: #f

(polar? z102)
;Value: #t

(real-part z102)
;Value: 4.040137541560759

(imag-part z102)
;Value: 2.9457237897113475

(magnitude z102)
;Value: 5

(angle z102)
;Value: .63

(display z102)
(polar 5 . .63)
;Unspecified return value



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Test of MAKE-FROM-REAL-IMAG Implemented in Message-Passing Style
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-from-real-imag

;Value: apply-generic

(define z6 (make-from-real-imag 2 -2))
;Value: z6

(real-part z6)
;Value: 2

(imag-part z6)
;Value: -2

(magnitude z6)
;Value: 2.8284271247461903

(angle z6)
;Value: -.7853981633974483




