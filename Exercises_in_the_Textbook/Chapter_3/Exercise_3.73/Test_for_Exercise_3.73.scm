;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_3.73.scm
;;                       by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Dec 5th, 2013
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

(define ones (cons-stream 1 ones))
;Value: ones

(define (add-streams s1 s2)
  (stream-map + s1 s2))
;Value: add-streams

(define (mul-streams s1 s2)
  (stream-map * s1 s2))
;Value: mul-streams

(define integers (cons-stream 1 (add-streams ones integers)))
;Value: integers

(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
;Value: scale-stream

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

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
		 (add-streams (scale-stream integrand dt)
			      int)))
  int)
;Value: integral

;Value: rc

(define RC1 (RC 5 1 0.5))
;Value: rc1

(display-stream (RC1 cosine-series 1.5))

6.5
2.
-.5
1.75
1.9583333333333333
1.7708333333333333
1.7638888888888888
1.7701388888888887
1.7702628968253966
1.7701512896825395
1.7701499118165784
1.7701511518959434
1.7701511623343218
1.7701511529397813
1.7701511528824276
1.770151152934046
1.7701511529342848
1.7701511529340699
1.770151152934069
1.7701511529340699
... ; continue until the stack overflows

