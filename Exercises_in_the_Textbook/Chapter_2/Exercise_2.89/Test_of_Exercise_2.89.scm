;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_2.89.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 22nd, 2013
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
	 (error "Bad tagged datum -- CONTENTS" datum))))
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
	  (error
	   "No method for these types -- APPLY-GENERIC"
	   (list op type-tags))))))
;Value: apply-generic

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; The Generic Arithmetic Procedures
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (neg x) (apply-generic 'neg x))
;Value: neg

(define (add x y) (apply-generic 'add x y))
;Value: add

(define (sub x y) (apply-generic 'sub x y))
;Value: sub

(define (mul x y) (apply-generic 'mul x y))
;Value: mul

(define (div x y) (apply-generic 'div x y))
;Value: div

(define (=zero? x) (apply-generic '=zero? x))
;Value: =zero?



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     The Scheme Number Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))
  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0)))
  (put 'neg '(scheme-number)
       (lambda (x) (tag (- x))))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  'done)
;Value: install-scheme-number-package

(install-scheme-number-package)
;Value: done

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))
;Value: make-scheme-number



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;     The Rational Number Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-rational-number-package)
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (define (=zero-rat? x)
    (= (numer x) 0))
  (define (neg-rat x)
    (make-rat (neg (numer x))
	      (denom x)))
  (define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
		 (* (numer y) (denom x)))
	      (* (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
		 (* (numer y) (denom x)))
	      (* (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
	      (* (denom x) (denom y))))

  (define (div-rat x y)
    (make-rat (* (numer x) (denom y))
	      (* (denom x) (numer y))))

  ;; interface to the rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put '=zero? '(rational)
       (lambda (x) (=zero-rat? x)))
  (put 'neg '(rational)
       (lambda (x) (tag (neg-rat x))))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))
  
  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  'done)
;Value: install-rational-number-package

(install-rational-number-package)
;Value: done

(define (make-rational n d)
  ((get 'make 'rational) n d))
;Value: make-rational



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;         The COMPLEX Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-complex-package)
  ;; imported procedures from rectangular and polar package
  (define (make-from-real-imag x y)
    ((get 'make-from-real-imag 'rectangular) x y))
  (define (make-from-mag-ang r a)
    ((get 'make-from-mag-ang 'polar) r a))
  (define (=zero-complex? z)
    (apply-generic '=zero? z))
  (define (neg-complex z)
    (apply-generic 'neg z))
    
  ;; internal procedures
  (define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (real-part z2))
			 (+ (imag-part z1) (imag-part z2))))
  (define (sub-complex z1 z2)
    (make-from-real-imag (- (real-part z1) (real-part z2))
			 (- (imag-part z1) (imag-part z2))))
  (define (mul-complex z1 z2)
    (make-from-mag-ang (* (magnitude z1) (magnitude z2))
		       (+ (angle z1) (angle z2))))
  (define (div-complex z1 z2)
    (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
		       (- (angle z1) (angle z2))))
  
  ;; interface to the rest of the system
  (define (tag z) (attach-tag 'complex z))
  (put '=zero? '(complex)
       (lambda (z) (=zero-complex? z)))
  (put 'neg '(complex)
       (lambda (z) (tag (neg-complex z))))
  (put 'add '(complex complex)
       (lambda (z1 z2) (tag (add-complex z1 z2))))
  (put 'sub '(complex complex)
       (lambda (z1 z2) (tag (sub-complex z1 z2))))
  (put 'mul '(complex complex)
       (lambda (z1 z2) (tag (mul-complex z1 z2))))
  (put 'div '(complex complex)
       (lambda (z1 z2) (tag (div-complex z1 z2))))
  (put 'make-from-real-imag 'complex
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'complex
       (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)
;Value: install-complex-package

(install-complex-package)
;Value: done

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))
;Value: make-complex-from-real-imag

(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))
;Value: make-complex-from-mag-ang



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       The Rectangular Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-rectangular-package)
  ;; internal procedures
  (define (real-part z) (car z))
  (define (imag-part z) (cdr z))
  (define (make-from-real-imag x y) (cons x y))
  (define (magnitude z)
    (sqrt (+ (square (real-part z))
	     (square (imag-part z)))))
  (define (angle z)
    (atan (imag-part z) (real-part z)))
  (define (=zero? z)
    (and (= (real-part z) 0)
	 (= (imag-part z) 0)))
  (define (neg-rec z)
    (make-from-real-imag (neg (real-part z))
			 (neg (imag-part z))))
  (define (make-from-mag-ang r a)
    (cons (* r (cos a)) (* r (sin a))))
  
  ;; interface to the rest of the system
  (define (tag x) (attach-tag 'rectangular x))
  (put 'real-part '(rectangular) real-part)
  (put 'imag-part '(rectangular) imag-part)
  (put 'magnitude '(rectangular) magnitude)
  (put 'angle '(rectangular) angle)
  (put '=zero? '(rectangular)
       (lambda (z) (=zero? z)))
  (put 'neg '(rectangular)
       (lambda (z) (tag (neg-rec z))))
  (put 'make-from-real-imag 'rectangular
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'rectangular
       (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)
;Value: install-rectangular-package

(install-rectangular-package)
;Value: done



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;          The Polar Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-polar-package)
  ;; internal procedures
  (define (real-part z)
    (* (magnitude z) (cos (angle z))))
  (define (imag-part z)
    (* (magnitude z) (sin (angle z))))
  (define (make-from-real-imag x y)
    (cons (sqrt (+ (square x) (square y)))
	  (atan y x)))
  (define (magnitude z) (car z))
  (define (angle z) (cdr z))
  (define (=zero? z)
    (and (= (magnitude z) 0)
	 (= (angle z) 0)))
  (define (neg-pol z)
    (make-from-mag-ang (neg (magnitude z))
		       (neg (angle z))))
  (define (make-from-mag-ang r a)
    (cons r a))

  ;; interface to the rest of the system
  (define (tag x) (attach-tag 'polar x))
  (put 'real-part '(polar) real-part)
  (put 'imag-part '(polar) imag-part)
  (put 'magnitude '(polar) magnitude)
  (put 'angle '(polar) angle)
  (put '=zero? '(polar)
       (lambda (z) (=zero? z)))
  (put 'neg '(polar)
       (lambda (z) (tag (neg-pol z))))
  (put 'make-from-real-imag 'polar
       (lambda (x y) (tag (make-from-real-imag x y))))
  (put 'make-from-mag-ang 'polar
       (lambda (r a) (tag (make-from-mag-ang r a))))
  'done)
;Value: install-polar-package

(install-polar-package)
;Value: done

(define (real-part z) (apply-generic 'real-part z))
;Value: real-part

(define (imag-part z) (apply-generic 'imag-part z))
;Value: imag-part

(define (magnitude z) (apply-generic 'magnitude z))
;Value: magnitude

(define (angle z) (apply-generic 'angle z))
;Value: angle



;Value: install-polynomial-package

(install-polynomial-package)
;Value: done

;Value: make-polynomial

(define p0 (make-polynomial 'x '()))
;Value: p0

(define p1 (make-polynomial 'x '(1 2 0 3 -2 -5)))
;Value: p1

(define p2 (make-polynomial 'x '(-4 1 -2 7 9)))
;Value: p2

(define p10 (make-polynomial 'y '()))
;Value: p10

(define p11 (make-polynomial 'y '(1 2 0 3 -2 -5)))
;Value: p11

(add p0 p1)
;Value 14: (polynomial x 1 2 0 3 -2 -5)

(add p1 p2)
;Value 15: (polynomial x 1 -2 1 1 5 4)

(sub p0 p1)
;Value 19: (polynomial x -1 -2 -3 2 5)

(sub p2 p0)
;Value 20: (polynomial x -4 1 -2 7 9)

(mul p0 p1)
;Value 16: (polynomial x)

(mul p1 p2)
;Value 18: (polynomial x 4 -1 2 -7 -9)

(add p0 p10)

;Polys not in the same var --ADD-POLY ((x) (y))
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(add p2 p10)

;Polys not in the same var --ADD-POLY ((x -4 1 -2 7 ...) (y))
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(sub p10 p1)

;Polys not in the same var --ADD-POLY ((y) (x -1 -2 -3 2 ...))
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(sub p2 p11)

;Polys not in the same var --ADD-POLY ((x -4 1 -2 7 ...) (y -1 -2 -3 2 ...))
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(mul p0 p10)

;Polys not in the same var --MUL-POLY ((x) (y))
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

(mul p2 p11)

;Polys not in the same var --MUL-POLY ((x -4 1 -2 7 ...) (y 1 2 0 3 ...))
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 1)

;Abort!

