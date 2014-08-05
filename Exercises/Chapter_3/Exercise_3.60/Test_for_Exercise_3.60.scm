;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.60.scm
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Test for the Successively-Multiplying Implementation
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: mul-series

;Value: mul-item-by-all-items

(stream-head (add-streams (mul-series sine-series sine-series)
			  (mul-series cosine-series cosine-series))
	     10)
;Value 16: (1 0 0 0 0 0 0 0 0 0)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;       Test for the Scaling-Stream Implementation
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: mul-series

;Value: scale-stream

(stream-head (add-streams (mul-series sine-series sine-series)
			  (mul-series cosine-series cosine-series))
	     10)
;Value 17: (1 0 0 0 0 0 0 0 0 0)
