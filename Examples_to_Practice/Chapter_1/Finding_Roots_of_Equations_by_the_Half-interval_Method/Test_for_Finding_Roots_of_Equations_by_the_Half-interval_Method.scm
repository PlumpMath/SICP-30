;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Finding_Roots_of_Equations_by_the_Half-interval_Method.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       May 11th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: search

;Value: close-enough?

;Value: half-interval-method

;Value: average

;Value: negative?

;Value: positive?

(half-interval-method sin 2.0 4.0)
;Value: 3.14111328125

(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
		      1.0
		      2.0)
;Value: 1.89306640625
