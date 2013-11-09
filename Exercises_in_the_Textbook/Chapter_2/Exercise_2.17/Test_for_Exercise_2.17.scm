;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.17.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 27th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: last-pair

(last-pair (list 23 72 149 34))
;Value 21: (34)

(define one-through-four (list 1 2 3 4))
;Value: one-through-four

(last-pair one-through-four)
;Value 23: (4)

(define squares (list 1 4 9 16 25))
;Value: squares

(last-pair squares)
;Value 24: (25)


(define odds (list 1 3 5 7))
;Value: odds

(cdr odds)
;Value 22: (3 5 7)
