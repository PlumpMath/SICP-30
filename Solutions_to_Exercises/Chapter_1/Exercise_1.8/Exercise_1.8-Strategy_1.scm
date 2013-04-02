;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                    SICP Exercise 1.8 (Strategy 1)
;;          Author: Lawrence R. Amlord (颜世敏)    Date: Apr. 3, 2013
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This implementation uses original 'good-enough?' test as it has been
;; implemented in the text.

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube x)
  (* x x x))

(define (improve guess x)
  (trisect (+ (/ x (square guess))
              (* 2 guess))))

(define (trisect x)
  (/ x 3))

(define (square x)
  (* x x))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(cbrt 8)

(cbrt 729)
