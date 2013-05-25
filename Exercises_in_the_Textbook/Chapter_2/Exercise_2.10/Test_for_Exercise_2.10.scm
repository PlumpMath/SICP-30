;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.10.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 25th, 2013
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

(define (print-interval i)
  (display "[")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "]"))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

;Value: make-interval

;Value: lower-bound

;Value: upper-bound

;Value: print-interval

;Value: mul-interval

;Value: div-interval

(define x (make-interval 4 10))
;Value: x

(define y (make-interval 2 5))
;Value: y

(define z (make-interval -2 2))
;Value: z

(print-interval (div-interval x y))
[.8,5.]
;Unspecified return value

(print-interval (div-interval x z))
;The dividing interval spans zero
;To continue, call RESTART with an option number:
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): y
;Starting debugger...


