;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.14.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 26th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-interval a b)
  (cons a b))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))

(define (make-center-percent c p)
  (make-interval (* c (- 1.0 p))
		 (* c (+ 1.0 p))))

(define (percent i)
  (/ (width i) (center i)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i))
     2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

(define (print-center-percent i)
  (display (center i))
  (display " with ")
  (display (* 100 (percent i)))
  (display "% ")
  (display "tolerance."))

;Value: par1

;Value: par2

;Value: make-interval

;Value: lower-bound

;Value: upper-bound

;Value: add-interval

;Value: mul-interval

;Value: div-interval

;Value: make-center-percent

;Value: percent

;Value: center

;Value: width

;Value: print-center-percent

(define R1 (make-center-percent 1000 0.01))
;Value: r1

(define R2 (make-center-percent 500 0.005))
;Value: r2

(print-center-percent (par1 R1 R2))
333.414820473644 with 2.332966730822091% tolerance.
;Unspecified return value

(print-center-percent (par2 R1 R2))
333.3314813528717 with .6666750006250415% tolerance.
;Unspecified return value

(define A (make-center-percent 1600 0.00001))
;Value: a

(define B (make-center-percent 1200 0.00005))
;Value: b

(print-center-percent (div-interval A A))
1.0000000002 with 1.999999999796289e-3% tolerance.
;Unspecified return value

(print-center-percent (div-interval A B))
1.3333333373333334 with 5.999999997010664e-3% tolerance.
;Unspecified return value

