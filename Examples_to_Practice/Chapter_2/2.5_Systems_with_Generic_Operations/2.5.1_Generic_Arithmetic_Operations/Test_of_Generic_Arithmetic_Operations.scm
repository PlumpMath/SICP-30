;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Generic_Arithmetic_Operation.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       Aug 6th, 2013
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Testing Data from The SCHEME-NUMBER Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define n0 (make-scheme-number 0))
;Value: n0

(type-tag n0)
;Value: scheme-number

(contents n0)
;Value: 0

(define n1 (make-scheme-number 98))
;Value: n1

(type-tag n1)
;Value: scheme-number

(contents n1)
;Value: 98

(define n2 (make-scheme-number 102))
;Value: n2

(type-tag n2)
;Value: scheme-number

(contents n2)
;Value: 102

(define n3 (make-scheme-number -10))
;Value: n3

(type-tag n3)
;Value: scheme-number

(contents n3)
;Value: -10

(define n6 (add n1 n2))
;Value: n6

(type-tag n6)
;Value: scheme-number

(contents n6)
;Value: 200

(define n8 (add n1 n3))
;Value: n8

(type-tag n8)
;Value: scheme-number

(contents n8)
;Value: 88

(define n10 (sub n2 n3))
;Value: n10

(type-tag n10)
;Value: scheme-number

(contents n10)
;Value: 112

(define n12 (sub n3 n1))
;Value: n12

(type-tag n12)
;Value: scheme-number

(contents n12)
;Value: -108

(define n101 (mul n1 n2))
;Value: n101

(type-tag n101)
;Value: scheme-number

(contents n101)
;Value: 9996

(define n102 (mul n1 n3))
;Value: n102

(type-tag n102)
;Value: scheme-number

(contents n102)
;Value: -980

(define n103 (div n2 n3))
;Value: n103

(type-tag n103)
;Value: scheme-number

(contents n103)
;Value: -51/5

(define n104 (div n3 n1))
;Value: n104

(type-tag n104)
;Value: scheme-number

(contents n104)
;Value: -5/49



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Testing Data from The RATIONAL Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define r0 (make-rational 0 7))
;Value: r0

(type-tag r0)
;Value: rational

(contents r0)
;Value 13: (0 . 1)

(define r1 (make-rational 1 2))
;Value: r1

(type-tag r1)
;Value: rational

(contents r1)
;Value 14: (1 . 2)

(define r2 (make-rational -3 4))
;Value: r2

(type-tag r2)
;Value: rational

(contents r2)
;Value 15: (-3 . 4)

(define r3 (make-rational 5 12))
;Value: r3

(type-tag r3)
;Value: rational

(contents r3)
;Value 16: (5 . 12)

(define r101 (add r0 r1))
;Value: r101

(type-tag r101)
;Value: rational

(contents r101)
;Value 17: (1 . 2)

(define r102 (add r1 r2))
;Value: r102

(type-tag r102)
;Value: rational

(contents r102)
;Value 19: (-1 . 4)

(define r103 (add r1 r3))
;Value: r103

(type-tag r103)
;Value: rational

(contents r103)
;Value 20: (11 . 12)

(define r106 (sub r0 r1))
;Value: r106

(type-tag r106)
;Value: rational

(contents r106)
;Value 21: (-1 . 2)

(define r107 (sub r1 r2))
;Value: r107

(type-tag r107)
;Value: rational

(contents r107)
;Value 22: (5 . 4)

(define r108 (sub r1 r3))
;Value: r108

(type-tag r108)
;Value: rational

(contents r108)
;Value 23: (1 . 12)

(define r111 (mul r0 r1))
;Value: r111

(type-tag r111)
;Value: rational

(contents r111)
;Value 24: (0 . 1)

(define r112 (mul r1 r2))
;Value: r112

(type-tag r112)
;Value: rational

(contents r112)
;Value 25: (-3 . 8)

(define r113 (mul r2 r3))
;Value: r113

(type-tag r113)
;Value: rational

(contents r113)
;Value 27: (-5 . 16)

(define r116 (div r0 r1))
;Value: r116

(type-tag r116)
;Value: rational

(contents r116)
;Value 28: (0 . 1)

(define r117 (div r1 r2))
;Value: r117

(type-tag r117)
;Value: rational

(contents r117)
;Value 29: (2 . -3)

(define r118 (div r3 r1))
;Value: r118

(type-tag r118)
;Value: rational

(contents r118)
;Value 30: (5 . 6)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Testing Data from The COMPLEX Package
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define c0 (make-complex-from-real-imag 0 0))
;Value: c0

(type-tag c0)
;Value: complex

(contents c0)
;Value 18: (rectangular 0 . 0)

(define c1 (make-complex-from-real-imag 1 1))
;Value: c1

(type-tag c1)
;Value: complex

(contents c1)
;Value 19: (rectangular 1 . 1)

(define c2 (make-complex-from-real-imag 4 3))
;Value: c2

(type-tag c2)
;Value: complex

(contents c2)
;Value 20: (rectangular 4 . 3)

(define c3 (make-complex-from-real-imag 8 -6))
;Value: c3

(type-tag c3)
;Value: complex

(contents c3)
;Value 21: (rectangular 8 . -6)

(define c100 (add c0 c0))
;Value: c100

(type-tag c100)
;Value: complex

(contents c100)
;Value 22: (rectangular 0 . 0)

(define c101 (add c0 c1))
;Value: c101

(type-tag c101)
;Value: complex

(contents c101)
;Value 23: (rectangular 1 . 1)

(define c102 (add c1 c2))
;Value: c102

(type-tag c102)
;Value: complex

(contents c102)
;Value 24: (rectangular 5 . 4)

(define c103 (add c2 c3))
;Value: c103

(type-tag c103)
;Value: complex

(contents c103)
;Value 25: (rectangular 12 . -3)

(define c106 (sub c0 c3))
;Value: c106

(type-tag c106)
;Value: complex

(contents c106)
;Value 26: (rectangular -8 . 6)

(define c107 (sub c3 c2))
;Value: c107

(type-tag c107)
;Value: complex

(contents c107)
;Value 27: (rectangular 4 . -9)

(define c108 (sub c2 c1))
;Value: c108

(type-tag c108)
;Value: complex

(contents c108)
;Value 28: (rectangular 3 . 2)

(define c111 (mul c0 c3))
;Value: c111

(type-tag c111)
;Value: complex

(contents c111)
;Value 29: (polar 0 . -.6435011087932844)

(define c112 (mul c1 c2))
;Value: c112

(type-tag c112)
;Value: complex

(contents c112)
;Value 30: (polar 7.0710678118654755 . 1.4288992721907325)

(define c113 (mul c2 c3))
;Value: c113

(type-tag c113)
;Value: complex

(contents c113)
;Value 31: (polar 50 . 0.)

(define c116 (div c0 c2))
;Value: c116

(type-tag c116)
;Value: complex

(contents c116)
;Value 32: (polar 0 . -.6435011087932844)

(define c117 (div c1 c2))
;Value: c117

(type-tag c117)
;Value: complex

(contents c117)
;Value 33: (polar .282842712474619 . .1418970546041639)

(define c118 (div c2 c3))
;Value: c118

(type-tag c118)
;Value: complex

(contents c118)
;Value 34: (polar 1/2 . 1.2870022175865687)



(define c10 (make-complex-from-mag-ang 0 0))
;Value: c10

(type-tag c10)
;Value: complex

(contents c10)
;Value 35: (polar 0 . 0)

(define c11 (make-complex-from-mag-ang 1.414 0.78))
;Value: c11

(type-tag c11)
;Value: complex

(contents c11)
;Value 36: (polar 1.414 . .78)

(define c12 (make-complex-from-mag-ang 5 0.63))
;Value: c12

(type-tag c12)
;Value: complex

(contents c12)
;Value 37: (polar 5 . .63)

(define c13 (make-complex-from-mag-ang 10 -0.63))
;Value: c13

(type-tag c13)
;Value: complex

(contents c13)
;Value 38: (polar 10 . -.63)

(define c200 (add c10 c11))
;Value: c200

(type-tag c200)
;Value: complex

(contents c200)
;Value 39: (rectangular 1.00523174274936 . .9944370987493799)

(define c201 (add c11 c12))
;Value: c201

(type-tag c201)
;Value: complex

(contents c201)
;Value 40: (rectangular 5.045369284310119 . 3.9401608884607273)

(define c202 (add c12 c13))
;Value: c202

(type-tag c202)
;Value: complex

(contents c202)
;Value 41: (rectangular 12.120412624682277 . -2.9457237897113475)

(define c206 (sub c10 c13))
;Value: c206

(type-tag c206)
;Value: complex

(contents c206)
;Value 42: (rectangular -8.080275083121519 . 5.891447579422695)

(define c207 (sub c11 c12))
;Value: c207

(type-tag c207)
;Value: complex

(contents c207)
;Value 43: (rectangular -3.0349057988113994 . -1.9512866909619677)

(define c208 (sub c13 c11))
;Value: c208

(type-tag c208)
;Value: complex

(contents c208)
;Value 44: (rectangular 7.075043340372159 . -6.885884678172075)

(define c211 (mul c10 c12))
;Value: c211

(type-tag c211)
;Value: complex

(contents c211)
;Value 45: (polar 0 . .63)

(define c212 (mul c11 c13))
;Value: c212

(type-tag c212)
;Value: complex

(contents c212)
;Value 46: (polar 14.139999999999999 . .15000000000000002)

(define c213 (mul c12 c13))
;Value: c213

(type-tag c213)
;Value: complex

(contents c213)
;Value 47: (polar 50 . 0.)

(define c216 (div c10 c12))
;Value: c216

(type-tag c216)
;Value: complex

(contents c216)
;Value 48: (polar 0 . -.63)

(define c217 (div c11 c12))
;Value: c217

(type-tag c217)
;Value: complex

(contents c217)
;Value 49: (polar .2828 . .15000000000000002)

(define c218 (div c12 c13))
;Value: c218

(type-tag c218)
;Value: complex

(contents c218)
;Value 50: (polar 1/2 . 1.26)

