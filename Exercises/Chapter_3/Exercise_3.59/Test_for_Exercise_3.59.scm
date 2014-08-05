;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.59.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Nov 27th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Test for Subproblem a.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: integrate-series

(define (div-streams s1 s2)
  (stream-map / s1 s2))
;Value: div-streams

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

(stream-head (integrate-series ones) 10)
;Value 14: (1 1/2 1/3 1/4 1/5 1/6 1/7 1/8 1/9 1/10)

(stream-head (integrate-series integers) 10)
;Value 15: (1 1 1 1 1 1 1 1 1 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Test for Subproblem b.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: neg-stream

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))
;Value: exp-series

(stream-head exp-series 10)
;Value 16: (1 1 1/2 1/6 1/24 1/120 1/720 1/5040 1/40320 1/362880)

;Value: cosine-series

;Value: sine-series

(stream-head cosine-series 10)
;Value 23: (1 0 -1/2 0 1/24 0 -1/720 0 1/40320 0)

(stream-head sine-series 10)
;Value 24: (0 1 0 -1/6 0 1/120 0 -1/5040 0 1/362880)
