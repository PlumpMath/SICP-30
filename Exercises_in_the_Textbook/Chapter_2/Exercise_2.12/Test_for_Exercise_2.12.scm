;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.12.scm
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

(define (width i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

(define (print-center-percent i)
  (display (center i))
  (display " with ")
  (display (* 100 (percent i)))
  (display "% ")
  (display "tolerance."))

;Value: make-center-percent

;Value: percent

;Value: center

;Value: make-interval

;Value: lower-bound

;Value: upper-bound

;Value: width

;Value: print-center-percent

(print-center-percent (make-center-percent 1.0 0.06))
1. with 6.000000000000005% tolerance
;Unspecified return value

(print-center-percent (make-center-percent 8 0.005))
8. with .4999999999999949% tolerance
;Unspecified return value

(print-center-percent (make-center-percent 1024.0 0.0125))
1024. with 1.2499999999999956% tolerance
;Unspecified return value

