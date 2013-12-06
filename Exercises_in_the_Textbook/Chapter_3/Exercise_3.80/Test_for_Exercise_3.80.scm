;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.80.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 6th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define (scale-stream s factor)
  (stream-map (lambda (x) (* x factor)) s))
;Value: scale-stream

(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream initial-value
		 (let ((integrand (force delayed-integrand)))
		   (add-streams (scale-stream integrand dt)
				int))))
  int)
;Value: integral



;Value: rlc

;Value: rlc1

(stream-ref (car (RLC1 10 0)) 0)
;Value: 10

(stream-ref (cdr (RLC1 10 0)) 0)
;Value: 0

(stream-ref (cdr (RLC1 10 0)) 1)
;Value: 5.

(stream-ref (car (RLC1 10 0)) 1)
;Value: 10

(stream-ref (car (RLC1 10 0)) 1000)
;Value: 4.1418104002099116e-64

(stream-ref (cdr (RLC1 10 0)) 1000)
;Value: 5.7238411981322924e-64
