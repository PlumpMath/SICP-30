;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.18.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       May 27th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: reverse

(reverse (list 1 4 9 16 25))
;Value 23: (25 16 9 4 1)

(define one-through-four (list 1 2 3 4))
;Value: one-through-four

(reverse one-through-four)
;Value 25: (4 3 2 1)

(define odds (list 1 3 5 7 9))
;Value: odds

(reverse odds)
;Value 24: (9 7 5 3 1)

