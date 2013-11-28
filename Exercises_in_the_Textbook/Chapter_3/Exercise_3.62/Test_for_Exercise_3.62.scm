;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.62.scm
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



;Value: div-series

;Value: tangent-series

(stream-head tangent-series 10)
;Value 23: (0 1 0 1/3 0 2/15 0 17/315 0 62/2835)
