;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Exercise_1.6.scm
;;                       originated from SICP
;;                       edited by Lawrence X. Amlord(颜世敏, aka 颜序)
;;                       informlarry@gmail.com
;;                       Apr 23rd, 2013
;;                       Xi'an, China

;; Copyright (C) 1984-2013 Harold Abelson and Gerald Jay Sussman
;; with Julie Sussman

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;Value: new-if

(new-if (= 2 3) 0 5)
;Value: 5

(new-if (= 1 1) 0 5)
;Value: 0

(define (square x)
  (* x x))
;Value: square

(define (average x y)
  (/ (+ x y) 2))
;Value: average

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
;Value: good-enough?

(define (improve guess x)
  (average guess (/ x guess)))
;Value: improve

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
;Value: sqrt-iter
(sqrt 2)

;Aborting!: maximum recursion depth exceeded

