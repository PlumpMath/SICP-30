;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Arithmetic_Operations_for_Rational_Numbers.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       May 21st, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: add-rat

;Value: sub-rat

;Value: mul-rat

;Value: div-rat

;Value: equal-rat?

;Value: make-rat

;Value: numer

;Value: denom

;Value: print-rat

(define one-half (make-rat 1 2))
;Value: one-half

(print-rat one-half)

1/2
;Unspecified return value

(define one-third (make-rat 1 3))
;Value: one-third

(print-rat one-third)

1/3
;Unspecified return value

(print-rat (add-rat one-half one-third))

5/6
;Unspecified return value

(print-rat (mul-rat one-half one-third))

1/6
;Unspecified return value

(print-rat (add-rat one-third one-third))

6/9
;Unspecified return value

;Value: make-rat

;Value: gcd

(print-rat (add-rat one-third one-third))

2/3
;Unspecified return value

