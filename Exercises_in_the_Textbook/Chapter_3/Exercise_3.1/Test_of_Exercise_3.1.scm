;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.1.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Sept 11th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: make-accumulator

(define A (make-accumulator 5))
;Value: a

(A 10)
;Value: 15

(A 10)
;Value: 25

(define B (make-accumulator -1))
;Value: b

(b 1000)
;Value: 999

(b 1000)
;Value: 1999
