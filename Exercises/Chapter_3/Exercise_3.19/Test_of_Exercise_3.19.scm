;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.19.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 22nd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: contain-cycle?

;Value: forward

(contain-cycle? '())
;Value: #f

(contain-cycle? (list 'a 'b 'c 'd))
;Value: #f

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
;Value: make-cycle

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
;Value: last-pair

(define z (make-cycle (list 'a 'b 'c)))
;Value: z

(contain-cycle? z)
;Value: #t

(define x (list 'a 'b))
;Value: x

(define z1 (cons x x))
;Value: z1

(contain-cycle? z1)
;Value: #f

(define z2 (cons (list 'a 'b) (list 'a 'b)))
;Value: z2

(contain-cycle? z2)
;Value: #f

