;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_1.45.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 17th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: fixed-point-of-transform

;Value: fixed-point

;Value: average-damp

;Value: repeated

(define cube
  (lambda (x)
    (* x x x)))
;Value: cube

(define (fourth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (cube y)))
                            (repeated average-damp 2)
                            1.0))
;Value: fourth-root

(fourth-root (* 6 6 6 6))
;Value: 6.

(fourth-root (* 999 999 999 999))
;Value: 999.

(fourth-root (* 10001 10001 10001 10001))
;Value: 10001.

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
;Value: expt

(define (fifth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 4)))
                            (repeated average-damp 2)
                            1.0))
;Value: fifth-root

(fifth-root (expt 4 5))
;Value: 4.000000066676982

(fifth-root (expt 299 5))
;Value: 298.9999999288808

(fifth-root (expt 1099 5))
;Value: 1099.0000000889913

(define (sixth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 5)))
                            (repeated average-damp 2)
                            1.0))
;Value: sixth-root

(sixth-root (expt 3 6))
;Value: 2.999999799117626

(sixth-root (expt 89 6))
;Value: 89.00000021985286

(sixth-root (expt 2012 6))
;Value: 2012.0000001764565

(define (seventh-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 6)))
                            (repeated average-damp 2)
                            1.0))
;Value: seventh-root

(seventh-root (expt 5 7))
;Value: 5.000000427207951

(seventh-root (expt 98 7))
;Value: 98.00000040711092

(seventh-root (expt 1999 7))
;Value: 1999.0000003393989

(define (eighth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 7)))
                            (repeated average-damp 2)
                            1.0))
;Value: eighth-root

(eighth-root (expt 100 8))
;Quit!

(define (eighth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 7)))
                            (repeated average-damp 3)
                            1.0))
;Value: eighth-root

(eighth-root (expt 100 8))
;Value: 100.

(eighth-root (expt 365 8))
;Value: 365.

(eighth-root (expt 1001 8))
;Value: 1001.

(define (nineth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 8)))
                            (repeated average-damp 3)
                            1.0))
;Value: nineth-root

(nineth-root (expt 16 9))
;Value: 15.999999962497867

(define (tenth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 9)))
                            (repeated average-damp 3)
                            1.0))
;Value: tenth-root

(nineth-root (expt 32 10))
;Value: 47.03150376917442

(define (eleventh-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 10)))
                            (repeated average-damp 3)
                            1.0))
;Value: eleventh-root

(eleventh-root (expt 64 11))
;Value: 64.00000016042839

(define (twelveth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 11)))
                            (repeated average-damp 3)
                            1.0))
;Value: twelveth-root

(twelveth-root (expt 128 12))
;Value: 127.99999971700788

(define (thirteenth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 12)))
                            (repeated average-damp 3)
                            1.0))
;Value: thirteenth-root

(thirteenth-root (expt 256 13))
;Value: 256.0000002471129

(define (fourteenth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 13)))
                            (repeated average-damp 3)
                            1.0))
;Value: fourteenth-root

(fourteenth-root (expt 512 14))
;Value: 511.99999964597305


(define (fifteenth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 14)))
                            (repeated average-damp 3)
                            1.0))
;Value: fifteenth-root

(fifteenth-root (expt 1024 15))
;Value: 1024.0000004256262

(define (sixteenth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 15)))
                            (repeated average-damp 3)
                            1.0))
;Value: sixteenth-root

(sixteenth-root (expt 2048 16))
;Quit!

(define (sixteenth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 15)))
                            (repeated average-damp 4)
                            1.0))
;Value: sixteenth-root

(sixteenth-root (expt 2048 16))
;Value: 2048.

(define (fortyth-root x)
  (fixed-point-of-transform (lambda (y)(/ x (expt y 39)))
                            (repeated average-damp 5)
                            1.0))
;Value: fortyth-root

(fortyth-root (expt 95 40))
;Value: 94.99999994278059

;Value: floor-log-2

;Value: nth-root

(nth-root (expt 9 7) 7)
;Value: 9.000000335802724

(nth-root (expt 89 24) 24)
;Value: 88.99999980123344

(nth-root (expt 12 60) 60)
;Value: 12.00000044150704



