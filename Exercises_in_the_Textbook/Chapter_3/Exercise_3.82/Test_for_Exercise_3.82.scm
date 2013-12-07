;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.82.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 7th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜世敏, aka 颜序)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
	     (stream-for-each proc (stream-cdr s)))))
;Value: stream-for-each

(define (display-stream s)
  (stream-for-each display-line s))
;Value: display-stream

(define (display-line x)
  (newline)
  (display x))
;Value: display-line



(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))
;Value: monte-carlo

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
;Value: random-in-range

;Value: estimate-integral

(define (sum-of-squares x y)
  (+ (* x x) (* y y)))
;Value: sum-of-squares

(stream-head (estimate-integral (lambda (x y)
				  (<= (sum-of-squares (- x 5)
						      (- y 7))
				      9))
				2
				8
				4
				10)
	     10)
;Value 13: (36 36 36 36 36 36 36 36 36 36)

(define (unit-circle-test x y)
  (<= (sum-of-squares x y)
      1.0))
;Value: unit-circle-test

(define pi
  (estimate-integral unit-circle-test -1 1 -1 1))
;Value: pi

(display-stream pi)

4
4
4
4
4
4
... ; continue until the stack overflows

