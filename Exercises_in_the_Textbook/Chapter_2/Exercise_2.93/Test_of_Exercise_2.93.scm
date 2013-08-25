;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_2.93.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Aug 3rd, 2013
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       The Polynomial Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-polynomial-package)
  ;; internal procedures
  ;; representation of poly
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
  
  (define (variable? x) (symbol? x))
  (define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))

  ;; representation of terms and term lists
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
	term-list
	(cons term term-list)))

  (define (the-empty-termlist) '())
  (define (first-term term-list) (car term-list))
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))

  (define (make-term order coeff) (list order coeff))
  (define (order term) (car term))
  (define (coeff term) (cadr term))

  (define (neg-poly p)
    (make-poly (variable p)
	       (neg-terms (term-list p))))
  (define (neg-terms L)
    (if (empty-termlist? L)
	(the-empty-termlist)
	(let ((t1 (first-term L)))
	  (adjoin-term (make-term (order t1)
				  (neg (coeff t1)))
		       (neg-terms (rest-terms L))))))

  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (add-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in the same var --ADD-POLY"
	       (list p1 p2))))

  (define (add-terms L1 L2)
    (cond ((empty-termlist? L1) L2)
	  ((empty-termlist? L2) L1)
	  (else
	   (let ((t1 (first-term L1))
		 (t2 (first-term L2)))
	     (cond ((> (order t1) (order t2))
		    (adjoin-term t1
				 (add-terms (rest-terms L1) L2)))
		   ((< (order t1) (order t2))
		    (adjoin-term t2
				 (add-terms L1 (rest-terms L2))))
		   (else
		    (adjoin-term (make-term (order t1)
					    (add (coeff t1) (coeff t2)))
				 (add-terms (rest-terms L1)
					    (rest-terms L2)))))))))

  (define (sub-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (sub-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in the same var --SUB-POLY"
	       (list p1 p2))))

  (define (sub-terms L1 L2)
    (add-terms L1 (neg-terms L2)))

  (define (mul-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(make-poly (variable p1)
		   (mul-terms (term-list p1)
			      (term-list p2)))
	(error "Polys not in the same var --MUL-POLY"
	       (list p1 p2))))

  (define (mul-terms L1 L2)
    (if (empty-termlist? L1)
	(the-empty-termlist)
	(add-terms (mul-term-by-all-terms (first-term L1) L2)
		   (mul-terms (rest-terms L1) L2))))
  (define (mul-term-by-all-terms t1 L)
    (if (empty-termlist? L)
	(the-empty-termlist)
	(let ((t2 (first-term L)))
	  (adjoin-term (make-term (+ (order t1) (order t2))
				  (mul (coeff t1) (coeff t2)))
		       (mul-term-by-all-terms t1 (rest-terms L))))))

  (define (div-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
	(let ((dt (div-terms (term-list p1)
			     (term-list p2))))
	  (let ((quotient-terms (car dt))
		(remainder-terms (cadr dt)))
	    (list (make-poly (variable p1) quotient-terms)
		  (make-poly (variable p2) remainder-terms))))
	(error "Polys not in the same var -- DIV-POLY"
	       (list p1 p2))))

  (define (div-terms L1 L2)
    (if (empty-termlist? L1)
	(list (the-empty-termlist) (the-empty-termlist))
	(let ((t1 (first-term L1))
	      (t2 (first-term L2)))
	  (if (> (order t2) (order t1))
	      (list (the-empty-termlist) L1)
	      (let ((new-c (div (coeff t1) (coeff t2)))
		    (new-o (- (order t1) (order t2))))
		(let ((rest-of-result    ;; compute rest of result recursively
		      (div-terms (sub-terms L1
					    (mul-term-by-all-terms (make-term new-o new-c)
								   L2))
				 L2)))
		  (list (adjoin-term (make-term new-o new-c)    ;; form complete result
				     (car rest-of-result))
			(cadr rest-of-result))))))))

  ;; interface to rest of the system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'neg '(polynomial)
       (lambda (p) (tag (neg-poly p))))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'sub '(polynomial polynomial)
       (lambda (p1 p2) (tag (sub-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'div '(polynomial polynomial)
       (lambda (p1 p2) (tag (div-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  'done)
;Value: install-polynomial-package

(install-polynomial-package)
;Value: done

(define (make-polynomial var terms)
  ((get 'make 'polynomial) var terms))
;Value: make-polynomial

;Value: install-rational-package

(install-rational-package)
;Value: done

;Value: make-rational

(define p1 (make-polynomial 'x '((2 1) (0 1))))
;Value: p1

(display p1)
(polynomial x (2 1) (0 1))
;Unspecified return value

(define p2 (make-polynomial 'x '((3 1) (0 1))))
;Value: p2

(display p2)
(polynomial x (3 1) (0 1))
;Unspecified return value

(define rf (make-rational p2 p1))
;Value: rf

(display rf)
(rational (polynomial x (3 1) (0 1)) polynomial x (2 1) (0 1))
;Unspecified return value

(define daul-rf (add rf rf))
;Value: daul-rf

(display daul-rf)
(rational (polynomial x (5 2) (3 2) (2 2) (0 2)) polynomial x (4 1) (2 2) (0 1))
;Unspecified return value

(rational (polynomial x) polynomial x)
;Unspecified return value

