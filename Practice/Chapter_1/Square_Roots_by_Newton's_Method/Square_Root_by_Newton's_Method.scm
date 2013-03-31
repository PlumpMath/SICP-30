;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;        Square Root by Newton's Method
;;
;;   The interpreter might report error while running this .scm file,
;; for many Scheme implementation take 'sqrt' here as a constant pri-
;; mitive. Dispite this, I still put them down here, since I believe 
;; practice promotes a better understanding. 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (square-root x)
  (sqrt-iter 1.0 x))


;; Test

(square-root 9)

(square-root (+ 100 37))

(square-root (+ (square-root 2) (square-root 3)))

(square (square-root 1000))