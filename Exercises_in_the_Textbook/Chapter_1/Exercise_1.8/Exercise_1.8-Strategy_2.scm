;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                     Exercise_1.8-Strategy_2.scm
;;                    by Lawrence R. Amlord (颜世敏)
;;                           Apr 3, 2013
;;                           Xi'an, China 
;;
;; License: Creative Commons Attribution-NonCommercial-ShareAlike 3.0 
;;          Unported
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; This implementation uses the improved 'good-enough?' test as it has
;; been implemented in Exercise 1.7.

(define (cbrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (cbrt-iter (improve guess x) guess x)))

(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess)) (* guess 0.001)))

(define (improve guess x)
  (trisect (+ (/ x (square guess))
              (* 2 guess))))

(define (trisect x)
  (/ x 3))

(define (square x)
  (* x x))

(define (cbrt x)
  (cbrt-iter 1.0 0 x))

(cbrt 8)

(cbrt 729)

