;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.1.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 21th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-rat

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;Value: print-rat

(print-rat (make-rat 1 2))

1/2
;Unspecified return value

(print-rat (make-rat -1 -2))

1/2
;Unspecified return value

(print-rat (make-rat -1 2))

-1/2
;Unspecified return value

(print-rat (make-rat 1 -2))

-1/2
;Unspecified return value


