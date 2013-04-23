;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                       Exercise_1.7.scm
;;                 by Lawrence R. Amlord (颜世敏)
;;                         Apr. 3, 2013
;;                         Xi'an, China
;;
;; License: Creative Commons Attribution-NonCommercial-ShareAlike 3.0 
;;   Unported
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (good-enough? guess prev-guess)
  (< (abs (- guess prev-guess))(* guess 0.001)))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqroot x)
  (sqrt-iter 1.0 0 x))

(sqroot 0.00001)