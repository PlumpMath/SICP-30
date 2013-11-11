;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.20.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       May 28th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: same-parity

;Value: select-elements

(define (even? n)
  (= (remainder n 2) 0))
;Value: even?

(define (odd? n)
  (not (= (remainder n 2) 0)))
;Value: odd?

(same-parity 1 2 3 4 5 6 7)
;Value 13: (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;Value 14: (2 4 6)
