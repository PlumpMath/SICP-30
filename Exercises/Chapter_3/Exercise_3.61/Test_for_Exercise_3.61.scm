;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.61.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 28th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define ones (cons-stream 1 ones))
;Value: ones

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define integers
  (cons-stream 1
	       (add-streams ones integers)))
;Value: integers

(define (mul-streams s1 s2)
  (stream-map * s1 s2))
;Value: mul-streams

(define (integrate-series s)
  (mul-streams s
	       (div-streams ones integers)))
;Value: integrate-series

(define (div-streams s1 s2)
  (stream-map / s1 s2))
;Value: div-streams

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))
;Value: exp-series

(define cosine-series
  (cons-stream 1
	       (integrate-series
		(neg-stream sine-series))))
;Value: cosine-series

(define sine-series
  (cons-stream 0
	       (integrate-series cosine-series)))
;Value: sine-series

(define (neg-stream s)
  (stream-map (lambda (x) (* -1 x))
	      s))
;Value: neg-stream

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1) (stream-car s2))
	       (add-streams (scale-stream (stream-cdr s2) (stream-car s1))
			    (mul-series (stream-cdr s1) s2))))
;Value: mul-series

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
;Value: scale-stream



;Value: invert-unit-series

(stream-head (invert-unit-series ones) 10)
;Value 21: (1 -1 0 0 0 0 0 0 0 0)

(stream-head (invert-unit-series integers) 10)
;Value 22: (1 -2 1 0 0 0 0 0 0 0)

(stream-head (invert-unit-series exp-series) 10)
;Value 18: (1 -1 1/2 -1/6 1/24 -1/120 1/720 -1/5040 1/40320 -1/362880)

(stream-head (invert-unit-series sine-series) 10)
;Value 19: (1 -1 1 -5/6 2/3 -61/120 17/45 -277/1008 62/315 -50521/362880)

(stream-head (invert-unit-series cosine-series) 10)
;Value 20: (1 0 1/2 0 5/24 0 61/720 0 277/8064 0)

