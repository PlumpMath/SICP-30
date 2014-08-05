;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_of_Exercise_3.17.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Sept 22nd, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: count-pairs

(count-pairs '())
;Value: 0

(count-pairs '(a b c d e))
;Value: 5

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
;Value: last-pair

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
;Value: make-cycle

(define z (make-cycle (list 'a 'b 'c 'd)))
;Value: z

(count-pairs z)
;Value: 4

(define x (list 'a 'b))
;Value: x

(define z1 (cons x x))
;Value: z1

(count-pairs x)
;Value: 2

(define z2 (cons (list 'a 'b) (list 'a 'b)))
;Value: z2

(count-pairs z2)
;Value: 5

