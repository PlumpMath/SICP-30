;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.61.scm
;;                       by Lawrence R. Amlord(颜世敏 Shi-min Yan)
;;                       informlarry@gmail.com
;;                       Jul 20th, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence R. Amlord(颜世敏 Shi-min Yan)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Value: adjoin-set

(define A (adjoin-set 0 (list 1 2 3 4 5)))
;Value: a

(display A)
(0 1 2 3 4 5)
;Unspecified return value

(define B (adjoin-set '1958 '(1918 1945 1975 1984)))
;Value: b

(display B)
(1918 1945 1958 1975 1984)
;Unspecified return value
