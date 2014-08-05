;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                    Exercise_1.3.scm
;;               by Lawrence R. Amlord(颜世敏)
;;                      Apr 7, 2013
;;                      Xi'an, China
;;
;; License: Creative Commons Attribution-NonCommercial-ShareAlike 3.0 
;;          Unported
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sum-of-squares-of-two-largest a b c)
    (cond ((and (< a b) (< a c)) (sum-of-squares b c))
          ((and (< b a) (< b c)) (sum-of-squares a c))
          (sum-of-squares a b)))

(define (sum-of-squares x y)
    (+ (square x)
       (square y)))

(define (square x)
  (* x x))


;; Test

(define a 9)
(define b 4)
(define c 5)

(sum-of-squares-of-two-largest a b c)
