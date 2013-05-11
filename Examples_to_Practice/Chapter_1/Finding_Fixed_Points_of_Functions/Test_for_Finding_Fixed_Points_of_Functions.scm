;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Finding_Fixed_Points_of_Functions.scm
;;                       originated from SICP
;;                       edited by Lawrence R. Amlord(颜世敏)
;;                       informlarry@gmail.com
;;                       May 11th, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: tolerance

;Value: fixed-point

(fixed-point cos 1.0)
;Value: .7390855263619245

(fixed-point (lambda (y)
	       (+ (sin y)
		  (cos y)))
	     1.0)
;Value: 1.2587277968014188


;; Non-converged Fixed-point Search to Compute Square Root of x
(define (sqrt x)
  (fixed-point (lambda (y)
		 (/ x y))
	       1.0))
;Value: sqrt

(sqrt 2)
;; Never Terminates.
;Quit!


;; The Right Practice
(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (fixed-point (lambda (y)
		 (average y (/ x y)))
	       1.0))
;Value: sqrt

(sqrt 2)
;Value: 1.414213562373095