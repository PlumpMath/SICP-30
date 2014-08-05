;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_1.32.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 9th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tests for Accumulate in Recursion  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: accumulate

;Value: sum

;Value: product

(define (identity x) x)
;Value: identity

(define (inc x) (+ x 1))
;Value: inc


(define (sum-integers a b)
  (sum identity a inc b))
;Value: sum-integers

(sum-integers 0 0)
;Value: 0

(sum-integers 0 1)
;Value: 1

(sum-integers 1 0)
;Value: 0

(sum-integers 1 10)
;Value: 55

(sum-integers 1 100)
;Value: 5050

(sum-integers 0 -1)
;Value: 0

(sum-integers -1 0)
;Value: -1

(sum-integers -10 -1)
;Value: -55

(sum-integers -100 -1)
;Value: -5050


(define (cube x) (* x x x))
;Value: cube

(define (sum-cubes a b)
  (sum cube a inc b))
;Value: sum-cubes

(sum-cubes 0 0)
;Value: 0

(sum-cubes 0 1)
;Value: 1

(sum-cubes 1 0)
;Value: 0

(sum-cubes 1 10)
;Value: 3025

(sum-cubes 1 100)
;Value: 25502500

(sum-cubes 0 -1)
;Value: 0

(sum-cubes -1 0)
;Value: -1

(sum-cubes -10 -1)
;Value: -3025

(sum-cubes -100 -1)
;Value: -25502500


(define (factorial n)
  (product identity 1 inc n))
;Value: factorial

(factorial 0)
;Value: 1

(factorial 1)
;Value: 1

(factorial 6)
;Value: 720

(factorial 10)
;Value: 3628800





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tests for Accumulate in Iteration  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: iaccumulate

;Value: isum

;Value: iproduct


(define (iSum-integers a b)
  (iSum identity a inc b))
;Value: isum-integers

(iSum-integers 0 0)
;Value: 0

(iSum-integers 0 1)
;Value: 1

(iSum-integers 1 0)
;Value: 0

(iSum-integers 1 10)
;Value: 55

(iSum-integers 1 100)
;Value: 5050

(iSum-integers -1 0)
;Value: -1

(iSum-integers 0 -1)
;Value: 0

(iSum-integers -10 -1)
;Value: -55

(iSum-integers -100 -1)
;Value: -5050


(define (iSum-cubes a b)
  (iSum cube a inc b))
;Value: isum-cubes

(iSum-cubes 0 0)
;Value: 0

(iSum-cubes 0 1)
;Value: 1

(iSum-cubes 1 0)
;Value: 0

(iSum-cubes 0 10)
;Value: 3025

(iSum-cubes 0 100)
;Value: 25502500

(iSum-cubes -1 0)
;Value: -1

(iSum-cubes 0 -1)
;Value: 0

(iSum-cubes -10 -1)
;Value: -3025

(iSum-cubes -100 -1)
;Value: -25502500


(define (iFactorial n)
  (iProduct identity 1 inc n))
;Value: ifactorial

(iFactorial 0)
;Value: 1

(iFactorial 1)
;Value: 1

(iFactorial 6)
;Value: 720

(iFactorial 10)
;Value: 3628800

