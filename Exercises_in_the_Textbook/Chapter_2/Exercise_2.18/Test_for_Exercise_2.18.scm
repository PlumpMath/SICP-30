;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.18.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 27th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: reverse

;Value: last-element

;Value: former-elements

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
;Value: list-ref

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
;Value: length

(reverse '())
;Value: ()

(reverse (list 0))
;Value 14: (0)

(reverse (list 1 4 9 16 25))
;Value 13: (25 16 9 4 1)

(reverse (list 1 2 3 4))
;Value 15: (4 3 2 1)

(reverse (list 1 3 5 7 9))
;Value 16: (9 7 5 3 1)

