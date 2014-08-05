;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.2.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 21st, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-segment

;Value: start-segment

;Value: end-segment

;Value: make-point

;Value: x-point

;Value: y-point

;Value: midpoint-segment

;Value: average

;Value: print-point

(define origin (make-point 0 0))
;Value: origin

(x-point origin)
;Value: 0

(y-point origin)
;Value: 0

(print-point origin)

(0,0)
;Unspecified return value

(define p (make-point 1 3))
;Value: p

(x-point p)
;Value: 1

(y-point p)
;Value: 3

(define q (make-point 5 7))
;Value: q

(define s (make-segment p q))
;Value: s

(print-point (start-segment s))

(1,3)
;Unspecified return value

(print-point (end-segment s))

(5,7)
;Unspecified return value

(define m (midpoint-segment s))
;Value: m

(print-point m)

(3,5)
;Unspecified return value

