;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.11.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 26th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-interval a b)
  (cons a b))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

(define (print-interval i)
  (display "[")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "]"))

;Value: mul-interval

;Value: make-interval

;Value: lower-bound

;Value: upper-bound

;Value: print-interval

(define A (make-interval -8 -6))
;Value: a

(define B (make-interval -2 2))
;Value: b

(define C (make-interval 10 12))
;Value: c

(print-interval (mul-interval A A))
[36,64]
;Unspecified return value

(print-interval (mul-interval A B))
[-16,16]
;Unspecified return value

(print-interval (mul-interval A C))
[-96,-60]
;Unspecified return value

(print-interval (mul-interval B A))
[-16,16]
;Unspecified return value

(print-interval (mul-interval B B))
[-4,4]
;Unspecified return value

(print-interval (mul-interval B C))
[-24,24]
;Unspecified return value

(print-interval (mul-interval C A))
[-96,-60]
;Unspecified return value

(print-interval (mul-interval C B))
[-24,24]
;Unspecified return value

(print-interval (mul-interval C C))
[100,144]
;Unspecified return value
