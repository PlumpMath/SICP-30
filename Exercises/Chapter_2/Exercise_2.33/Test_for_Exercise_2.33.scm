;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;                       Test_for_Exercise_2.33.scm
;;                       by Lawrence X. Amlord(颜序, aka 颜世敏)
;;                       informlarry@gmail.com
;;                       Jun 1st, 2013
;;                       Xi'an, China

;; Copyright (C) 2013 Lawrence X. Amlord(颜序, aka 颜世敏)
;; <informlarry@gmail.com>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define squares (list 1 4 9 16 25))
;Value: squares

(define odds (list 1 3 5 7))
;Value: odds

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

;Value: map

(map abs (list -10 2.5 -11.6 17))
;Value 19: (10 2.5 11.6 17)

(map sqrt squares)
;Value 21: (1 2 3 4 5)

;Value: append

(append squares odds)
;Value 20: (1 4 9 16 25 1 3 5 7)

(append odds squares)
;Value 22: (1 3 5 7 1 4 9 16 25)

;Value: length

(length odds)
;Value: 4

(length squares)
;Value: 5

