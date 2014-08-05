;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_1.30.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 8th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sum-integers a b)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (sum identity a inc b))

(sum-integers 0 0)
;Value: 0

(sum-integers 0 1)
;Value: 1

(sum-integers 1 0)
;Value: 0

(sum-integers 0 -1)
;Value: 0

(sum-integers -1 0)
;Value: -1

(sum-integers 1 10)
;Value: 0

(sum-integers 1 100)
;Value: 5050

(sum-integers -10 0)
;Value: -55

(sum-integers -100 0)
;Value: -5050


(define (sum-cubes a b)
  (define (cube x)
    (* x x x))
  (define (inc x)
    (+ x 1))
  (sum cube a inc b))

(sum-cubes 0 0)
;Value: 0

(sum-cubes 0 1)
;Value: 1

(sum-cubes 1 0)
;Value: 0

(sum-cubes 0 -1)
;Value: 0

(sum-cubes -1 0)
;Value: -1

(sum-cubes 1 10)
;Value: 3025

(sum-cubes -10 -1)
;Value: -3025

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0
       (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))
;Value: 3.139592655589782
