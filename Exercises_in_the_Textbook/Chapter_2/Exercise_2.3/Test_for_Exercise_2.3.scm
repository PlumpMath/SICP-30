;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.3.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 22nd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment p q) (cons p q))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

;Value: make-point

;Value: x-point

;Value: y-point

;Value: make-segment

;Value: start-segment

;Value: end-segment

;Value: a

;Value: b

;Value: c

;Value: d

;Value: m

;Value: l

;Value: n

;Value: length

;Value: peri-rec

;Value: area-rec


;; test for the rectangle represented by two adjcent line segments 

;Value: make-rec

;Value: m-rec

;Value: l-rec

;Value: r

;Value: width-rec

;Value: heigh-rec

(peri-rec r)
;Value: 14

(area-rec r)
;Value: 12


;; test for the rectangle represented by two parallel line segments 

;Value: make-rec

;Value: m-rec

;Value: n-rec

;Value: r

;Value: width-rec

;Value: heigh-rec

(peri-rec r)
;Value: 14

(area-rec r)
;Value: 12

